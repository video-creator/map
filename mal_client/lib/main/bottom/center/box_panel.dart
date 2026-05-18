import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:base_utility/widget_tool/udid.dart';
import 'package:base_utility/widget_tool/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:mal_client/rpc_client/proto_gen/atom.pb.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';

import '../../../theme/theme_manager.dart';
import '../../mediainfo_inherit_widget.dart';

class BoxPanel extends StatefulWidget {
  const BoxPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BoxPanelState();
  }

}

class BoxPanelState extends State<BoxPanel> implements MethodListenInterface{
  List<Node<dynamic>> nodes = [];
  TreeViewController? _treeViewController;
  String? _selectedKey;
  TreeViewTheme? treeViewTheme;
  @override
  void initState() {
    super.initState();
    treeViewTheme = _initTreeViewTheme();
    MethodListen.shareInstance().appendMethodCallListener(this);
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      updateDataSource();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _treeViewController == null ? const LoadingWidget():Container(
      color: convertStringToColor(ThemeManager.theme.centerPanelColor),
      child: TreeView(
        controller: _treeViewController!,
        theme: treeViewTheme,
        allowParentSelect: true,
        nodeBuilder: (context,node) {
          double fontSize = 15;
          String textColor = ThemeManager.theme.fontColor;
          double top = 2;
          if (node.key == _selectedKey) {
            fontSize = 20 ;
            textColor = "#d54a4b";
            top = 0;
          }
          return Container(
            child: generateTextWidget(text: node.label,textSize:fontSize,textColor: textColor),
            height: 25,
            padding: EdgeInsets.only(top: top),
            alignment: Alignment.topLeft,
            // color: node.key == _selectedKey ? Colors.blue : Colors.transparent,
          );
        },
        onExpansionChanged: (key, expanded) {
          Node? node = _treeViewController?.getNode(key);
          if (node != null) {
            List<Node>? updated = _treeViewController?.updateNode(key, node.copyWith(expanded: expanded));
            setState(() {
              _treeViewController = _treeViewController?.copyWith(children: updated,selectedKey: key);
            });
          }
        },
        onNodeTap: (key) {
            _selectedKey = key;
            Node? node = _treeViewController?.getNode(key);
            if (node != null && node.data != null) {
              // Pointer<MDPAtom> atom = node!.data!;
              // debugPrint("点击了 ${atom.ref.name.cast<Utf8>().toDartString()}");
              MethodListen.shareInstance().postMethod("switch_atom", node.data);
            }
            setState(() {
            });
        },
      ),
    );
  }
  TreeViewTheme _initTreeViewTheme(){
    TreeViewTheme treeViewTheme = TreeViewTheme(
      labelStyle: TextStyle(
        color: convertStringToColor("#ffffff"),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      parentLabelStyle: TextStyle(
        color: convertStringToColor("#ffffff"),
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),
      iconTheme: IconThemeData(
        color: ThemeManager.isDark() ? Colors.white : Colors.black87,
        size: 14,
      ),
      iconPadding: 5,
      expanderTheme: ExpanderThemeData(
        color: ThemeManager.isDark() ? Colors.white : Colors.black87,
        type: ExpanderType.caret
      )
    );
    return treeViewTheme;
  }

  Node createNode(MALAtom atom,{int level = 0}) {
    List<Node> children = [];
    Node node = Node(
        key: uuid(),
        label: atom.name,
        children: children,
        parent: children.isNotEmpty,
        expanded: level < 2 ? true : false,
        icon: children.isEmpty ? Icons.star : Icons.account_balance_sharp,
        data: atom
    );
    level++;
    for (var child in atom.childBoxes) {
      children.add(createNode(child,level: level));
    }
    return node;
  }
  void updateDataSource() {
    debugPrint("updateDataSource 开始");
    var rootAtom = MediaInfoWidget.of(context)?.formatContext?.rootAtom;
    debugPrint("是否获取数据:${rootAtom != null}");
    if (rootAtom != null) {
      nodes = [createNode(rootAtom)];
      _treeViewController = TreeViewController(
        children: nodes,
        selectedKey: "",
      );
    }
    setState(() {

    });
  }
  @override
  invokeMethodCall(String key, arguments) {
    // TODO: implement invokeMethodCall
    if (key == "parse_complete") {
      updateDataSource();
    }
  }

  @override
  listenMethodName() {
    // TODO: implement listenMethodName
    return ["parse_complete"];
  }
  @override
  void dispose() {
    MethodListen.shareInstance().removeMethodListener(this);
    super.dispose();
  }
}