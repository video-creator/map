import 'dart:ffi';
import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_page.dart';
import 'mediainfo_inherit_widget.dart';
//
// class MainWindow extends StatelessWidget {
//   const MainWindow({
//     Key? key,
//     required this.windowController,
//     required this.args,
//   }) : super(key: key);
//
//   final WindowController windowController;
//   final Map? args;
//   static Map<int,Widget> widgets = {};
//   @override
//   Widget build(BuildContext context) {
//     String path = args!["path"];
//     if (!widgets.containsKey(windowController.windowId)) {
//       widgets[windowController.windowId] = MediaInfoWidget(
//           path: path,
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: "快手多媒体检测平台",
//             initialRoute: "/",
//             routes: {
//               "/":(context)=>MainPage(path),
//             },
//           ));
//
//     }
//     return widgets[windowController.windowId]!;
//   }
//
// }

class MainWindow extends StatefulWidget {
  const MainWindow({
    Key? key,
    required this.windowController,
    required this.args,
  }) : super(key: key);

  final WindowController windowController;
  final Map? args;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainWindowState();
  }
}

class MainWindowState extends State<MainWindow> {
  String path = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.args != null) {
      path = widget.args!["path"];
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaInfoWidget(
        key: ValueKey(widget.windowController.windowId),
        path: path,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "快手多媒体检测平台",
          initialRoute: "/",
          routes: {
            "/":(context)=>MainPage(path,windowsController: widget.windowController,),
          },
        ));
  }
  @override
  void dispose() {
    super.dispose();
  }


}