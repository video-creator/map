import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';

// ═══════════════════════════════════════════════════════
// FFI 类型定义（与 C++ mdp_ffi_types.h 对应）
// ═══════════════════════════════════════════════════════

final class MDPBuffer extends Struct {
  external Pointer<Uint8> data;

  @Int32()
  external int size;
}

final class MDPFrameData extends Struct {
  external Pointer<Uint8> data;

  @Int32()
  external int size;

  @Int32()
  external int width;

  @Int32()
  external int height;

  @Int32()
  external int pixelFormat;
}

// ═══════════════════════════════════════════════════════
// 本地 C 函数类型定义
// ═══════════════════════════════════════════════════════

typedef MdpCreateSessionNative = Pointer<Void> Function();
typedef MdpCreateSessionDart = Pointer<Void> Function();

typedef MdpDestroySessionNative = Void Function(Pointer<Void> session);
typedef MdpDestroySessionDart = void Function(Pointer<Void> session);

typedef MdpParseFileNative = Pointer<MDPBuffer> Function(
    Pointer<Void> session, Pointer<Utf8> path);
typedef MdpParseFileDart = Pointer<MDPBuffer> Function(
    Pointer<Void> session, Pointer<Utf8> path);

typedef MdpGetAllStreamInfoNative = Pointer<MDPBuffer> Function(
    Pointer<Void> session);
typedef MdpGetAllStreamInfoDart = Pointer<MDPBuffer> Function(
    Pointer<Void> session);

typedef MdpGetFormatContextNative = Pointer<MDPBuffer> Function(
    Pointer<Void> session);
typedef MdpGetFormatContextDart = Pointer<MDPBuffer> Function(
    Pointer<Void> session);

typedef MdpLoadPacketsNative = Pointer<MDPBuffer> Function(
    Pointer<Void> session, Int32 streamIndex, Int32 size);
typedef MdpLoadPacketsDart = Pointer<MDPBuffer> Function(
    Pointer<Void> session, int streamIndex, int size);

typedef MdpLoadFramesNative = Pointer<MDPBuffer> Function(
    Pointer<Void> session, Int32 streamIndex, Int32 start, Int32 size);
typedef MdpLoadFramesDart = Pointer<MDPBuffer> Function(
    Pointer<Void> session, int streamIndex, int start, int size);

typedef MdpLoadOneFrameDetailNative = Pointer<MDPBuffer> Function(
    Pointer<Void> session, Int32 streamIndex, Int64 pos);
typedef MdpLoadOneFrameDetailDart = Pointer<MDPBuffer> Function(
    Pointer<Void> session, int streamIndex, int pos);

typedef MdpLoadOneFrameDataNative = Pointer<MDPFrameData> Function(
    Pointer<Void> session, Int32 streamIndex, Int64 pos);
typedef MdpLoadOneFrameDataDart = Pointer<MDPFrameData> Function(
    Pointer<Void> session, int streamIndex, int pos);

typedef MdpFreeBufferNative = Void Function(Pointer<MDPBuffer> buf);
typedef MdpFreeBufferDart = void Function(Pointer<MDPBuffer> buf);

typedef MdpFreeFrameDataNative = Void Function(Pointer<MDPFrameData> frame);
typedef MdpFreeFrameDataDart = void Function(Pointer<MDPFrameData> frame);

typedef MdpCloseNative = Void Function(Pointer<Void> session);
typedef MdpCloseDart = void Function(Pointer<Void> session);

// ═══════════════════════════════════════════════════════
// FFI 客户端
// ═══════════════════════════════════════════════════════

/// 通过 dart:ffi 直接调用 C++ 解析库 (libmdp) 的客户端。
///
/// 所有返回 protobuf 数据的接口，返回原始字节数组，
/// 调用方用对应的 `.pb.dart` 的 `fromBuffer()` 反序列化。
///
/// 帧裸数据接口 `loadOneFrameData` 返回 [MDPFrameData] 结构体，
/// 可直接用于渲染，无需 protobuf 反序列化。
class MdpFfiClient {
  late final DynamicLibrary _lib;
  late final Pointer<Void> _session;

