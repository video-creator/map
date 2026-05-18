import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckErrorWindow extends StatefulWidget{
  final List<dynamic> dataSource;
  const CheckErrorWindow(this.dataSource, {super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CheckErrorWindowState();
  }

}

class CheckErrorWindowState extends State<CheckErrorWindow> {
  String displayContent = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var index = 0; index < widget.dataSource.length;index++) {
      var str = widget.dataSource[index];
      displayContent = "${displayContent}\n\n${index+1}: ${str.toString()} \n";
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:  Container(
          margin: EdgeInsets.only(top: 40,left: 10,bottom: 10,right: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.amber[100], // 设置背景颜色
            borderRadius: BorderRadius.circular(8.0), // 设置圆角
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1.0,
            ),
            // 还可以添加更多装饰，如边框、阴影等
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              child: generateSelectableTextWidget(text: displayContent, textSize: 14, weight: FontWeight.bold, maxLines: null),
            ),
          ),
        ),
      ),
    );
  }

}
