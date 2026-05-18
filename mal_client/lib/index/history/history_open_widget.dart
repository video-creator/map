import 'dart:convert';
import 'dart:ffi';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/open_window.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart' as m;
import 'package:window_manager/window_manager.dart';

import '../../event/event.dart';
import 'history_file_item.dart';
class HistoryOpenWidget extends StatefulWidget {
  const HistoryOpenWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HistoryOpenWidgetState();
  }

}
class HistoryOpenWidgetState extends State<HistoryOpenWidget> with WindowListener{
  List<Map> dataSource = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryFiles();
    WindowManager.instance.addListener(this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: convertStringToColor("#393939"),
      child: ListView.builder(itemBuilder: (context,index) {
        return TextButton(
            onPressed:() {
              openItem(index);
            } ,
            child: Container(
              child: HistoryItemWidget(index,dataSource[index]["name"],dataSource[index]["path"]),
            )
        );
      },itemCount: dataSource.length),
    );
  }
  void openItem(int index) async{
    OpenWindow.openMainWindow(dataSource[index]["path"]);
    await OpenWindow.refreshHistory(dataSource[index]["name"], dataSource[index]["path"]);
    await getHistoryFiles();
  }
  Future<void> getHistoryFiles() async{
    var result = await OpenWindow.getHistory();
    dataSource = result;
    setState(() {

    });
  }
  @override
  void onWindowFocus() {
    debugPrint("onWindowFocus=====");
    getHistoryFiles();
  }
  @override
  void dispose() {
    WindowManager.instance.removeListener(this);
    super.dispose();
  }

}