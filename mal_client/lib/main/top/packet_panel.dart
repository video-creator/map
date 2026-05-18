import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:ffi/ffi.dart';
import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:fixnum/src/int64.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';

import '../../utils/pointer.dart';
import '../mediainfo_inherit_widget.dart';
import 'packet_info.dart';

class PacketPanel extends StatefulWidget {
  const PacketPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return PacketPanelState();
  }

}

class PacketPanelState extends State<PacketPanel> implements MethodListenInterface{
  List<MALPacket> dataSource = [];
  Map<Int64, MALFrame> frames = {};
  Int64 maxSampleSize = Int64();
  Map<int,LayerLink> layerLinks = {};
  PacketInfoPanelController infoPanelController = PacketInfoPanelController();
  final ScrollController _scrollController = ScrollController();
  int firstVisiblePktIndex = -1;
  bool scrolling = false;
  Timer? frameTimer;
  MALPacket? selectPkt;
  double itemWidth = 18;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodListen.shareInstance().appendMethodCallListener(this);
  }
  Widget createItem(MALPacket pkt,LayerLink layerLink,double heightFactor, String colorStr) {
    Color? color = convertStringToColor(colorStr);
    if (selectPkt != null && selectPkt!.pos == pkt.pos) {
        color = convertStringToColor(colorStr,alpha: 1);
    }
    return Container(
      width: itemWidth,
      alignment: Alignment.bottomCenter,
      child: CompositedTransformTarget(
        link: layerLink,
        child: Container(
          width: 15,
          child: Column(
            children: [
              Expanded(child: Container()),
              Visibility(
                visible: frames.containsKey(pkt.pos) , // 设置为 false 使子组件不可见
                maintainSize: true, // // 关键属性：保留所占空间
                maintainAnimation: true,
                maintainState:true,
                child: Container(
                  width: 10,
                  height: 10 ,
                  color: selectPkt == pkt ? Colors.red[400] : Colors.green[300],

                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 2),
                  child: RotatedBox(
                  quarterTurns: 1,
                  child: generateTextWidget(text: "${pkt.poc}", textSize: 10, maxLines: 1,overflow: TextOverflow.visible, textColor:"#ffffff"),
                ),
              ),
              Expanded(child: FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                widthFactor: 1,
                heightFactor: heightFactor,
                child: Container(
                  color: color,
                ),
              ))

            ],
          ),
        ),
      ),
    );
  }
  bool _onNotification(ScrollNotification notice) {
    switch (notice.runtimeType) {
      case ScrollStartNotification:
        scrolling = true;
        cancelDecodeFrames();
        break;
      case ScrollUpdateNotification:
        // scrolling = true;
        // cancelDecodeFrames();
        break;
      case ScrollEndNotification:
        scrolling = false;
        startDecodeFrames();
        break;
      case OverscrollNotification:
        print("滚动到边界");
        break;
    }
    return true;
  }
  final GlobalKey listViewKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: RawScrollbar(
          thumbColor: Colors.white,
          radius: Radius.circular(16),
          thickness: 8,
          controller: _scrollController,
          thumbVisibility: true,
          child: NotificationListener(
              onNotification: _onNotification,
              child:ListView.builder(
                key: listViewKey,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  MALPacket pkt = dataSource[index];
                  Int64 size = pkt.size;
                  double heightFactor = 1;
                  if (maxSampleSize > 0) {
                    heightFactor = size.toDouble() / maxSampleSize.toDouble();
                  } else {
                    maxSampleSize = size > maxSampleSize ? size : maxSampleSize;
                    heightFactor = maxSampleSize > 0 ? size.toDouble() / maxSampleSize.toDouble() : 0;
                  }
                  heightFactor = max(0.1, heightFactor);
                  LayerLink? layerLink = layerLinks[index];
                  if (layerLink == null) {
                    layerLink = LayerLink();
                    layerLinks[index] = layerLink;
                  }
                  String color = "#000000";
                  String flag = "unknown";
                  if (pkt.flag == MALPacketFlag.MAL_PACKET_FLAG_IDR) {
                    color = "#FF3B30";
                    flag = "IDR";
                  } else if (pkt.flag == MALPacketFlag.MAL_PACKET_FLAG_I) {
                    color = "#FF6961";
                    flag = "I";
                  } else if (pkt.flag == MALPacketFlag.MAL_PACKET_FLAG_P) {
                    color = "#007AFF";
                    flag = "P";
                  } else if (pkt.flag == MALPacketFlag.MAL_PACKET_FLAG_B) {
                    color = "#FF9500";
                    flag = "B";
                  }
                  String textColor = "#ffffff";
                  bool current = false;
                  if (selectPkt!= null && selectPkt == pkt) {
                    textColor = "#FF3B3B";
                    current = true;
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            child: createItem(pkt, layerLink, heightFactor, color)
                          ),
                          onTap: () {
                            Map val = {"pkt":pkt};
                            if (dataSource.length == 1 && frames.isNotEmpty) {
                              val["frame"] = frames[0];
                            } else {
                              if (frames.containsKey(pkt.pos)) {
                                val["frame"] = frames[pkt.pos];
                              }
                            }
                            MethodListen.shareInstance().postMethod("click_pkt", val);
                            setState(() {
                              selectPkt = pkt;
                            });

                          },
                        ),
                      ),
                      Container(height: 1,),
                      Container(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: generateTextWidget(text: "$index($flag)", textSize: 10, textColor: textColor,maxLines: 1,overflow: TextOverflow.visible),
                        ),
                      ),
                      Visibility(
                        visible: current, child: Container(
                        height: 15,
                        child: Image.asset("assets/images/tuding.png"),
                      ))

                    ],
                  );
                  // return Column(
                  //   children: [
                  //     Expanded(
                  //       child: MouseContainer(
                  //         opaque: [index,layerLink],
                  //         onEnter: (Object? opaque, _) {
                  //           var args = opaque! as List;
                  //           int index = args[0];
                  //           infoPanelController.show(args[1],context,dataSource[index]);
                  //         },
                  //         onExit: (Object? opaque, _) {
                  //           infoPanelController.hide();
                  //         },
                  //         child: createItem(pkt,layerLink!,heightFactor),
                  //       ),
                  //     ),
                  //     Container(height: 3,),
                  //     Container(
                  //       height: 40,
                  //       child: RotatedBox(
                  //         quarterTurns: 1,
                  //         child: generateTextWidget(text: "$index", textSize: 10, textColor: "#ffffff",maxLines: 1,overflow: TextOverflow.visible),
                  //       ),
                  //     ),
                  //
                  //   ],
                  // );
                },
                padding: EdgeInsets.only(left: 10,right: 10),
                scrollDirection: Axis.horizontal,
                itemCount: dataSource.length,
              )
          ) ,
        ),
      ),
      onTap: (){
        // infoPanelController.hide();
      },
    );
  }

  void loadPacket() async{
    var response = await MediaInfoWidget.of(context)?.loadPackets();
    if (response?.base.success ?? false ) {
      if ((response?.packets.length ?? 0) > 0 ) {
        Future.delayed(const Duration(milliseconds: 30),(){
          loadPacket();
        });
        dataSource.addAll(response!.packets);
        MethodListen.shareInstance().postMethod("current_parse_packet_num",{"num":dataSource.length});
      } else {
        MethodListen.shareInstance().postMethod("packets_load_complete",{});
      }
    }
    setState(() {

    });
  }
  List<T> stableSort<T>(List<T> list, int Function(T, T) compare) {
    // Step 1: 创建临时列表
    List<MapEntry<int, T>> indexedList =
    list.asMap().entries.toList();

    // Step 2: 排序时考虑原始索引以确保稳定性
    indexedList.sort((a, b) {
      // 主要比较器
      int result = compare(a.value, b.value);
      // 保证稳定性：若比较器结果为0则比较索引
      return result != 0 ? result : a.key.compareTo(b.key);
    });

    // Step 3: 返回排序后的列表
    return indexedList.map((e) => e.value).toList();
  }

  void needScroll(bool next,{bool center = false}) {
    if (selectPkt == null) return;
    final RenderBox listViewBox =
    listViewKey.currentContext?.findRenderObject() as RenderBox;
    double start = 0;
    if (next) {
      start = (selectPkt!.number + 2).toDouble() * itemWidth;
    } else {
      start = (selectPkt!.number).toDouble() * itemWidth;
    }
     if (center) {
       double x = start - listViewBox.size.width / 2.0;
       _scrollController.animateTo(max(0, x), duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
     } else {
       if (_scrollController.offset > start || _scrollController.offset + listViewBox.size.width < start) {
         if (next) {
           _scrollController.animateTo(start - listViewBox.size.width, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
         } else {
           _scrollController.animateTo(start, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
         }

       }
     }

  }
  void gotoFrame(int num) {
    if (dataSource.length < num) {
     return;
    }
    selectPkt = dataSource[num];
    needScroll(true,center: true);

    setState(() {
    });
  }
  void nextFrame(MALPacket cur) {
    int curIndex = cur.number.toInt();
    int idrIndex = -1;
    while(curIndex >= 0) {
      if (dataSource[curIndex].flag == MALPacketFlag.MAL_PACKET_FLAG_IDR) {
        idrIndex = curIndex;
        break;
      }
      curIndex--;
    }
    int nextIdrIndex = dataSource.length;
    curIndex = cur.number.toInt()+1;
    while(curIndex < dataSource.length) {
      if (dataSource[curIndex].flag == MALPacketFlag.MAL_PACKET_FLAG_IDR) {
        nextIdrIndex = curIndex;
        break;
      }
      curIndex++;
    }
    if (idrIndex >= 0) {
      List<MALPacket> list = [];
      for (var i = idrIndex; i < nextIdrIndex; i++) {
        list.add(dataSource[i]);
      }
      list = stableSort(list, (a, b) => a.poc.compareTo(b.poc));
      for (var i = 0; i < list.length; i++) {
        if (list[i].number == cur.number) {
          curIndex = i;
          break;
        }
      }
      if (curIndex == list.length-1) {
        if (nextIdrIndex == dataSource.length) {
          debugPrint("最后一帧了！！！");
          return;
        }
        selectPkt = dataSource[nextIdrIndex];
      } else {
        curIndex++;
        selectPkt = list[curIndex];
      }
      scrollToFrame(true);

      setState(() {
      });
    }

  }
  void scrollToFrame(bool next, {bool center = false}) {
    if (selectPkt != null) {
      Map val = {"pkt":selectPkt};
      if (frames.containsKey(selectPkt!.pos)) {
        val["frame"] = frames[selectPkt!.pos];
      }
      MethodListen.shareInstance().postMethod("click_pkt", val);
      needScroll(next, center: center);
    }
  }
  void preFrame(MALPacket cur) {
    int curIndex = cur.number.toInt();
    int idrIndex = -1;
    while(curIndex >= 0) {
      if (dataSource[curIndex].flag == MALPacketFlag.MAL_PACKET_FLAG_IDR) {
        idrIndex = curIndex;
        break;
      }
      curIndex--;
    }
    int nextIdrIndex = dataSource.length;
    curIndex = cur.number.toInt()+1;
    while(curIndex < dataSource.length) {
      if (dataSource[curIndex].flag == MALPacketFlag.MAL_PACKET_FLAG_IDR) {
        nextIdrIndex = curIndex;
        break;
      }
      curIndex++;
    }
    if (idrIndex >= 0) {
      List<MALPacket> list = [];
      for (var i = idrIndex; i < nextIdrIndex; i++) {
        list.add(dataSource[i]);
      }
      list = stableSort(list, (a, b) => a.poc.compareTo(b.poc));
      for (var i = 0; i < list.length; i++) {
        if (list[i].number == cur.number) {
          curIndex = i;
          break;
        }
      }
      if (curIndex == 0) { //关键帧，要取上一个gop的最后一帧
        list.clear();
        if (cur.number == 0) {
          debugPrint("第一帧！！！");
          return;
        }
        curIndex = cur.number.toInt()-1;
        while(curIndex >= 0) {
          list.add(dataSource[curIndex]);
          if (dataSource[curIndex].flag == MALPacketFlag.MAL_PACKET_FLAG_IDR) {
            break;
          }
          curIndex--;
        }
        if (list.isNotEmpty) {
          list = stableSort(list, (a, b) => a.poc.compareTo(b.poc));
          selectPkt = list.last;
        }else {
          return;
        }

      } else {
        curIndex--;
        selectPkt = list[curIndex];
      }

      scrollToFrame(false);

      setState(() {
      });
    }

  }
  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
      if (key == "parse_complete") {
        maxSampleSize = MediaInfoWidget.of(context)?.currentStream?.maxSampleSize ?? Int64();
        Future.delayed(const Duration(milliseconds: 10),(){
          loadPacket();
          startDecodeFrames(delayMS: 0);
        });
      } else if (key == "next_frame") {
          MALPacket? cur = arguments["pkt"];
          if (cur != null) {
             nextFrame(cur);
          }

      } else if (key == "pre_frame") {
        MALPacket? cur = arguments["pkt"];
        if (cur != null) {
          preFrame(cur);
        }
      } else if (key == "cur_frame") {
        MALPacket? cur = arguments["pkt"];
        selectPkt = cur;
        scrollToFrame(false,center: true);
      } else if (key == "jump_frame") {
        int num = arguments["num"];
        gotoFrame(num);
      }
  }
  void cancelDecodeFrames() {
    print("取消解码");
    if (frameTimer != null) {
      frameTimer?.cancel();
    }
    frameTimer = null;
  }
  void startDecodeFrames({delayMS=100}){
    cancelDecodeFrames();
    frameTimer = Timer(Duration(milliseconds: delayMS), () async {
      int start = _scrollController.offset.toInt() ~/ itemWidth;
      if (firstVisiblePktIndex == start) {
        return;
      }
      print("解码开始");
      firstVisiblePktIndex = start;
      print("start====$start");
      var response = await MediaInfoWidget.of(context)?.loadFrames(firstVisiblePktIndex,size: 80);
      if (response?.base.success ?? false) {
        frames.clear();
        for (var frame in response!.frames) {
          frames[frame.pktPos] = frame;
        }
        setState(() {

        });
      }
      print("解码结束");
    });
  }
  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["parse_complete","next_frame","pre_frame", "cur_frame","jump_frame"];
  }
  @override
  void dispose() {
    cancelDecodeFrames();
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }
}