  // 函数指针
  late final MdpCreateSessionDart _createSession;
  late final MdpDestroySessionDart _destroySession;
  late final MdpParseFileDart _parseFile;
  late final MdpGetAllStreamInfoDart _getAllStreamInfo;
  late final MdpGetFormatContextDart _getFormatContext;
  late final MdpLoadPacketsDart _loadPackets;
  late final MdpLoadFramesDart _loadFrames;
  late final MdpLoadOneFrameDetailDart _loadOneFrameDetail;
  late final MdpLoadOneFrameDataDart _loadOneFrameData;
  late final MdpFreeBufferDart _freeBuffer;
  late final MdpFreeFrameDataDart _freeFrameData;
  late final MdpCloseDart _close;

  MdpFfiClient() {
    _lib = _loadLibrary();
    _bindFunctions();
    _session = _createSession();
  }

  static DynamicLibrary _loadLibrary() {
    if (Platform.isMacOS) {
      // 从 app bundle 的 Frameworks 目录加载（由 Bundle Framework build phase 嵌入）
      final executableDir = File(Platform.resolvedExecutable).parent;
      final frameworksDir = '${executableDir.path}/../Frameworks';
      final libPath = '$frameworksDir/libmdp.dylib';
      debugPrint('Loading libmdp.dylib from: $libPath');
      return DynamicLibrary.open(libPath);
    } else if (Platform.isLinux) {
      return DynamicLibrary.open('libmdp.so');
    } else if (Platform.isWindows) {
      return DynamicLibrary.open('mdp.dll');
    }
    throw UnsupportedError(
        'Unsupported platform: ${Platform.operatingSystem}');
  }

  void _bindFunctions() {
    _createSession = _lib
        .lookupFunction<MdpCreateSessionNative, MdpCreateSessionDart>(
            'mdp_create_session');
    _destroySession = _lib
        .lookupFunction<MdpDestroySessionNative, MdpDestroySessionDart>(
            'mdp_destroy_session');
    _parseFile =
        _lib.lookupFunction<MdpParseFileNative, MdpParseFileDart>(
            'mdp_parse_file');
    _getAllStreamInfo = _lib.lookupFunction<
        MdpGetAllStreamInfoNative, MdpGetAllStreamInfoDart>(
        'mdp_get_all_stream_info');
    _getFormatContext = _lib.lookupFunction<
        MdpGetFormatContextNative, MdpGetFormatContextDart>(
        'mdp_get_format_context');
    _loadPackets =
        _lib.lookupFunction<MdpLoadPacketsNative, MdpLoadPacketsDart>(
            'mdp_load_packets');
    _loadFrames =
        _lib.lookupFunction<MdpLoadFramesNative, MdpLoadFramesDart>(
            'mdp_load_frames');
    _loadOneFrameDetail = _lib.lookupFunction<
        MdpLoadOneFrameDetailNative, MdpLoadOneFrameDetailDart>(
        'mdp_load_one_frame_detail');
    _loadOneFrameData = _lib.lookupFunction<
        MdpLoadOneFrameDataNative, MdpLoadOneFrameDataDart>(
        'mdp_load_one_frame_data');
    _freeBuffer =
        _lib.lookupFunction<MdpFreeBufferNative, MdpFreeBufferDart>(
            'mdp_free_buffer');
    _freeFrameData = _lib.lookupFunction<
        MdpFreeFrameDataNative, MdpFreeFrameDataDart>(
        'mdp_free_frame_data');
    _close =
        _lib.lookupFunction<MdpCloseNative, MdpCloseDart>('mdp_close');
  }

  // ──── 公开 API ────

