import 'dart:ffi';
import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:mal_client/main/open_window.dart';
import 'package:mal_client/rpc_client/proto_gen/mal_service.pb.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:window_manager/window_manager.dart';

import '../theme/theme_manager.dart';
import '../utils/dialog.dart';
import 'bottom/bottom_panel.dart';
import 'bottom_toolbar.dart';
import 'mediainfo_inherit_widget.dart';
import 'top/packet_panel.dart';
class MainPage extends StatefulWidget{
  final String path;
  WindowController? _windowsController;
  MainPage(this.path,{Key? key, WindowController? windowsController }) : super(key: key) {
    _windowsController = windowsController;
  }
  @override
  MainPageState createState() => MainPageState();
}


class MainPageState extends State<MainPage> with WindowListener {
  final MultiSplitViewController _controller = MultiSplitViewController();
  PacketPanel packetPanel = const PacketPanel();
  BottomPanel bottomPanel = const BottomPanel();
  final flashController = Ref<FlashController?>(null);
  void showError(ParseFileResponse? response) {
    if (response == null) return;
    if (response.base.success) return;
    var errMsg = "文件解析遇到错误";
    if (response.base.errorMessage.isNotEmpty) {
      errMsg += " error: ${response.base.errorMessage}";
    }
    MDPDialog.show(context,title: "遇到了错误",content: errMsg, onConfirm: (){
      widget._windowsController?.close();
    });
  }
  void startParse()  async{
    debugPrint("startParse 开始");
    var response = await MediaInfoWidget.of(context)?.startParser(widget.path);
    if (response?.base.success ?? false)  {
      debugPrint("startParse 开始通知");
      MethodListen.shareInstance().postMethod("parse_complete", null);
      debugPrint("startParse 结束通知");
    } else {
      showError(response);
    }
    debugPrint("startParse 结束");
  }
  /// ================== 核心：系统 × 被点击 ==================
  @override
  Future<bool> onWindowClose() async {
    MediaInfoWidget.of(context)?.closeClient();
    widget._windowsController?.close();
    return true;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startParse();
    });
    windowManager.addListener(this);
  }
  @override
  Widget build(BuildContext context) {
    _controller.areas = [Area(weight: 0.2,minimalWeight: 0.1), Area()];
    final List<Widget> children = [packetPanel,bottomPanel];
    MultiSplitView multiSplitView = MultiSplitView(
        controller: _controller,
        axis: Axis.vertical,
        // onWeightChange:_onWeightChange,
        // initialAreas: [Area(weight: 0.1),Area(weight: 0.9)],
        children: children);
    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved1(backgroundColor: stringColor(ThemeManager.theme.splitBgColor)),dividerThickness: 5),
        child: multiSplitView
    );
    return PlatformMenuBar(menus: <PlatformMenuItem>[
    PlatformMenu(
        label: '',
        menus: <PlatformMenuItem>[
          PlatformMenuItemGroup(
            members: <PlatformMenuItem>[
              PlatformMenuItem(
                label: '',
                onSelected: () {

                },
              ),
            ],
          ),
        ]
      ),
      PlatformMenu(
          label: '文件',
          menus: <PlatformMenuItem>[
            PlatformMenuItemGroup(
              members: <PlatformMenuItem>[
                PlatformMenuItem(
                  label: '打开',
                  onSelected: () {
                      openFile();
                  },
                ),
              ],
            ),
          ]
      ),
      PlatformMenu(
          label: '视图',
          menus: <PlatformMenuItem>[
            PlatformMenuItemGroup(
              members: <PlatformMenuItem>[
                PlatformMenuItem(
                  label: 'YUV查看',
                  onSelected: () {
                    OpenWindow.openYUVViewWindow(context);
                  },
                ),
                PlatformMenuItem(
                  label: '跳转到指定帧',
                  onSelected: () {
                    jumpFrame();
                  },
                )
              ],
            ),
          ]
      )
    ],child: Container(
      color: convertStringToColor("#3b3f41"),
      child: Column(
          children: [
            Expanded(child: theme),
            Container(
              height: 20,
              child: BottomToolBar(widget.path),
            )
          ]
      ),
    ));
    return Scaffold(
        body: Container(
          color: convertStringToColor("#3b3f41"),
          child: Column(
              children: [
                Expanded(child: theme),
                Container(
                  height: 20,
                  child: BottomToolBar(widget.path),
                )
            ]
          ),
        )
      // body: horizontal,
    );
  }
  bool _isNumeric(String input) {
    final regex = RegExp(r'^-?[0-9]+\.?[0-9]*$'); // 匹配正负整数或浮点数
    return regex.hasMatch(input);
  }
  void jumpFrame() async{
    final TextEditingController _inputController = TextEditingController(text: "");
    final TextEditingController _messageController = TextEditingController(text: "");

    MDPDialog.showWidget(context, flashController,  Container(
      width: 200,
      height: 120,
      child: Column(
        children: [
          TextField(
            controller: _inputController, // 设置默认文字
            decoration: const InputDecoration(
              labelText: "帧号: ",
              border: OutlineInputBorder(),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextButton(onPressed: (){
              bool b =  _isNumeric(_inputController.text);
              if (!b) {
                _messageController.text = "请输入正确的数字";
              } else {
                _messageController.text = "";
                gotoPkt(int.parse(_inputController.text));

              }
            }, child: generateTextWidget(text: "确定")),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.only(top: 10),
            height: 20,
            child: TextField(
              enabled: false,
              textAlign: TextAlign.center,
              controller: _messageController, // 设置默认文字
              style: TextStyle(color: Colors.red, fontSize: 12, decoration: TextDecoration.none),
              decoration: const InputDecoration(
                hintText: "", // 提示文字
                border: InputBorder.none, // 去掉边框
              ),
            ),
          ))
        ],
      ),
    ),barrierDismissible: true);
  }
  void showLoading() {

  }
  void gotoPkt(int num) {
    flashController.value?.dismiss();
    MethodListen.shareInstance().postMethod("jump_frame", {"num":num});
  }
  void openFile() async {
    OpenWindow.openFile(context,callback: ({dynamic arg1, dynamic arg2, dynamic arg3}) {
      OpenWindow.refreshHistory(arg1.toString(), arg2.toString());
      OpenWindow.openMainWindow(arg2.toString());
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

}
