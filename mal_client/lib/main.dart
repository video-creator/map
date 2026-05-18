import 'dart:convert';
import 'dart:io';

import 'package:base_utility/widget_tool/udid.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/check_error.dart';
import 'package:mal_client/yuv_view/yuv_viewer_window.dart';
import 'package:window_manager/window_manager.dart';

import 'index/index_page.dart';
import 'main/main_window.dart';



void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (args.firstOrNull == 'multi_window') {
    final windowId = int.parse(args[1]);
    final argument = args[2].isEmpty
        ? const {}
        : jsonDecode(args[2]) as Map<String, dynamic>;
    int id = argument["id"];
    if (id == 100) {
      var window = MainWindow(
        key: ValueKey(uuid()),
        windowController: WindowController.fromWindowId(windowId),
        args: argument,
      );
      runApp( window);
    } else if (id == 101) {
      var window = CheckErrorWindow(argument["datasource"]);
      runApp( MaterialApp(
        home: window,
      ));
    } else if (id == 102) {
      var window = YUVViewerWindow();
      runApp( MaterialApp(
        home: window,
      ));
    }

  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  void initState(){
    super.initState();
    GestureBinding.instance!.resamplingEnabled = true;
    WidgetsBinding.instance.addObserver(this);
    loadServer();
  }
  Future<Process?> loadServer() async{
    // var process = await Process.start("/Users/wangyaqiang/Library/Developer/Xcode/DerivedData/Demo-fokhsqftlbpplhbhftwoegosgnmg/Build/Products/Debug/Demo", []);
    // var pid = process.pid;
    // return process;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "快手多媒体检测平台",
      initialRoute: "/",
      routes: {
        "/":(context)=>const IndexPage(),
      },
    );
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) { // 3. 重写方法处理状态变化
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('App is inactive');
        break;
      case AppLifecycleState.paused:
        print('App is paused (进入后台)');
        // 在这里保存数据或释放资源
        break;
      case AppLifecycleState.resumed:
        print('App is resumed (回到前台)');
        break;
      case AppLifecycleState.detached:
        print('App is detached');
        break;
      default:
        break;
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

