import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:window_manager/window_manager.dart';

import 'history/history_open_widget.dart';
import 'right/right_panel.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage>{
  final MultiSplitViewController _controller = MultiSplitViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _controller.areas = [Area(weight: 0.25,minimalWeight: 0.2), Area()];
    final List<Widget> children = [const HistoryOpenWidget(),RightPanel(),];
    MultiSplitView multiSplitView = MultiSplitView(
        controller: _controller,
        // onWeightChange:_onWeightChange,
        // initialAreas: [Area(weight: 0.1),Area(weight: 0.9)],
        children: children);
    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data:
        MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved2()),
        child: multiSplitView);
    return Scaffold(
        body: Container(
          color: convertStringToColor("#3b3f41"),
          child: Row(children: [Expanded(child: theme)]),
        )
      // body: horizontal,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
} 