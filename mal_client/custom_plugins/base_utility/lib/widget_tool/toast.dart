// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class ToastHelper {
//
//   static Flushbar showErrorToast(BuildContext context,String message,
//       {String title = "错误提示！",
//         FlushbarPosition position = FlushbarPosition.BOTTOM}) {
//     return Flushbar(
//       title: title,
//       message: message,
//       animationDuration: Duration(milliseconds: 600),
//       flushbarPosition: position,
//       icon: Icon(
//         Icons.error,
//         size: 28.0,
//         color: Colors.white,
//       ),
//       duration: const Duration(seconds: 1, milliseconds: 500),
//       backgroundGradient: LinearGradient(
//         colors: [Colors.red[600], Colors.red[400]],
//       ),
//       onTap: (flushbar) => flushbar.dismiss(),
//     )..show(context);
//   }
//
//
//   static Flushbar showSuccessToast(BuildContext context,
//       String message,
//       {String title = "执行成功！",
//         FlushbarPosition position = FlushbarPosition.BOTTOM}) {
//     return Flushbar(
//       title: title,
//       flushbarPosition: position,
//       message: message,
//       icon: Icon(
//         Icons.check,
//         size: 28.0,
//         color: Colors.white,
//       ),
//       animationDuration: Duration(milliseconds: 600),
//       duration: const Duration(seconds: 1, milliseconds: 500),
//       backgroundGradient: LinearGradient(
//         colors: [Colors.green[600], Colors.green[400]],
//       ),
//       onTap: (flushbar) => flushbar.dismiss(),
//     )..show(context);
//   }
//
//   static void toastMsg(String msg) {
//     Fluttertoast.showToast(msg: msg);
//   }
// }
