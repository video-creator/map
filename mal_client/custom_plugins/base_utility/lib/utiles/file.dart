import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

enum SeekOrigin { set, cur, end }

class LocalFileReader {
  final RandomAccessFile _raf;
  final int _cacheSize;
  Uint8List _cache = Uint8List(0);
  int _cacheStart = 0; // 缓存起点在文件中的偏移
  int _cursor = 0; // 逻辑光标
  late final int _fileLength; // 文件长度
  final _lock = Lock(); // 用来实现并发锁，保护文件访问的互斥。

  LocalFileReader._(this._raf, this._cacheSize, this._fileLength);

  static Future<LocalFileReader> open(String path, {int cacheSize = 4 * 1024}) async {
    final raf = await File(path).open(mode: FileMode.read);
    final len = await raf.length();
    return LocalFileReader._(raf, cacheSize, len);
  }

  // ————————— SEEK —————————
  Future<void> seek(int offset, {SeekOrigin origin = SeekOrigin.cur}) async {
    await _lock.synchronized(() async {
      int newPos;
      switch (origin) {
        case SeekOrigin.set:
          newPos = offset;
          break;
        case SeekOrigin.cur:
          newPos = _cursor + offset;
          break;
        case SeekOrigin.end:
          newPos = _fileLength + offset;
          break;
      }
      if (newPos < 0) {
        throw RangeError('seek resulting position < 0');
      }
      _cursor = newPos;
      // 若逻辑光标已不在缓存范围内则丢弃缓存
      if (_cursor < _cacheStart || _cursor >= _cacheStart + _cache.length) {
        _cache = Uint8List(0);
      }
    });
  }

  Future<int> position() async => _lock.synchronized(() async => _cursor);

  Future<int> length() async => _lock.synchronized(() async => _fileLength);

  Future<void> close() async => _lock.synchronized(() => _raf.close());

  // ————————— 读取字节 —————————
  Future<Uint8List> read(int length) async {
    if (length <= 0) return Uint8List(0);
    return _lock.synchronized(() async {
      // 命中缓存
      final int cacheEnd = _cacheStart + _cache.length;
      if (_cursor >= _cacheStart && _cursor + length <= cacheEnd) {
        final slice = Uint8List.sublistView(
            _cache, _cursor - _cacheStart, _cursor - _cacheStart + length);
        _cursor += length;
        return slice;
      }
      // 如果需要读取的块过长，直接从文件读取
      if (length >= _cacheSize) {
        await _raf.setPosition(_cursor);
        final bytes = await _raf.read(length);
        _cursor += bytes.length;
        return bytes;
      }
      // 重新填充缓存
      _cacheStart = _cursor;
      await _raf.setPosition(_cacheStart);
      _cache = await _raf.read(_cacheSize);
      final slice = Uint8List.sublistView(_cache, 0, length);
      _cursor += slice.length;
      return slice;
    });
  }

  // ————————— 快捷类型读取 —————————
  Future<int> readUint8() async => (await read(1))[0];

  Future<int> readInt16LE() async => _bd(await read(2)).getInt16(0, Endian.little);

  Future<int> readInt16BE() async => _bd(await read(2)).getInt16(0, Endian.big);

  Future<int> readInt32LE() async => _bd(await read(4)).getInt32(0, Endian.little);

  Future<int> readInt32BE() async => _bd(await read(4)).getInt32(0, Endian.big);

  Future<double> readFloat64LE() async => _bd(await read(8)).getFloat64(0, Endian.little);

  Future<double> readFloat64BE() async => _bd(await read(8)).getFloat64(0, Endian.big);

  ByteData _bd(Uint8List u) => u.buffer.asByteData();
}

// 辅助类 Lock，用于异步锁的实现
class Lock {
  Completer<void>? _completer;

  Future<T> synchronized<T>(Future<T> Function() action) async {
    while (_completer != null) {
      await _completer!.future;
    }

    _completer = Completer<void>();
    try {
      return await action();
    } finally {
      _completer!.complete();
      _completer = null;
    }
  }
}
