import 'dart:convert';
import 'dart:ffi';
import 'package:base_utility/utiles/file.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:mal_client/rpc_client/proto_gen/atom.pb.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sprintf/sprintf.dart';
import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_manager.dart';
import '../../mediainfo_inherit_widget.dart';

class BinaryPanel extends StatefulWidget {
  const BinaryPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BinaryPanelState();
  }

}

class BinaryPanelState extends State<BinaryPanel> with MethodListenInterface{
  MALAtom? atom;
  List<String> binaryList = [];
  List<String> asciiList = [];
  List<String> lineList = [];
  MediaInfoInheritWidget? infoInheritWidget;
  int totalRead = 0;
  int pageSize = 16 * 100;
  int line = 0;
  LinkedScrollControllerGroup _controllers = LinkedScrollControllerGroup();
  late ScrollController binaryController;
  late ScrollController asciiController;
  late ScrollController lineController;
  final GlobalKey<SelectionAreaState> binaryGlobalKey = GlobalKey();
  final GlobalKey<SelectionAreaState> asciiGlobalKey = GlobalKey();
  late SelectionArea binarySelectionArea;
  final TextSelectionControls binarySelectionControls = MaterialTextSelectionControls();
  double binaryX = 0;
  double asciiX = 0;
  double binaryHeight = 0;
  double asciiTextWidth = 175;
  double binaryTextWidth = 375;
  int focusList = -1;
  double fontSize = 14;
  String fontFamily = "Courier";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    binaryController = _controllers.addAndGet();
    asciiController = _controllers.addAndGet();
    lineController = _controllers.addAndGet();
    MethodListen.shareInstance().appendMethodCallListener(this);
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      binaryHeight = binaryGlobalKey.currentContext?.size?.height ?? 0;
      loadDataSource();
    });
    binaryController.addListener(() {
      //监听滚动事件，打印滚动位置
      // debugPrint("mController.offset: ${mController.offset} scrollHeight: ${mController.position.maxScrollExtent} line height: ${scrollGlobalKey.currentContext?.size?.height ?? 0}" );
      if (binaryController.offset + binaryHeight > (binaryController.position.maxScrollExtent ?? 0) - binaryHeight/2) {
        debugPrint("start load data!!!");
        loadDataSource();
      }

    });
  }
  // generateTextWidget(text: binaryText,maxLines: -1 >>> 1,textColor: "#ffffff",fontFeatures: [FontFeature.tabularFigures()])
  @override
  Widget build(BuildContext context) {
    infoInheritWidget = MediaInfoWidget.of(context);
    return Container(
      child: Row(
        children: [
          Container(
            width: 60,
            child: SelectionArea(
              child: ListView.builder(
                itemBuilder: (context,index) {
                  return generateTextWidget(
                      text: lineList[index],maxLines: -1 >>> 1,
                      textColor: ThemeManager.theme.fontDisableColor,
                      fontFamily: fontFamily,
                      textSize: fontSize
                  );
                },
                itemCount: lineList.length,
                controller: lineController,
              ),
            ),
          ),
          Container(
            width: 420,
            child: SelectionArea(
              key: binaryGlobalKey,
              onSelectionChanged: (content) {
                // debugPrint("选中了：${content?.plainText}");
              },
              handleMouseDragStart: (DragStartDetails start) {
                if (focusList == 1) return;
                focusList = 0;
                binaryX = (binaryGlobalKey.currentContext?.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dx ?? 0;
                asciiX = (asciiGlobalKey.currentContext?.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dx ?? 0;
                double asciiDragX = asciiX + (start.globalPosition.dx - binaryX) / binaryTextWidth * asciiTextWidth;
                Offset offset = Offset(asciiDragX, start.globalPosition.dy);
                asciiGlobalKey.currentState?.handleMouseDragStart(offset);
              },
              handleMouseDragUpdate: (DragUpdateDetails details) {
                if (focusList == 1) return;
                double asciiDragX = asciiX + (details.globalPosition.dx - binaryX) / binaryTextWidth * asciiTextWidth;
                Offset offset = Offset(asciiDragX, details.globalPosition.dy);
                asciiGlobalKey.currentState?.handleMouseDragUpdate(offset);
              },
              handleMouseDragEnd: (DragEndDetails details) {
                if (focusList == 1) return;
                asciiGlobalKey.currentState?.handleMouseDragEnd();
              },
              clearSection:() {
                asciiGlobalKey.currentState?.clearSelection(notify: false);
                focusList = -1;
                debugPrint("wyq-----binary clear");
              },
              selectionControls: binarySelectionControls,
              child: ListView.builder(
                itemBuilder: (context,index) {
                  return generateTextWidget(
                      text: binaryList[index],maxLines: -1 >>> 1,
                      textColor: ThemeManager.theme.fontColor,
                      fontFamily: fontFamily,
                      textSize: fontSize
                  );
                },
                itemCount: binaryList.length,
                controller: binaryController,
              ),
            ),
          ),
          Expanded(
            child: SelectionArea(
              key: asciiGlobalKey,
              handleMouseDragStart: (DragStartDetails start) {
                if (focusList == 0) return;
                focusList  = 1;
                binaryX = (binaryGlobalKey.currentContext?.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dx ?? 0;
                asciiX = (asciiGlobalKey.currentContext?.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dx ?? 0;
                double binaryDragX = binaryX + (start.globalPosition.dx - asciiX) / asciiTextWidth * binaryTextWidth;
                Offset offset = Offset(binaryDragX, start.globalPosition.dy);
                binaryGlobalKey.currentState?.handleMouseDragStart(offset);
              },
              handleMouseDragUpdate: (DragUpdateDetails details) {
                if (focusList == 0) return;
                double binaryDragX = binaryX + (details.globalPosition.dx - asciiX) / asciiTextWidth * binaryTextWidth;
                Offset offset = Offset(binaryDragX, details.globalPosition.dy);
                binaryGlobalKey.currentState?.handleMouseDragUpdate(offset);
              },
              handleMouseDragEnd: (DragEndDetails details) {
                if (focusList == 0) return;
                binaryGlobalKey.currentState?.handleMouseDragEnd();
              },
              clearSection:() {
                binaryGlobalKey.currentState?.clearSelection(notify: false);
                focusList = -1;
                debugPrint("wyq-----ascii clear");
              },
              child: ListView.builder(
                itemBuilder: (context,index) {
                  return generateTextWidget(
                      text: asciiList[index],maxLines: -1 >>> 1,
                      textColor: ThemeManager.theme.fontColor,
                      fontFamily: fontFamily,
                      textSize: fontSize,
                      letterSpacing: 3.0
                  );
                },
                itemCount: asciiList.length,
                controller: asciiController,
              ),
            ),
          )
        ],
      ),
    );

  }

  void loadDataSource() async {
    int readSize = 0;
    LocalFileReader? fileReader =  MediaInfoWidget.of(context)?.fileReader;
    if (atom != null && fileReader != null) {
      await fileReader.seek(atom!.pos.toInt() + totalRead,origin: SeekOrigin.set);
      String binaryText = "";
      String asciiText = "";
      while (totalRead < (atom?.size.toInt() ?? 0) && readSize < pageSize) {
        int val = await fileReader.readUint8();
        if (val < 0) {
          debugPrint("error!!!!");
          break;
        }
        if (totalRead % 16 == 0) {
          lineList.add(sprintf("%05d   ",[line])) ;
          line += 16;
        }
        binaryText += sprintf("%02x ",[val]);
        if((val >= 65 && val <= 90) || (val >= 97 && val <= 122) || (val >= 48 && val <= 57)) {
          asciiText += String.fromCharCode(val);
        } else {
          asciiText += ".";
        }
        totalRead++;
        readSize ++;
        binaryText = binaryText.toUpperCase();
        if (totalRead > 0 && totalRead % 16 == 0) {
          binaryList.add(binaryText);
          asciiList.add(asciiText);
          binaryText = "";
          asciiText = "";
        }
      }
      if (binaryText.isNotEmpty) {
          binaryList.add(binaryText);
          asciiList.add(asciiText);
      }

    }
    setState(() {

    });
  }
  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "switch_atom") {
      atom = arguments;
      totalRead = 0;
      line = 0;
      binaryList = [];
      lineList = [];
      asciiList = [];
      // // if (needClearSection) {
      //   debugPrint("xxx");
      // // }
      // Pointer<MDPDataBuffer>? buffer = atom?.ref.buffer;
      // if (buffer != null) {
      //   infoInheritWidget?.dataBufferReset(buffer);
      // }
      loadDataSource();
    }
  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["switch_atom"];
  }
  @override
  void dispose() {
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }

}