  /// 解析媒体文件，返回序列化的 ParseFileResponse 字节。
  Uint8List? parseFile(String path) {
    debugPrint('[ffi_debug] parseFile called, path=$path');
    debugPrint('[ffi_debug] _session=${_session.address}');
    final pathPtr = path.toNativeUtf8();
    try {
      debugPrint('[ffi_debug] calling _parseFile...');
      final bufPtr = _parseFile(_session, pathPtr);
      debugPrint('[ffi_debug] _parseFile returned, bufPtr=${bufPtr.address}');
      if (bufPtr == nullptr) {
        debugPrint('[ffi_debug] bufPtr is NULL - C++ returned null!');
        return null;
      }
      final result = _readBuffer(bufPtr);
      debugPrint('[ffi_debug] _readBuffer done, result.length=${result.length}');
      return result;
    } catch (e) {
      debugPrint('[ffi_debug] CRASH in parseFile: $e');
      rethrow;
    } finally {
      calloc.free(pathPtr);
      debugPrint('[ffi_debug] pathPtr freed');
    }
  }

  /// 获取所有流信息，返回序列化的 GetAllStreamInfoResponse 字节。
  Uint8List? getAllStreamInfo() {
    final bufPtr = _getAllStreamInfo(_session);
    if (bufPtr == nullptr) return null;
    return _readBuffer(bufPtr);
  }

  /// 获取 FormatContext，返回序列化的 ParseFileResponse 字节。
  Uint8List? getFormatContext() {
    final bufPtr = _getFormatContext(_session);
    if (bufPtr == nullptr) return null;
    return _readBuffer(bufPtr);
  }

  /// 加载数据包，返回序列化的 LoadPacketsResponse 字节。
  Uint8List? loadPackets(int streamIndex, int size) {
    final bufPtr = _loadPackets(_session, streamIndex, size);
    if (bufPtr == nullptr) return null;
    return _readBuffer(bufPtr);
  }

  /// 加载解码帧（元数据），返回序列化的 LoadFramesResponse 字节。
  Uint8List? loadFrames(int streamIndex, int start, int size) {
    final bufPtr = _loadFrames(_session, streamIndex, start, size);
    if (bufPtr == nullptr) return null;
    return _readBuffer(bufPtr);
  }

  /// 获取单帧详细信息，返回序列化的 LoadOneFrameResponse 字节。
  Uint8List? loadOneFrameDetail(int streamIndex, int pos) {
    final bufPtr = _loadOneFrameDetail(_session, streamIndex, pos);
    if (bufPtr == nullptr) return null;
    return _readBuffer(bufPtr);
  }

  /// 获取单帧裸像素数据（高性能路径，不走 protobuf）。
  ///
  /// 返回 [MDPFrameData] 包含裸像素数据指针，调用方必须调用 [freeFrameData] 释放。
  /// 返回 null 表示失败。
  MDPFrameData? loadOneFrameData(int streamIndex, int pos) {
    final framePtr = _loadOneFrameData(_session, streamIndex, pos);
    if (framePtr == nullptr) return null;
    return framePtr.ref;
  }

  /// 释放 [loadOneFrameData] 返回的帧数据。
  void freeFrameData(Pointer<MDPFrameData> frame) {
    _freeFrameData(frame);
  }

  /// 关闭会话，释放所有解析资源。
  void close() {
    _close(_session);
    _destroySession(_session);
  }

  // ──── 内部辅助 ────

  /// 从 MDPBuffer 读取数据并释放资源
  /// 注意：必须在释放 native 内存前拷贝数据
  Uint8List _readBuffer(Pointer<MDPBuffer> bufPtr) {
    final buf = bufPtr.ref;
    final length = buf.size;
    final ptr = buf.data;
    debugPrint('[ffi_debug] _readBuffer: length=$length, ptr=${ptr.address}');
    if (length <= 0 || ptr == nullptr) {
      debugPrint('[ffi_debug] _readBuffer: invalid data!');
      _freeBuffer(bufPtr);
      return Uint8List(0);
    }
    // 先拷贝到 Dart 堆，再释放 C++ 内存（防 use-after-free）
    final view = ptr.asTypedList(length);
    debugPrint('[ffi_debug] view created, view.length=${view.length}');
    final result = Uint8List.fromList(view);
    debugPrint('[ffi_debug] copied to Dart heap, result.length=${result.length}');
    _freeBuffer(bufPtr);
    debugPrint('[ffi_debug] native buffer freed');
    return result;
  }
}