import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/utils/dialog.dart';

class YUVOperatePanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return YUVOperatePanelState();
  }

}
class YUVOperatePanelState extends State<YUVOperatePanel> {
  String borderColor = "#d3d3d3";
  String textColor = "#a9a9a9";
  double borderWidth = 1;
  String dragTips = "拖拽或者点击选择YUV文件";
  List<String> pixformats = ["YUV420P","NV12"];
  String? pixformat = "YUV420P";
  String filePath = "";
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  List<TextEditingController> linesizeController = [];
  Widget createLineSizeWidgets() {
    linesizeController.clear();
    List<Widget> widgets = [];
    int comp = 0;
    if (pixformat == "YUV420P") {
      comp = 3;
    } else if (pixformat == "NV12") {
      comp = 2;
    }
    for (int i = 0; i < comp; i++) {
      var controller = TextEditingController();
      linesizeController.add(controller);
      widgets.add(Container(
        padding: EdgeInsets.only(left: 20),
        width: 150,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "linesize${i}",
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
              fontSize: 14
          ),
        ),
      ));
    }
    return Row(
      children: widgets,
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: DropTarget(
                onDragEntered: (DropEventDetails? detail){
                  // debugPrint("onDragEntered==");
                  borderColor = "#3399ff";
                  borderWidth = 3;
                  textColor = "#a9a9a9";
                  dragTips = "放手使用该文件";
                  setState(() {

                  });
                },
                onDragExited: (DropEventDetails? detail) {
                  borderColor = "#d3d3d3";
                  textColor = "#a9a9a9";
                  borderWidth = 1;
                  if (filePath.isEmpty) {
                    dragTips = "拖拽或者点击选择YUV文件";
                  } else {
                    dragTips = filePath;
                  }
                  setState(() {

                  });
                },
                onDragUpdated: (DropEventDetails? detail) {
                  // debugPrint("onDragUpdated==");
                },
                onDragDone: (DropDoneDetails detail) {
                  debugPrint(detail.files.toString());
                  if (detail.files.isEmpty) {
                    return;
                  }
                  var item = detail.files.first;
                  if (item is DropItemDirectory) {
                    MDPDialog.showToast(context, Container(
                      child: generateTextWidget(text: "不支持文件夹！！", textColor: "#ffffff"),
                    ));
                    return;
                  }
                  if (item is DropItemFile) {
                    var fileItem = item as DropItemFile;
                    filePath = fileItem.path;
                  }
                  if (filePath.isEmpty) {
                    MDPDialog.showToast(context, Container(
                      child: generateTextWidget(text: "不支持文件夹！！", textColor: "#ffffff"),
                    ));
                    return;
                  }
                  textColor = "#333333";
                  dragTips = filePath;
                  setState(() {

                  });

                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: convertStringToColor(borderColor)!,width: borderWidth),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: generateTextWidget(text: dragTips, textSize: 12, textColor: textColor, maxLines: 10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  Container(
                    height: 36,
                    child: Row(
                      children: [
                        generateTextWidget(text: "宽度:"),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 150,
                          child: TextField(
                            controller: widthController,
                            decoration: InputDecoration(
                              labelText: "输入宽度",
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                        ),
                        Container(padding: EdgeInsets.only(left: 40),),
                        generateTextWidget(text: "高度:"),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 150,
                          child: TextField(
                            controller: heightController,
                            decoration: InputDecoration(
                              labelText: "输入高度",
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 20,),
                  Container(
                    height: 36,
                    child: Row(
                      children: [
                        generateTextWidget(text: "PixelFormat:"),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 150,
                          child: DropdownButton<String>(
                            value: pixformat,
                            items: pixformats.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                pixformat = newValue;
                              });
                            },
                            style: TextStyle(color: Colors.black87, fontSize: 12), // 文字样式
                            dropdownColor: Colors.white, // 下拉菜单背景颜色
                            underline: Container(
                              height: 1, // 下划线高度
                              color: Colors.blue, // 下划线颜色
                            ),
                          ),
                        ),
                        createLineSizeWidgets()
                      ],
                    ),
                  ),
                  Container(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        displayBtn(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // 背景颜色
                        onPrimary: Colors.white, // 文字颜色
                        padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15), // 内边距
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 圆角
                        ),
                      ),
                      child: Text('确定'),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  bool _isNumeric(String input) {
    var regex = RegExp(r'^[1-9][0-9]*$');
    return regex.hasMatch(input);
  }
  void displayBtn(BuildContext context) async{
    if (filePath.isEmpty) {
      MDPDialog.showToast(context, generateTextWidget(text: "请选择YUV文件！", textColor: "#ffffff"));
      return;
    }
    if (!_isNumeric(widthController.text)) {
      MDPDialog.showToast(context, generateTextWidget(text: "宽度输入不正确！", textColor: "#ffffff"));
      return;
    }
    if (!_isNumeric(heightController.text)) {
      MDPDialog.showToast(context, generateTextWidget(text: "高度输入不正确！", textColor: "#ffffff"));
      return;
    }

  }
}