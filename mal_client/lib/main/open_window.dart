import 'dart:convert';
import 'dart:io';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:flutter/material.dart' as m;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

typedef Arg3Callback = void Function({dynamic arg1, dynamic arg2, dynamic arg3});
class OpenWindow {
  static void openFile(BuildContext context, {Arg3Callback? callback}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    debugPrint("点击了----3");
    if (result != null) {
      // MethodListen.shareInstance().postMethod(EVENT_HISTORY_REFRESH, {"name":result.files.single.name,"path":result.files.single.path!});
      if (callback != null) {
        callback(arg1: result.files.single.name, arg2: result.files.single.path!);
      }
    } else {
      // User canceled the picker
    }
  }

  static Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory(); // 获取应用的存储目录
    final path = "${directory.path}/history.json"; // 历史记录保存为JSON文件
    return File(path);
  }

  // 刷新历史记录
  static Future<void> refreshHistory(String name, String path) async {
    final file = await _getLocalFile();
    List<Map<String, String>> historyList = [];

    // 如果文件已存在，先读取文件内容以加载历史记录
    if (await file.exists()) {
      String content = await file.readAsString();
      if (content.isNotEmpty) {
        // 解码 JSON 并显式转换为 List<Map<String, String>>
        List<dynamic> rawList = json.decode(content);
        historyList = rawList.map((e) => Map<String, String>.from(e)).toList();
      }
    }

    // 新的记录
    Map<String, String> newRecord = {'name': name, 'path': path};

    // 去重处理（根据 'name' 和 'path' 进行唯一性判断）
    historyList.removeWhere((item) => item['name'] == name && item['path'] == path);

    // 插入最新记录到首位
    historyList.insert(0, newRecord);

    // 写回文件（以 JSON 格式保存）
    await file.writeAsString(json.encode(historyList));
  }

  // 获取历史记录
  static Future<List<Map<String, String>>> getHistory() async {
    final file = await _getLocalFile();

    // 如果文件存在且有内容
    if (await file.exists()) {
      String content = await file.readAsString();
      if (content.isNotEmpty) {
        // 解码 JSON 并显式转换为 List<Map<String, String>>
        List<dynamic> rawList = json.decode(content);
        return rawList.map((e) => Map<String, String>.from(e)).toList();
      }
    }
    return []; // 文件不存在或内容为空，返回空列表
  }

  // 清空历史记录
  static Future<void> clearHistory() async {
    final file = await _getLocalFile();
    if (await file.exists()) {
      await file.writeAsString(''); // 写入空字符串以清空文件
    }
  }


  // static Future<List> getHistoryFiles() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? files = prefs.getStringList("history");
  //   List<String> titles = [];
  //   List<String> paths = [];
  //   if (files != null) {
  //     for (var element in files) {
  //       if (element.isNotEmpty) {
  //         List<String> file = element.split(",");
  //         if (file.length == 2) {
  //           titles.add(file[0]);
  //           paths.add(file[1]);
  //         }
  //       }
  //     }
  //   }
  //  return [titles, paths];
  // }
  // static Future<void> refreshHistory(String name, String path) async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? historyList = prefs.getStringList("history");
  //   historyList ??= [];
  //   String insert = "$name,$path";
  //   historyList.removeWhere((element){
  //     if (insert == element) return true;
  //     return false;
  //   });
  //   historyList.insert(0,insert);
  //   prefs.setStringList("history", historyList);
  // }
  static void openMainWindow(String path) async{
    Display primaryDisplay = await screenRetriever.getPrimaryDisplay();
    double windowWidth = primaryDisplay.size.width-180;
    debugPrint("windowWidth:$windowWidth");
    double windowHeight = windowWidth * (primaryDisplay.size.height / primaryDisplay.size.width) ;
    final window = await DesktopMultiWindow.createWindow(jsonEncode({
      'path': path,
      'id': 100,
    }));
    window
      ..setFrame(const Offset(0, 0) & m.Size(windowWidth,windowHeight))
      ..center()
      ..setTitle('媒体分析平台')
      ..show();
  }


  static void openYUVViewWindow(BuildContext context) async{
    Display primaryDisplay = await screenRetriever.getPrimaryDisplay();
    double windowWidth = primaryDisplay.size.width-480;
    debugPrint("windowWidth:$windowWidth");
    double windowHeight = windowWidth * (primaryDisplay.size.height / primaryDisplay.size.width) ;
    final window = await DesktopMultiWindow.createWindow(jsonEncode({
      'id': 102,
    }));
    window
      ..setFrame(const Offset(0, 0) & m.Size(windowWidth,windowHeight))
      ..center()
      ..setTitle('媒体分析平台')
      ..show();
  }


}

