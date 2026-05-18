import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_render_plugin/render_view.dart';
import 'package:mal_client/yuv_view/operate_panel.dart';

class YUVViewerWindow extends StatefulWidget{
  const YUVViewerWindow({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YUVViewerWindowState();
  }

}

class YUVViewerWindowState extends State<YUVViewerWindow> {
  String displayContent = "";
  RenderViewController? renderViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: YUVOperatePanel(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red,
                    child: RenderView(renderViewController),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
