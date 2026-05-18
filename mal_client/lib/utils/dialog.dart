import 'dart:async';
import 'dart:ffi';

import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Ref<T> {
  T value;
  Ref(this.value);
}
enum ToastPosition { top, bottom, center }
class MDPDialog {
  static void show(BuildContext context, {String title = "",String content = "", bool barrierDismissible = false, VoidCallback? onConfirm}) {
    context.showFlash(
      barrierColor: Colors.black54,
      barrierDismissible: barrierDismissible,
      builder: (context, controller) => FadeTransition(
        opacity: controller.controller,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(),
          ),
          contentPadding: EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0, bottom: 16.0),
          title: generateTextWidget(text: title),
          content: generateTextWidget(text: content,maxLines: 1000),
          actions: [
            TextButton(
              onPressed: () {
                controller.dismiss(); // 关闭对话框
                if (onConfirm != null) {
                  onConfirm(); // 调用传入的回调函数
                }
              },
              child: Text('确定'),
            ),
          ],
        ),
      ),
    );
  }
  static void showWidget(BuildContext context,Ref<FlashController?> flashController, Widget child,  {String title = "", bool barrierDismissible = false,}) async{
    context.showFlash(
      barrierColor: Colors.black54,
      barrierDismissible: barrierDismissible,
      builder: (context, controller){
        flashController.value = controller;
        return FadeTransition(
          opacity: controller.controller,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(),
            ),
            title: generateTextWidget(text: title),
            content: child,
          ),
        );
      },
    );
  }
  static FlashController? flashController;
  static Timer? toastTimer;
  // 启动一个3秒后执行的 Timer
  static void showToast(BuildContext context, Widget child, {ToastPosition position = ToastPosition.bottom, String backColor = "#000000"}) {
    toastTimer?.cancel();
    List<Widget> childrens = [];
    Widget widget = Container(
      child: Row(
        children: [
          Expanded(child: Container()),
          Container(
            alignment: Alignment.center,
            child: child,
            height: 30,
            padding: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                color: convertStringToColor(backColor,alpha: 0.8),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
    if (position == ToastPosition.top) {
      childrens.add(widget);
      childrens.add(Expanded(child: Container()));
    } else if (position == ToastPosition.center) {
      childrens.add(Expanded(child: Container()));
      childrens.add(widget);
      childrens.add(Expanded(child: Container()));
    } else if (position == ToastPosition.bottom) {
      childrens.add(Expanded(child: Container()));
      childrens.add(widget);
    }

    context.showFlash(
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      persistent: true,
      builder: (context, controller){
        flashController = controller;
        // Future.delayed(const Duration(seconds: 3), () {
        //   if (controller == flashController) {
        //     controller.dismiss();
        //   }
        // });
        toastTimer = Timer(const Duration(seconds: 3), () {
          print("timer======");
          if (controller == flashController && context.mounted) {
            controller.dismiss();
            flashController = null;
          }

        });
        return FadeTransition(
          opacity: controller.controller,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20,bottom: 20),
            child: Column(
              children: childrens,
            ),
          ),
        );
      },
    );
  }
}

