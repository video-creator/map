import 'dart:core';

import 'package:flutter/cupertino.dart';


class RadioCheckController extends ValueNotifier<int>{
  RadioCheckController({int value = 0}) : super(value);
  void switchIndex(int v) {
    value = v;
  }
}

class RadioCheckWidget extends StatefulWidget {
  final int index;
  final RadioCheckController controller;
  final String unCheckedImageName;
  final String checkedImageName;
  final EdgeInsets insets;
  final double imageScale;
  const RadioCheckWidget({super.key, required this.index, required this.controller,required this.unCheckedImageName,required this.checkedImageName, this.insets = EdgeInsets.zero,this.imageScale = 3.0});
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RadioCheckWidgetState();
  }
}
class RadioCheckWidgetState extends State<RadioCheckWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
        if(mounted) {
          setState(() {

          });
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: GestureDetector(
        child: Container(
          padding: widget.insets,
          child: Image.asset(
            widget.controller.value == widget.index ? widget.checkedImageName : widget.unCheckedImageName,
            scale: widget.imageScale,
          ),
        ),
        onTap: (){
          widget.controller.switchIndex(widget.index);
        },
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
