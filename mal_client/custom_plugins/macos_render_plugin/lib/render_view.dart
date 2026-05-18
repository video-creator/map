import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'macos_render_plugin.dart';
final _macosRenderPlugin = MacosRenderPlugin();

class RenderViewController {
  static const MethodChannel _channel = MethodChannel('macos_render_plugin');
  late double width;
  late double height;
  late RenderPixelFormat pixelFormat;
  int? textureID;
  RenderViewController(double w, double h, RenderPixelFormat format) {
    width = w;
    height = h;
    pixelFormat = format;

  }
  void updateFrameData(List<int> data) async{
    textureID ??= await _channel.invokeMethod('createTexture');
    await _channel.invokeMethod('updateTexture', {
      "textureId":textureID,
      'data': data, // Flutter 会自动将其转为 FlutterStandardTypedData
      'width': width,
      'height': height,
      'format': pixelFormat.index, // 假设 1 代表 YUV420P，需与原生侧枚举对应
      "hdrMode":HdrTransferFunction.hlg.index
    });
  }
}

class RenderView extends StatefulWidget {
  late RenderViewController? _renderViewController;
  RenderView(RenderViewController? renderViewController) {
    _renderViewController = renderViewController;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RenderViewStage();
  }

}
class _RenderViewStage extends State<RenderView>  {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget._renderViewController?.width ?? 0,
      height: widget._renderViewController?.height ?? 0,
      child:  UiKitView(viewType: "video_view"),
    );
  }

}