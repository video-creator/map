import 'dart:ffi';
import 'package:base_utility/widget_tool/expand_table.dart';
import 'package:ffi/ffi.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:base_utility/widget_tool/raw_image_provider.dart';
import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/bottom/right/frame_info_panel.dart';
import 'package:mal_client/main/bottom/right/image_display_panel.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import '../../../theme/theme_manager.dart';

class ImagePanel extends StatefulWidget {
  const ImagePanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImagePanelState();
  }

}

class ImagePanelState extends State<ImagePanel> implements MethodListenInterface{
  final MultiSplitViewController _controller = MultiSplitViewController();
  ImageDisplayPanel imageDisplayPanel = const ImageDisplayPanel();
  FrameInfoPanel frameInfoPanel = const FrameInfoPanel();
  late MultiSplitView multiSplitView;
  late MultiSplitViewTheme theme;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.areas = [Area(weight: 0.7,minimalWeight: 0.3), Area()];
    MethodListen.shareInstance().appendMethodCallListener(this);
    multiSplitView = MultiSplitView(
        controller: _controller,
        axis: Axis.vertical,
        // onWeightChange:_onWeightChange,
        // initialAreas: [Area(weight: 0.1),Area(weight: 0.9)],
        children: [
          imageDisplayPanel,
          frameInfoPanel
        ]
    );
    theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved1(backgroundColor: stringColor(ThemeManager.theme.splitBgColor)),dividerThickness: 5),
        child: multiSplitView
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: theme,
        ),
      );
      // body: horizontal,
  }



  /*
  Container(
              height: 250,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  String row = index == 0 ? "" : "$index";
                  String key = index == 0 ? "字段" : dataSource[index-1].keys.elementAt(0);
                  String value = index == 0 ? "值" : dataSource[index-1].values.elementAt(0);
                  String rowColor = index == 0 ? "#eaeaea" : "#ffffff";
                  double rowHeight = index == 0 ? 25 : 35;
                  Alignment rowAlignment = index == 0 ? Alignment.center : Alignment.centerLeft;


                  return Container(
                    child: Row(
                      children: [
                        Container(
                          height: rowHeight,
                          width: 25,
                          alignment: Alignment.center,
                          color: convertStringToColor("#eaeaea"),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: generateTextWidget(text: row),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: convertStringToColor("#bebebe"),
                              )
                            ],
                          ),

                        ),
                        Container(
                          width: 1,
                          height: rowHeight,
                          color: convertStringToColor("#bebebe"),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 4),
                            height: rowHeight,
                            color: convertStringToColor(rowColor),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: rowAlignment,
                                    child: generateTextWidget(text: key),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: convertStringToColor("#e2e2e2"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: rowHeight,
                          color: convertStringToColor("#e2e2e2"),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 4),
                            height: rowHeight,
                            color: convertStringToColor(rowColor),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: rowAlignment,
                                    child: generateTextWidget(text: value),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: convertStringToColor("#e2e2e2"),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: dataSource.length + 1,
              ),
            )
   */

  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall

  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    // return ["click_pkt"];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }
}