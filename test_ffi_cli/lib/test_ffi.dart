import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'proto_gen/mal_service.pb.dart';

// ═══════════════════════════════════════════════════════
// FFI 类型定义（与 C++ mdp_ffi_types.h 对应）
// ═══════════════════════════════════════════════════════

final class MDPBuffer extends Struct {
  external Pointer<Uint8> data;

  @Int32()
  external int size;
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

typedef MdpFreeBufferNative = Void Function(Pointer<MDPBuffer> buf);
typedef MdpFreeBufferDart = void Function(Pointer<MDPBuffer> buf);

typedef MdpCloseNative = Void Function(Pointer<Void> session);
typedef MdpCloseDart = void Function(Pointer<Void> session);

// ═══════════════════════════════════════════════════════
// 主测试逻辑
// ═══════════════════════════════════════════════════════

void main(List<String> args) {
  if (args.length < 2) {
    print('用法: dart run lib/test_ffi.dart <dylib_path> <media_file_path>');
    print('示例: dart run lib/test_ffi.dart /path/to/libmdp.dylib /path/to/video.mp4');
    exit(1);
  }

  final dylibPath = args[0];
  final mediaPath = args[1];

  print('=' * 60);
  print('FFI CLI 测试工具');
  print('=' * 60);
  print('dylib 路径: $dylibPath');
  print('媒体文件:  $mediaPath');

  // 1. 检查文件是否存在
  if (!File(dylibPath).existsSync()) {
    print('错误: dylib 文件不存在: $dylibPath');
    exit(1);
  }
  if (!File(mediaPath).existsSync()) {
    print('错误: 媒体文件不存在: $mediaPath');
    exit(1);
  }
  print('文件存在性检查通过');
  print('');

  // 2. 加载动态库
  print('--- 步骤 1: 加载动态库 ---');
  DynamicLibrary lib;
  try {
    lib = DynamicLibrary.open(dylibPath);
    print('动态库加载成功');
  } catch (e) {
    print('错误: 动态库加载失败: $e');
    exit(1);
  }

  // 3. 绑定函数
  print('');
  print('--- 步骤 2: 绑定函数 ---');
  final createSession = lib.lookupFunction<MdpCreateSessionNative, MdpCreateSessionDart>('mdp_create_session');
  final destroySession = lib.lookupFunction<MdpDestroySessionNative, MdpDestroySessionDart>('mdp_destroy_session');
  final parseFile = lib.lookupFunction<MdpParseFileNative, MdpParseFileDart>('mdp_parse_file');
  final getAllStreamInfo = lib.lookupFunction<MdpGetAllStreamInfoNative, MdpGetAllStreamInfoDart>('mdp_get_all_stream_info');
  final freeBuffer = lib.lookupFunction<MdpFreeBufferNative, MdpFreeBufferDart>('mdp_free_buffer');
  final close = lib.lookupFunction<MdpCloseNative, MdpCloseDart>('mdp_close');
  print('函数绑定成功');

  // 4. 创建会话
  print('');
  print('--- 步骤 3: 创建会话 ---');
  final session = createSession();
  if (session == nullptr) {
    print('错误: 创建会话失败');
    exit(1);
  }
  print('会话创建成功, session pointer: ${session.address}');

  // 5. 解析文件
  print('');
  print('--- 步骤 4: 解析媒体文件 ---');
  final pathPtr = mediaPath.toNativeUtf8();
  Pointer<MDPBuffer> bufPtr;
  try {
    print('调用 mdp_parse_file...');
    bufPtr = parseFile(session, pathPtr);
    print('mdp_parse_file 返回, pointer: ${bufPtr.address}');
  } catch (e) {
    print('错误: parseFile 调用崩溃: $e');
    print('堆栈: ${StackTrace.current}');
    exit(1);
  } finally {
    calloc.free(pathPtr);
  }

  if (bufPtr == nullptr) {
    print('结果: parseFile 返回 NULL!');
    print('可能原因:');
    print('  1. 文件格式不支持 (非 mp4/webp/flv/mkv/png/jpg)');
    print('  2. 文件访问被拒绝 (macOS 沙箱问题)');
    print('  3. C++ 解析器内部错误 (如 protobuf 序列化失败)');
    exit(1);
  }

  // 6. 读取数据
  print('');
  print('--- 步骤 5: 读取解析结果 ---');
  final buf = bufPtr.ref;
  final length = buf.size;
  final dataPtr = buf.data;
  print('MDPBuffer: size=$length, data_pointer=${dataPtr.address}');

  if (length <= 0 || dataPtr == nullptr) {
    print('错误: MDPBuffer 数据无效 (size=$length, ptr=${dataPtr.address})');
    freeBuffer(bufPtr);
    exit(1);
  }

  // 拷贝到 Dart 堆
  final view = dataPtr.asTypedList(length);
  final bytes = Uint8List.fromList(view);
  print('数据已拷贝到 Dart 堆, bytes.length=${bytes.length}');
  freeBuffer(bufPtr);
  print('C++ 内存已释放');

  // 7. 反序列化 protobuf
  print('');
  print('--- 步骤 6: 反序列化 ParseFileResponse ---');
  try {
    final response = ParseFileResponse.fromBuffer(bytes);
    print('反序列化成功');
    print('  base.success = ${response.base.success}');
    print('  base.errorMessage = "${response.base.errorMessage}"');
    print('  context 存在 = ${response.hasContext()}');
    if (response.hasContext()) {
      final ctx = response.context;
      print('  stream count = ${ctx.streams.length}');
      print('  rootAtom 存在 = ${ctx.hasRootAtom()}');
      if (ctx.hasRootAtom()) {
        print('  rootAtom.name = ${ctx.rootAtom.name}');
      }
      for (var i = 0; i < ctx.streams.length && i < 5; i++) {
        final s = ctx.streams[i];
        print('  stream[$i]: index=${s.index}, mediaType=${s.mediaType}, codec=${s.codecName}');
      }
    }

    if (!response.base.success) {
      print('');
      print('!!! 解析返回 success=false !!!');
      print('错误信息: ${response.base.errorMessage}');
    }
  } catch (e) {
    print('错误: 反序列化失败: $e');
    print('bytes 前 20 个字节: ${bytes.take(20)}');
    exit(1);
  }

  // 8. 获取 all stream info
  print('');
  print('--- 步骤 7: 获取 AllStreamInfo ---');
  try {
    final infoBufPtr = getAllStreamInfo(session);
    if (infoBufPtr == nullptr) {
      print('getAllStreamInfo 返回 NULL');
    } else {
      final infoBuf = infoBufPtr.ref;
      final infoLen = infoBuf.size;
      final infoPtr = infoBuf.data;
      print('AllStreamInfo: size=$infoLen');
      if (infoLen > 0 && infoPtr != nullptr) {
        final infoView = infoPtr.asTypedList(infoLen);
        final infoBytes = Uint8List.fromList(infoView);
        freeBuffer(infoBufPtr);
        try {
          final allInfo = GetAllStreamInfoResponse.fromBuffer(infoBytes);
          print('  反序列化成功');
          print('  流数量: ${allInfo.streams.length}');
          for (var i = 0; i < allInfo.streams.length; i++) {
            final s = allInfo.streams[i];
            print('  stream[$i]: index=${s.index}, type=${s.mediaType}, codec=${s.codecName}');
          }
        } catch (e) {
          print('  protobuf 反序列化失败: $e');
        }
      }
    }
  } catch (e) {
    print('getAllStreamInfo 出错: $e');
  }

  // 9. 关闭会话
  print('');
  print('--- 步骤 8: 关闭会话 ---');
  close(session);
  destroySession(session);
  print('会话已关闭');

  print('');
  print('=' * 60);
  print('测试完成!');
  print('=' * 60);
}