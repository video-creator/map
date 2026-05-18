import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:macos_render_plugin/macos_render_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  final int width = 720;
  final int height = 1280;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _macosRenderPlugin = MacosRenderPlugin();
  int? _textureId;
  Timer? _timer;
  static const MethodChannel _channel = MethodChannel('macos_render_plugin');
  @override
  void initState() {
    super.initState();
    initPlatformState();
    _initializeTexture();
  }
  Future<void> _initializeTexture() async {
    // 1. 请求原生创建一个纹理
    final int textureId = await _channel.invokeMethod('createTexture');

    setState(() {
      _textureId = textureId;
    });

    // 2. 模拟视频帧更新 (例如每 33ms 发送一帧数据)
    // 实际项目中，这里应该是从 FFMpeg 或 Socket 读取的数据
    _timer = Timer.periodic(const Duration(milliseconds: 33), (timer) {
      // _sendFrameData();
      _sendTestHDRFrame();
    });

  }
  Future<void> _sendTestHDRFrame() async {
    if (_textureId == null) return;

    final int width = widget.width;
    final int height = widget.height;

    // --- P010 (10-bit NV12) 格式计算 ---
    // Y 平面: 每个像素 2 字节 (UInt16)
    // UV 平面: 宽高均为 Y 的一半，但每个点包含 U 和 V (各 2 字节)，所以行宽和 Y 一样
    // 总大小 = (width * 2 * height) + (width * 2 * (height / 2))
    //        = width * height * 3
    final int totalSize = width * height * 3;
    final ByteData data = ByteData(totalSize);

    // 10-bit 范围是 0 - 1023
    // SDR 白色通常在 512 左右 (视具体传递函数而定，HLG 50% 约为 100 nits)
    // HDR 高光我们设定为 940 - 1023 (接近峰值亮度)

    // --- 填充 Y 平面 (亮度) ---
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int offset = (y * width + x) * 2;

        int lumaValue;
        if (x < width / 2) {
          // 左半边：HDR 高亮测试
          // 制造一个从 600 到 1023 的超亮渐变
          double ratio = x / (width / 2);
          lumaValue = 600 + (423 * ratio).toInt();
        } else {
          // 右半边：SDR 普通亮度测试
          // 制造一个从 64 到 235 的普通渐变 (标准视频范围)
          double ratio = (x - width / 2) / (width / 2);
          lumaValue = 64 + (171 * ratio).toInt();
        }

        // 小端序写入 UInt16
        data.setUint16(offset, lumaValue, Endian.little);
      }
    }

    // --- 填充 UV 平面 (色度) ---
    // 设置为 512 (中性灰)，这样画面就是黑白的，只测试亮度
    int uvStartOffset = width * height * 2;
    int uvHeight = height ~/ 2;
    int uvWidth = width ~/ 2;

    for (int y = 0; y < uvHeight; y++) {
      for (int x = 0; x < uvWidth; x++) {
        int offset = uvStartOffset + (y * width + x * 2) * 2;

        // U = 512 (无色偏)
        data.setUint16(offset, 512, Endian.little);
        // V = 512 (无色偏)
        data.setUint16(offset + 2, 512, Endian.little);
      }
    }

    // 发送数据
    await _channel.invokeMethod('updateTexture', {
      'textureId': _textureId,
      'data': data.buffer.asUint8List(), // 传递原始字节
      'width': width,
      'height': height,
      'format': RenderPixelFormat.yuv420p10bit.index, // 假设 1 代表 YUV420P，需与原生侧枚举对应
      "hdrMode":HdrTransferFunction.hlg.index
    });
  }
  Future<void> _sendFrameData() async {
    if (_textureId == null) return;

    // 模拟 YUV420P 数据 (Y + U + V)
    // 注意：这里只是生成假杂色数据
    int ySize = widget.width * widget.height;
    int uvSize = (widget.width ~/ 2) * (widget.height ~/ 2);
    int totalSize = ySize + uvSize * 2;

    Uint8List fakeYUVData = Uint8List(totalSize);
    // 填充一些随机数据让屏幕闪烁，证明在渲染
    for (int i = 0; i < totalSize; i++) {
      fakeYUVData[i] = (DateTime.now().millisecondsSinceEpoch % 255).toInt();
    }

    // 3. 将数据传给原生更新纹理
    await _channel.invokeMethod('updateTexture', {
      'textureId': _textureId,
      'data': fakeYUVData, // Flutter 会自动将其转为 FlutterStandardTypedData
      'width': widget.width,
      'height': widget.height,
      'format': RenderPixelFormat.yuv420p.index, // 假设 1 代表 YUV420P，需与原生侧枚举对应
      "hdrMode":HdrTransferFunction.hlg.index
    });
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _macosRenderPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:  _textureId == null
              ? const CircularProgressIndicator()
              : Container(
            width: widget.width.toDouble(),
            height: widget.height.toDouble(),
            color: Colors.black,
            // 4. 核心：使用 Texture 组件显示原生画面
            // child: Texture(textureId: _textureId!),
            child: UiKitView(viewType: "video_view"),
          ),
        ),
      ),
    );
  }
}
