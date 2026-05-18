import 'package:base_utility/utiles/colors.dart';
import 'package:base_utility/utiles/string.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/material.dart';

class HistoryItemWidget extends StatefulWidget {
  final int index;
  final String title;
  final String path;
  const HistoryItemWidget(this.index,this.title,this.path,{Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HistoryItemWidgetState();
  }

}
class HistoryItemWidgetState extends State<HistoryItemWidget> {
  final List<String> randomColors = ["#AA64CF","#D5613E","#D5623E","#4AAFE1","#8267CD","#33C8A6","#999999"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 5, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Container(
              width: 30,
              height: 30,
              color: randomColor(colors: randomColors),
              child: Container(
                alignment: Alignment.center,
                child: generateTextWidget(text: widget.title.characters.first),
              ),
            ),
          ),
          Container(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 5,),
                generateTextWidget(text: breakWord(widget.title),textColor: "#FFFFFF",textSize: 14),
                Container(height: 8,),
                generateTextWidget(text: breakWord(widget.path),textColor: "#777777",textSize: 12)
              ],
            ),
          )
        ],
      )
    );
  }

}