import 'dart:typed_data';
import 'dart:ui';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/raw_image_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macos_render_plugin/macos_render_plugin.dart';
import 'package:macos_render_plugin/render_view.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';

import '../../mediainfo_inherit_widget.dart';

class ImageDisplayPanel extends StatefulWidget {
  const ImageDisplayPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageDisplayPanelState();
  }
}

class ImageDisplayPanelState extends State<ImageDisplayPanel>
    implements MethodListenInterface {
  MALFrame? frame;
  MALPacket? pkt;
  RenderViewController? renderViewController;
  Offset _dragGesturePosition = Offset.zero;
  bool _show = false;
  final Size magnifierSize =  const Size(150, 150);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  Widget _buildMagnifier(){
    return RawMagnifier(
      decoration:  MagnifierDecoration(
        opacity: 1.0,
        shadows: [
          BoxShadow(
              offset: Offset(1,1),
              blurRadius: 4,
              spreadRadius: 6,
              color: Colors.black.withOpacity(0.1)
          )
        ],
        shape: CircleBorder(),
      ),
      size: magnifierSize,
      magnificationScale: 3,
    );
  }
  void _onPanDown(DragDownDetails details) {
    _dragGesturePosition = details.localPosition-Offset(magnifierSize.width/2,magnifierSize.height/2);
    _show = true;
    setState(() {
    });
  }
  void _onPanEnd(DragEndDetails details) {
    setState(() => _show = false);
  }
  void _onPanUpdate(DragUpdateDetails details) {
    _dragGesturePosition = details.localPosition-Offset(magnifierSize.width/2,magnifierSize.height/2);
    setState(() {
    });
  }
  void _onPanCancel() {
    setState(() => _show = false);
  }
  bool isNativeDisplay(MALVideoPixelFormat pixelFormat) {
    if (pixelFormat == MALVideoPixelFormat.YUV420P ||
        pixelFormat == MALVideoPixelFormat.YUV420P10LE ||
        pixelFormat == MALVideoPixelFormat.YUVJ420P) {
        return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    Widget renderWidget = Container();
    if (frame!= null) {
        if (isNativeDisplay(frame!.videoFrame.pixelFormat)) {
          renderWidget = RenderView(renderViewController);
          renderViewController?.updateFrameData(frame!.videoFrame.frameData);
        } else if (frame?.videoFrame.pixelFormat == MALVideoPixelFormat.RGBA) {
          renderWidget = Image(
            fit: BoxFit.contain,
            image: RawImageProvider(createRawImage(frame!)),
          );
        }
    }
    // TODO: implement build
    return Container(
      color: convertStringToColor("#3b3b3b",alpha: 0.6),
      child: RawKeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              // 判断按住的是左键还是右键
              if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                if (pkt == null) return;
                MethodListen.shareInstance()
                    .postMethod("pre_frame", {"pkt": pkt});
              } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                if (pkt == null) return;
                MethodListen.shareInstance()
                    .postMethod("next_frame", {"pkt": pkt});
              }
            }
          },
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      child: GestureDetector(
                        onPanDown: _onPanDown,
                        onPanEnd: _onPanEnd,
                        onPanUpdate: _onPanUpdate,
                        onPanCancel: _onPanCancel,
                        // child: Image(
                        //   fit: BoxFit.contain,
                        //   image: RawImageProvider(createRawImage(frame!)),
                        // ),
                        child: renderWidget,
                      ),
                    ),
                    if (_show)
                      Positioned(
                        left: _dragGesturePosition.dx,
                        top: _dragGesturePosition.dy,
                        child: _buildMagnifier(),
                      )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    TextButton(
                        onPressed: () {
                          MethodListen.shareInstance()
                              .postMethod("pre_frame", {"pkt": pkt});
                        },
                        child: const Text("上一帧")),
                    TextButton(
                        onPressed: () {
                          MethodListen.shareInstance()
                              .postMethod("cur_frame", {"pkt": pkt});
                        },
                        child: const Text("当前帧")),
                    TextButton(
                        onPressed: () {
                          MethodListen.shareInstance()
                              .postMethod("next_frame", {"pkt": pkt});
                        },
                        child: const Text("下一帧")),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              )
            ],
          ))
    );
  }

  RawImageData createRawImage(MALFrame frame) {
    return RawImageData(
      Uint8List.fromList(frame.videoFrame.frameData),
      frame.videoFrame.width,
      frame.videoFrame.height,
      pixelFormat: PixelFormat.rgba8888,
    );
  }

  void getFrameDetail() async {
    if (pkt != null) {
      var response =
          await MediaInfoWidget.of(context)?.loadOneFrameDetail(pkt!.pos);
      frame = null;
      if (response?.base.success ?? false) {
        frame = response?.frame;
        if ((frame?.hasVideoFrame() ?? false) && isNativeDisplay(frame!.videoFrame.pixelFormat)) {
          // if (renderViewController == null ) {
            RenderPixelFormat format = RenderPixelFormat.yuv420p;
            if (frame?.videoFrame.pixelFormat == MALVideoPixelFormat.YUV420P) {
              format = RenderPixelFormat.yuv420p;
            } else if (frame?.videoFrame.pixelFormat == MALVideoPixelFormat.YUV420P10LE) {
              format = RenderPixelFormat.yuv420p10bit;
            } else if (frame?.videoFrame.pixelFormat == MALVideoPixelFormat.YUVJ420P) {
              format = RenderPixelFormat.yuvj420p;
            }
            renderViewController = RenderViewController((frame?.videoFrame.width ?? 0).toDouble(), (frame?.videoFrame.height ?? 0).toDouble(), format);

          // }
        }

        debugPrint("frame rgb size: ${frame?.videoFrame.rgbData.length}");
      }
    }
    setState(() {});
  }

  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "click_pkt") {
      pkt = arguments["pkt"];
      // print(arguments);
      getFrameDetail();
    }
  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["click_pkt"];
  }

  @override
  void dispose() {
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }
}
