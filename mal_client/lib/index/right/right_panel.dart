
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart' as m;
import '../../event/event.dart';
import '../../main/open_window.dart';
import '../../utils/dialog.dart';
class DebounceHandler {
  Timer? _timer;

  void run(VoidCallback action, [int milliseconds = 1000]) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
class RightPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RightPanelState();
  }

}
class RightPanelState extends State<RightPanel>{
  String borderColor = "#d3d3d3";
  double borderWidth = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  void openMainPage(String name, String filePath) {
    OpenWindow.refreshHistory(name, filePath);
    OpenWindow.openMainWindow(filePath);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/images/eye_icon.png"),
          ),
          Container(height: 20,),
          Container(
            child: generateTextWidget(text: "MEDIA DETECT",textSize: 20,textColor: "#BABABA",weight: FontWeight.w500),
          ),
          Container(height: 10,),
          Container(
            child: generateTextWidget(text: "Version 1.0.0",textSize: 20,textColor: "#BABABA",weight: FontWeight.w500),
          ),
          Container(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 60),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropTarget(
                  onDragEntered: (DropEventDetails? detail){
                    // debugPrint("onDragEntered==");
                    borderColor = "#3399ff";
                    borderWidth = 2;
                    setState(() {

                    });
                  },
                  onDragExited: (DropEventDetails? detail) {
                    borderColor = "#d3d3d3";
                    borderWidth = 0;
                    setState(() {

                    });
                  },
                  onDragUpdated: (DropEventDetails? detail) {
                    // debugPrint("onDragUpdated==");
                  },
                  onDragDone: (DropDoneDetails detail) {
                    String filePath = "";
                    String fileName = "";
                    debugPrint(detail.files.toString());
                    if (detail.files.isEmpty) {
                      return;
                    }
                    var item = detail.files.first;
                    if (item is DropItemDirectory) {
                      MDPDialog.showToast(context, Container(
                        child: generateTextWidget(text: "不支持文件夹！！", textColor: "#ffffff"),
                      ));
                      return;
                    }
                    if (item is DropItemFile) {
                      var fileItem = item as DropItemFile;
                      filePath = fileItem.path;
                      fileName = fileItem.name;
                    }
                    if (filePath.isEmpty) {
                      MDPDialog.showToast(context, Container(
                        child: generateTextWidget(text: "没有拿到文件！！", textColor: "#ffffff"),
                      ));
                      return;
                    }
                    borderWidth = 0;
                    openMainPage(fileName, filePath);
                    setState(() {

                    });

                  },
                  child: Container(
                    decoration: borderWidth > 0 ? BoxDecoration(
                      border: Border.all(color: convertStringToColor(borderColor)!,width: borderWidth),
                      borderRadius: BorderRadius.circular(4),
                    ) : null,
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: (){
                        OpenWindow.openFile(context,callback: ({dynamic arg1, dynamic arg2, dynamic arg3}){
                          openMainPage(arg1.toString(), arg2.toString());
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/dir.png"),
                          Container(width: 10,),
                          generateTextWidget(text: "打开媒体文件(支持MP4,FLV,HEIF,WEBP,JPEG,GIF,PNG)",textSize: 14,textColor: "#BABABA",weight: FontWeight.w600)
                        ],
                      ),
                    ),

                  ),
                ),
                Container(height: 20,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: (){
                      OpenWindow.openYUVViewWindow(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/Eye.png",width: 18,),
                        Container(width: 10,),
                        generateTextWidget(text: "YUV查看器",textSize: 14,textColor: "#BABABA",weight: FontWeight.w600)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
