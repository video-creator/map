import 'dart:ffi';
import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:ffi/ffi.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/rpc_client/proto_gen/atom.pb.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';

import '../../../theme/theme_manager.dart';

class FieldInfoPanel extends StatefulWidget {
  const FieldInfoPanel({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FieldInfoPanelState();
  }

}

class FieldInfoPanelState extends State<FieldInfoPanel> with MethodListenInterface{
  int count = 0;
  MALAtom? atom;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index){
            if (index == 0) {
              String desc = "offset=${atom?.pos ?? 0}, size=${atom?.size ?? 0}";
              return Container(
                child: generateTextWidget(text: desc,textColor: ThemeManager.theme.fontColor),
              );
            }

            MALAtomField curField = atom!.fields[index-1];
            String value = curField.value;
            String extraValue = curField.extraVal;
            String name = curField.name;
            bool displayEqual = true;
            return ConstrainedBox(
              constraints: const BoxConstraints(
                  minHeight: 25
              ),
              child: Row(
                children: [
                  generateTextWidget(text: name,textColor: ThemeManager.theme.fontColor),
                  generateTextWidget(text: displayEqual ? " = " : "",textColor: ThemeManager.theme.fontColor),
                  Expanded(
                    child: generateTextWidget(text: extraValue.isNotEmpty ? "$value($extraValue)" : value,textColor: ThemeManager.theme.fontColor,maxLines: 3),
                  )
                ],
              ),
            );
          },
          scrollDirection: Axis.vertical,
            itemCount: (atom?.fields.length ?? 0) + 1
          // itemCount: fields.length + 1,
        ),
      ),
    );
  }

  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "switch_atom") {
      atom = arguments;
      setState(() {

      });
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