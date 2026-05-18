import 'dart:convert';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:mal_client/main/mediainfo_inherit_widget.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:flutter/material.dart' as m;

class BottomToolBar extends StatefulWidget{
  final String path;
  const BottomToolBar(this.path, {super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomToolBarState();
  }

}
void openPanel(bool shallow, bool warning, BuildContext context) async{
  List<String> dataSource = [];
  if (shallow) {
    if (warning) {
      dataSource = MediaInfoWidget.of(context)?.formatContext?.shallowCheck.warnings ?? [];
    } else {
      dataSource = MediaInfoWidget.of(context)?.formatContext?.shallowCheck.errors ?? [];
    }
  } else {
    if (warning) {
      dataSource = MediaInfoWidget.of(context)?.formatContext?.deepCheck.check_1.warnings ?? [];
    } else {
      dataSource = MediaInfoWidget.of(context)?.formatContext?.deepCheck.check_1.errors ?? [];
    }
  }

  Display primaryDisplay = await screenRetriever.getPrimaryDisplay();
  double windowWidth = primaryDisplay.size.width/2;
  debugPrint("windowWidth:$windowWidth");
  double windowHeight = windowWidth * (primaryDisplay.size.height / primaryDisplay.size.width) ;
  final window = await DesktopMultiWindow.createWindow(jsonEncode({
    'datasource': dataSource,
    'id': 101,
  }));
  window
    ..setFrame(const Offset(0, 0) & m.Size(windowWidth,windowHeight))
    ..center()
    ..setTitle('错误信息')
    ..show();
}
class BottomToolBarState extends State<BottomToolBar> with MethodListenInterface {
  var warning = -1;
  var error = -1;
  var nowParsePktCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        color: convertStringToColor("#dfdfdf"),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: generateSelectableTextWidget(text: widget.path,textSize: 12, minLines: 1,maxLines: 1),
            ),
            Expanded(child: Container()),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      child: Image.asset("assets/images/warning.png"),
                    ),
                    Container(
                      child: generateTextWidget(text: "${warning < 0 ? "正在检测":warning}",textSize: 12),
                    )
                  ],
                ),
              ),
              onTap: (){
                openPanel(true,true,context);
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      child: Image.asset("assets/images/error.png"),
                    ),
                    Container(
                      child: generateTextWidget(text: "${error < 0 ? "正在检测":error}",textSize: 12),
                    )
                  ],
                ),
              ),
              onTap: (){
                openPanel(true,false,context);
              },
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: generateTextWidget(text: "已解析：${nowParsePktCount.toString()}个packet", textSize: 12),
            )
          ],
        ),
      );
  }
  void getFileFormatContext() async {
    var response = await MediaInfoWidget.of(context)?.getFileFormatContextInfo();
    if (response?.base.success ?? false) {
      warning = response?.context.shallowCheck.warnings.length ?? 0;
      error = response?.context.shallowCheck.errors.length ?? 0;
    }
    setState(() {

    });
  }
  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "packets_load_complete") {
      getFileFormatContext();
    } else if (key == "current_parse_packet_num") {
      nowParsePktCount = int.parse(arguments["num"].toString());
      setState(() {

      });
    }

  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["packets_load_complete", "current_parse_packet_num"];
  }
  @override
  void dispose() {
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }

}