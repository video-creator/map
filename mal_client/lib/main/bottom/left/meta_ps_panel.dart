import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:base_utility/widget_tool/expand_table.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
import 'package:mal_client/main/media_info.dart';
import 'package:mal_client/main/mediainfo_inherit_widget.dart';
import 'package:mal_client/rpc_client/proto_gen/nal.pb.dart';
import 'package:mal_client/rpc_client/proto_gen/stream.pb.dart';

import '../../../theme/theme_manager.dart';
import 'jsonview/src/json_shrink_widget.dart';

class MetaPSPanel extends StatefulWidget {
  const MetaPSPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MetaPSPanelState();
  }

}

class MetaPSPanelState extends State<MetaPSPanel> with AutomaticKeepAliveClientMixin  implements MethodListenInterface{
  // Pointer<mdp_video_header>? header;
  MALStream? stream;
  void getStreamInfo() async {
    var response = await MediaInfoWidget.of(context)?.getStreamInfo();
    if (response?.base.success ?? false) {
      setState(() {
        stream = response?.stream;
      });
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      getStreamInfo();
    });
  }
  // double columnWidth = 200;
  double initX = 0;
  final minimumColumnWidth = 50.0;

  String cellVal(MALPSItem item, int cellIndex) {
    MALPSCell cell = item.cells[cellIndex];
    return cell.val;
  }
  _generateRow(ExpandTableRow row, MALPSItem item) {
    row.cells = List<Widget>.generate(item.cells.length, (cellIndex){
      var cell = item.cells[cellIndex];
      var color = !cell.enable  ? currentTheme.fontDisableColor : currentTheme.fontColor;
      return SelectionArea(child: Container(
        child: generateTextWidget(text: cellVal(item, cellIndex),textColor:  color),
      ));
    });
    if (item.childs.isNotEmpty) {
        row.childs = List<ExpandTableRow>.generate(item.childs.length, (index){
          var childItem = item.childs[index];
          var child = ExpandTableRow(
            cells: [],
            columnWidths: columnWidths,
          );
          _generateRow(child, childItem);
          return child;
        });
    }

  }
  List<double> columnWidths = [0.8,0.2];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    if (stream == null || (stream?.videoStream.psItems.isEmpty ?? true)) return Container();
    if (stream?.videoStream.psItems.length == 1) { //只有一个avcc/hvcc
      return Container(
        padding: EdgeInsets.only(left: 0,right: 0, bottom: 15),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ExpandTable(
              onUpdate: (){
                setState(() {

                });
              },
              rowsCount: stream?.videoStream.psItems[0].childs.length  ?? 0,
              columnsCount: 2,
              columnsWidths: columnWidths,
              rowWidth: constraints.maxWidth,
              rows: List<ExpandTableRow>.generate(stream?.videoStream.psItems[0].childs.length ?? 0,
                      (rowIndex){
                    var item = stream?.videoStream.psItems[0].childs[rowIndex];
                    var row = ExpandTableRow(
                      columnWidths: columnWidths, cells: [],
                    );
                    _generateRow(row, item!);
                    return row;
                  }),
            );
          },
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(left: 0,right: 0, bottom: 15),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ExpandTable(
              onUpdate: (){
                setState(() {

                });
              },
              rowsCount: stream?.videoStream.psItems.length  ?? 0,
              columnsCount: 2,
              columnsWidths: columnWidths,
              rowWidth: constraints.maxWidth,
              rows: List<ExpandTableRow>.generate(stream?.videoStream.psItems.length ?? 0,
                      (rowIndex){
                    var item = stream?.videoStream.psItems[rowIndex];
                    var row = ExpandTableRow(
                      columnWidths: columnWidths, cells: [],
                    );
                    _generateRow(row, item!);
                    return row;
                  }),
            );
          },
        ),
      );
    }


  }

  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "avc_header") {
      // Pointer<MDPMessage> message = arguments;
      // header = Pointer.fromAddress(message.ref.ptr);
      // setState(() {
      //
      // });
    } else if (key == "parse_complete") {
      getStreamInfo();
    }
  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["parse_complete","avc_header"];
  }
  @override
  void dispose() {
    // TODO: implement dispose
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}