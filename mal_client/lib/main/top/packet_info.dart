import 'dart:ffi';

import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PacketInfoPanelController {
  OverlayEntry? _overlayEntry;
  bool isShow = false;
  // void show(LayerLink layerLink, BuildContext context, Pointer<MDPPacket> packet) {
  //   if(isShow) return;
  //   isShow = true;
  //   OverlayEntry _createOverlayEntry() => OverlayEntry(
  //     builder: (BuildContext context) => UnconstrainedBox(
  //       child: CompositedTransformFollower(
  //         link: layerLink,
  //         followerAnchor: Alignment.topLeft,
  //         targetAnchor: Alignment.bottomCenter,
  //         offset: Offset(0,8),
  //         child: Material(
  //           child: _PacketInfoPanel(packet),
  //         ),
  //       ),
  //     ),
  //   );
  //   _overlayEntry = _createOverlayEntry();
  //   Overlay.of(context).insert(_overlayEntry!);
  // }
  void hide() {
    isShow = false;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _PacketInfoPanel extends StatefulWidget {
  // final Pointer<MDPPacket> packet;
  // _PacketInfoPanel(this.packet,{super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PacketInfoPanelState();
  }
}

class _PacketInfoPanelState extends State<_PacketInfoPanel> {
  List<Map<String,String>> dataSource = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dataSource = generateFields(widget.packet);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 400,
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
    );
  }
  // List<Map<String,String>> generateFields(Pointer<MDPPacket> packet) {
  //   List<Map<String,String>> ret = [];
  //   if (packet.address != 0) {
  //     ret.add({"size" :"${packet.ref.size}"});
  //     ret.add({"pos" :"${packet.ref.pos}"});
  //     ret.add({"nal_count":"${packet.ref.nb_nals}"});
  //   }
  //   return ret;
  // }

}