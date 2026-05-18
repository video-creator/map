import 'dart:ffi';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/bottom/left/meta_info_panel.dart';

import '../../../theme/theme_manager.dart';
import '../../../utils/pointer.dart';
import '../../mediainfo_inherit_widget.dart';
import 'meta_ps_panel.dart';

class MetaPanel extends StatefulWidget {
  const MetaPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MetaPanelState();
  }

}

class MetaPanelState extends State<MetaPanel> implements MethodListenInterface{
  // Pointer<MDPParserContext>? prsCtx;
  // Pointer<MDPFormatContext>? fmtCtx;
  // Pointer<MDPFormatInfo>? fmtInfo;
  int selectIndex = 0;
  late PageController pageController;
  late List<Widget> panels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
    MethodListen.shareInstance().appendMethodCallListener(this);
    panels = [const MetaInfoPanel(), const MetaPSPanel()];
  }
  @override
  Widget build(BuildContext context) {
    // int format = MDPFormatType.MDPFORMAT_TYPE_UNKNOWN;
    // if (valid(prsCtx) && valid(fmtCtx) && valid(fmtInfo)) {
    //   format = fmtInfo!.ref.format_type;
    // }
    // TODO: implement build
    return Container(
      color: convertStringToColor(currentTheme.leftPanelColor),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 30,
              padding: EdgeInsets.zero,
              color: Colors.red,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          color: selectIndex == 0 ? Colors.blueGrey : Colors.grey,
                          alignment:Alignment.center,
                          child: Text("MetaInfo",style: TextStyle(
                            color: selectIndex == 0 ? Colors.white : Colors.black,
                            fontSize: 13
                          ),),
                        ),
                        onTap: (){
                          setState(() {
                            selectIndex = 0;
                            pageController.animateToPage(selectIndex, duration: Duration(milliseconds: 300),curve: Curves.easeInOut);
                          });
                        },
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                          child: Container(
                            color: selectIndex == 1 ? Colors.blueGrey : Colors.grey,
                            alignment:Alignment.center,
                            child: Text("SPS/PPS",style: TextStyle(
                              color: selectIndex == 1 ? Colors.white : Colors.black, fontSize: 13
                            ),),
                          ),
                          onTap: (){
                            setState(() {
                              selectIndex = 1;
                              pageController.animateToPage(selectIndex, duration: Duration(milliseconds: 300),curve: Curves.easeInOut);
                            });
                          },
                        )
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  children: panels,
                  allowImplicitScrolling: true,
                )
            )
          ],
        ),
      ),
    );
  }
  void update() {
    // prsCtx = MediaInfoWidget.of(context)?.prsCtx;
    // fmtCtx = prsCtx?.ref.fmt_ctx;
    // fmtInfo = fmtCtx?.ref.fmt_info;
    // setState(() {
    //
    // });
  }

  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
      if (key == "parse_complete") {
        update();
      } else if (key == "avc_header"){

      }
  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["parse_complete","avc_header"];
  }
}