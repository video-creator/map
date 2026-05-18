import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/expand_table.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/media_info.dart';
import 'package:mal_client/main/mediainfo_inherit_widget.dart';
import 'package:mal_client/rpc_client/proto_gen/nal.pb.dart';

import '../../../rpc_client/proto_gen/mal.pb.dart';
import '../../../theme/theme_manager.dart';

class FrameInfoPanel extends StatefulWidget {
  const FrameInfoPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FrameInfoPanelState();
  }

}

class FrameInfoPanelState extends State<FrameInfoPanel>  implements MethodListenInterface{
  MALPacket? pkt;
  MALFrame? frame;
  List dataSource = [];
  List<double> columnWidths = [0.7,0.3];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 5,right: 5,bottom: 10),
      child: LayoutBuilder(
        builder:  (context, constraints) {
          return ExpandTable(
            onUpdate: (){
              setState(() {

              });
            },
            rowsCount: dataSource.length,
            columnsCount: 2,
            columnsWidths: columnWidths,
            rowWidth: constraints.maxWidth,
            rows: List<ExpandTableRow>.generate(dataSource.length,
                    (rowIndex){
                  var item = dataSource[rowIndex];
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
  _generateRow(ExpandTableRow row, Map item) {
    bool containChild = item.keys.contains("child");
    List<Widget> cells = [];
    var color = currentTheme.fontColor;
    for (int i = 0; i < item.keys.length; i++) {
      var key = item.keys.elementAt(i);
      if (key == "child") continue;
      cells.add(Container(
        child: SelectionArea(
          child: generateTextWidget(text: key.toString() ,textColor:  color, maxLines: 100),
        ) ,
      ));
      cells.add(IntrinsicHeight(
        child: Row(
          children: [
            Container(
                width: 1,
                margin: EdgeInsets.only(right: 3),
                color: convertStringToColor("#d0d0d0",alpha: 0.8)
            ),
            Expanded(child: SelectionArea(child: Container(
              child: generateTextWidget(text: item[key].toString() ,textColor:  color, maxLines: 100), // child: DefaultTextField(item[key].toString()),
            )))
          ],
        ),
      ));
    }
    row.cells = cells;
    if (containChild) {
      List children = item["child"];
      row.childs = List<ExpandTableRow>.generate(children.length, (index){
        var childItem = children[index];
        var child = ExpandTableRow(
          cells: [],
          columnWidths: columnWidths,
        );
        _generateRow(child, childItem);
        return child;
      });
    }

  }

  List generateFields(MALPacket packet) {
    List ret = [];
    ret.add({"number" :"${packet.number}"});
    ret.add({"stream_index" :"${packet.index}"});
    ret.add({"pos" :"${packet.pos}"});
    ret.add({"size" :"${packet.size}"});
    ret.add({"dts" :"${packet.dts}"});
    ret.add({"dts_time" :"${packet.dtsTime}"});
    ret.add({"pts" :"${packet.pts}"});
    ret.add({"pts_time" :"${packet.ptsTime}"});
    ret.add({"poc" :"${packet.poc}"});
    ret.add({"nal_count":"${packet.nals.length}"});
    for (int i = 0; i < packet.nals.length; i++) {
      List<Map<String,String>> nal_childs = [];
      var nal = packet.nals[i];
      String key = "nal[${i}]";
      String val = "";
      if (nal.hasAvcNal()) {
        val = nal.avcNal.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.avcNal.base.nalUnitType});
        // nal_childs.add({"nal_ref_idc":nal.avcNal.nalRefIdc});
      } else if (nal.hasAvcSps()) {
        val = nal.avcSps.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.avcSps.base.base.nalUnitType});
        // nal_childs.add({"nal_ref_idc":nal.avcSps.base.nalRefIdc});
        // nal_childs.add({"profile_idc":nal.avcSps.profileIdc});
        // nal_childs.add({"level_idc":nal.avcSps.levelIdc});
        // nal_childs.add({"seq_parameter_set_id":nal.avcSps.seqParameterSetId});
        // nal_childs.add({"chroma_format_idc":nal.avcSps.chromaFormatIdc});
        // nal_childs.add({"bit_depth_luma_minus8":nal.avcSps.bitDepthLumaMinus8});
        // nal_childs.add({"bit_depth_chroma_minus8":nal.avcSps.bitDepthChromaMinus8});
        // nal_childs.add({"log2_max_frame_num_minus4":nal.avcSps.log2MaxFrameNumMinus4});
        // nal_childs.add({"max_num_ref_frames":nal.avcSps.maxNumRefFrames});
        // nal_childs.add({"pic_width_in_mbs_minus1":nal.avcSps.picWidthInMbsMinus1});
        // nal_childs.add({"pic_height_in_map_units_minus1":nal.avcSps.picHeightInMapUnitsMinus1});
        // nal_childs.add({"frame_cropping_flag":nal.avcSps.frameCroppingFlag});
      } else if (nal.hasAvcPps()) {
        val = nal.avcPps.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.avcPps.base.base.nalUnitType});
        // nal_childs.add({"nal_ref_idc":nal.avcPps.base.nalRefIdc});
      } else if (nal.hasAvcSei()) {
        val = nal.avcSei.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.avcSei.base.base.nalUnitType});
        // nal_childs.add({"nal_ref_idc":nal.avcSei.base.nalRefIdc});
        // for (int i = 0 ; i < nal.avcSei.messageList.length; i ++) {
        //   var message = nal.avcSei.messageList[i];
        //   nal_childs.add({"${message.keyHex}\n(${message.key})":"${message.valueHex}\n(${message.value})"});
        // }
      } else if (nal.hasAvcPartARbsp()) {
        val = nal.avcPartARbsp.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.avcPartARbsp.base.base.nalUnitType});
        // nal_childs.add({"nal_ref_idc":nal.avcPartARbsp.base.nalRefIdc});
      } else if (nal.hasAvcOutRbsp()) {
        val = nal.avcOutRbsp.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.avcOutRbsp.base.base.nalUnitType});
        // nal_childs.add({"nal_ref_idc":nal.avcOutRbsp.base.nalRefIdc});
      }

      if (nal.hasHevcNal()) {
        val = nal.hevcNal.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.hevcNal.base.nalUnitType});
        // nal_childs.add({"forbidden_zero_bit":nal.hevcNal.forbiddenZeroBit});
        // nal_childs.add({"nuh_layer_id":nal.hevcNal.nuhLayerId});
        // nal_childs.add({"nuh_temporal_id_plus1":nal.hevcNal.nuhTemporalIdPlus1});
      } else if (nal.hasHevcVps()) {
        val = nal.hevcVps.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.hevcVps.base.base.nalUnitType});
        // nal_childs.add({"forbidden_zero_bit":nal.hevcVps.base.forbiddenZeroBit});
        // nal_childs.add({"nuh_layer_id":nal.hevcVps.base.nuhLayerId});
        // nal_childs.add({"nuh_temporal_id_plus1":nal.hevcVps.base.nuhTemporalIdPlus1});
        //
        // nal_childs.add({"video_parameter_set_id":nal.hevcVps.videoParameterSetId});

      } else if (nal.hasHevcSps()) {
        val = nal.hevcSps.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.hevcSps.base.base.nalUnitType});
        // nal_childs.add({"forbidden_zero_bit":nal.hevcSps.base.forbiddenZeroBit});
        // nal_childs.add({"nuh_layer_id":nal.hevcSps.base.nuhLayerId});
        // nal_childs.add({"nuh_temporal_id_plus1":nal.hevcSps.base.nuhTemporalIdPlus1});
        //
        // nal_childs.add({"sps_video_parameter_set_id":nal.hevcSps.spsVideoParameterSetId});
        // nal_childs.add({"seq_parameter_set_id":nal.hevcSps.seqParameterSetId});
        // nal_childs.add({"pic_width_in_luma_samples":nal.hevcSps.picWidthInLumaSamples});
        // nal_childs.add({"pic_height_in_luma_samples":nal.hevcSps.picHeightInLumaSamples});
        // nal_childs.add({"log2_max_pic_order_cnt_lsb_minus4":nal.hevcSps.log2MaxPicOrderCntLsbMinus4});
        // nal_childs.add({"log2_min_luma_coding_block_size_minus3":nal.hevcSps.log2MinLumaCodingBlockSizeMinus3});
        // nal_childs.add({"log2_diff_max_min_luma_coding_block_size":nal.hevcSps.log2DiffMaxMinLumaCodingBlockSize});
        // nal_childs.add({"separate_colour_plane_flag":nal.hevcSps.separateColourPlaneFlag});
        // nal_childs.add({"num_short_term_ref_pic_sets":nal.hevcSps.numShortTermRefPicSets});
      } else if (nal.hasHevcPps()) {
        val = nal.hevcPps.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.hevcPps.base.base.nalUnitType});
        // nal_childs.add({"forbidden_zero_bit":nal.hevcPps.base.forbiddenZeroBit});
        // nal_childs.add({"nuh_layer_id":nal.hevcPps.base.nuhLayerId});
        // nal_childs.add({"nuh_temporal_id_plus1":nal.hevcPps.base.nuhTemporalIdPlus1});
        //
        // nal_childs.add({"pic_parameter_set_id":nal.hevcPps.picParameterSetId});
        // nal_childs.add({"seq_parameter_set_id":nal.hevcPps.seqParameterSetId});
        // nal_childs.add({"dependent_slice_segments_enabled_flag":nal.hevcPps.dependentSliceSegmentsEnabledFlag});
        // nal_childs.add({"num_extra_slice_header_bits":nal.hevcPps.numExtraSliceHeaderBits});
        // nal_childs.add({"output_flag_present_flag":nal.hevcPps.outputFlagPresentFlag});
      } else if (nal.hasHevcRbsp()) {
        val = nal.hevcRbsp.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.hevcRbsp.base.base.nalUnitType});
        // nal_childs.add({"forbidden_zero_bit":nal.hevcRbsp.base.forbiddenZeroBit});
        // nal_childs.add({"nuh_layer_id":nal.hevcRbsp.base.nuhLayerId});
        // nal_childs.add({"nuh_temporal_id_plus1":nal.hevcRbsp.base.nuhTemporalIdPlus1});
        //
        // nal_childs.add({"first_slice_segment_in_pic_flag":nal.hevcRbsp.header.firstSliceSegmentInPicFlag});
        // nal_childs.add({"no_output_of_prior_pics_flag":nal.hevcRbsp.header.noOutputOfPriorPicsFlag});
        // nal_childs.add({"slice_pic_parameter_set_id":nal.hevcRbsp.header.slicePicParameterSetId});
        // nal_childs.add({"slice_segment_address":nal.hevcRbsp.header.sliceSegmentAddress});
        // nal_childs.add({"slice_type":nal.hevcRbsp.header.sliceType});
        // nal_childs.add({"slice_pic_order_cnt_lsb":nal.hevcRbsp.header.slicePicOrderCntLsb});
      } else if (nal.hasHevcSei()) {
        val = nal.hevcSei.base.base.nalName;
        // nal_childs.add({"nal_unit_type":nal.hevcSei.base.base.nalUnitType});
        // nal_childs.add({"forbidden_zero_bit":nal.hevcSei.base.forbiddenZeroBit});
        // nal_childs.add({"nuh_layer_id":nal.hevcSei.base.nuhLayerId});
        // nal_childs.add({"nuh_temporal_id_plus1":nal.hevcSei.base.nuhTemporalIdPlus1});
        //
        // for (int i = 0 ; i < nal.hevcSei.messageList.length; i ++) {
        //   var message = nal.hevcSei.messageList[i];
        //   nal_childs.add({"${message.keyHex}\n(${message.key})":"${message.valueHex}\n(${message.value})"});
        // }
      }
      for (var el in nal.displayFields) {
        nal_childs.add({el.name:el.value});
      }
      ret.add({key : val,"child":nal_childs});
    }
    return ret;
  }

  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "click_pkt") {
      // print(arguments);
      setState(() {
        pkt = arguments["pkt"];
        frame = arguments["frame"];//rgb数据不全
        dataSource = generateFields(pkt!);
      });

    }
  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["click_pkt"];
  }
  @override
  void dispose() {
    // TODO: implement dispose
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }
}