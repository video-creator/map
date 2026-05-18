import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/expand_table.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/mediainfo_inherit_widget.dart';
import 'package:mal_client/rpc_client/proto_gen/nal.pb.dart';
import 'package:mal_client/rpc_client/proto_gen/stream.pbenum.dart';

import '../../../rpc_client/proto_gen/stream.pb.dart';
import '../../../theme/theme_manager.dart';

class MetaInfoPanel extends StatefulWidget {
  const MetaInfoPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MetaInfoPanelState();
  }

}

class MetaInfoPanelState extends State<MetaInfoPanel> with AutomaticKeepAliveClientMixin  implements MethodListenInterface {
  List<MALPSItem> dataSource = [];
  List<double> columnWidths = [0.6,0.4];
  List<MALStream>? streams;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    if (streams == null) return Container();
    return SelectionArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.only(left: 0,right: 0, bottom: 15),
            child: ExpandTable(
              onUpdate: (){
                setState(() {

                });
              },
              rowsCount: dataSource.length,
              columnsCount: 2,
              columnsWidths: columnWidths,
              rowWidth: constraints.maxWidth,
              rows: List<ExpandTableRow>.generate(dataSource.length ,
                      (rowIndex){
                    var item = dataSource[rowIndex];
                    var row = ExpandTableRow(
                      columnWidths: columnWidths, cells: [],
                    );
                    _generateRow(row, item);
                    return row;
                  }),
            ),
          );
        },
      ),
    );
  }
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

  void getALLStreamInfo() async {
    var response = await MediaInfoWidget.of(context)?.getAllStreamInfo();
    if (response?.base.success ?? false) {
      streams =  response?.streams;
      generateFields();

    }

  }
  MALPSCell createCell({String? val}) {
    return MALPSCell(val: val ?? "", enable: true);
  }
  void generateFields() {
    dataSource.clear();
    if (streams != null) {
      var formatCtx =  MediaInfoWidget.of(context)?.formatContext;
      MALPSItem item = MALPSItem();
      item.cells.add(createCell(val: "format"));
      item.cells.add(createCell(val: formatCtx == null ? "UNKNOWN": formatCtx.name));
      dataSource.add(item);
      item = MALPSItem();
      item.cells.add(createCell(val: "file_duration(s)"));
      item.cells.add(createCell(val: formatCtx == null ? "UNKNOWN": formatCtx.duration.toString()));
      dataSource.add(item);
      for (int i = 0; i < (streams?.length ?? 0); i ++) {
        MALStream st = streams![i];
        String streamName = "unknown-${i}";
        if (st.mediaType == MALMediaType.MAL_MEDIA_TYPE_VIDEO) {
          streamName = "video-${i}";
        } else if (st.mediaType == MALMediaType.MAL_MEDIA_TYPE_AUDIO) {
          streamName = "audio-${i}";
        } else if (st.mediaType == MALMediaType.MAL_MEDIA_TYPE_Subtitle) {
          streamName = "audio-${i}";
        }

        item = MALPSItem();
        item.cells.add(createCell(val: "stream"));
        item.cells.add(createCell(val: streamName));
        dataSource.add(item);
        List<MALPSItem> childs = item.childs;
        if (st.mediaType == MALMediaType.MAL_MEDIA_TYPE_VIDEO) {
          item = MALPSItem();
          item.cells.add(createCell(val: "codecType"));
          item.cells.add(createCell(val: st.codecName));
          childs.add(item);
          childs.addAll(st.videoStream.displayItems);
        } else if (st.mediaType == MALMediaType.MAL_MEDIA_TYPE_AUDIO) {

        }
      }
    }
    setState(() {

    });
  }
  @override
  invokeMethodCall(String key, arguments) {
      if (key == "parse_complete" || key == "packets_load_complete") {
        getALLStreamInfo();
      }

  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["parse_complete","packets_load_complete"];
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }
}