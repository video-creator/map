import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../../../theme/theme_manager.dart';
import 'box_panel.dart';
import 'info_panel.dart';

class CenterPanel extends StatefulWidget {
  const CenterPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CenterPanelState();
  }

}

class CenterPanelState extends State<CenterPanel> {
  final MultiSplitViewController _controller = MultiSplitViewController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _controller.areas = [Area(weight: 0.25,minimalWeight: 0.2), Area()];
    final List<Widget> children = [const BoxPanel(),const InfoPanel(),];
    MultiSplitView multiSplitView = MultiSplitView(
        controller: _controller,
        // onWeightChange:_onWeightChange,
        // initialAreas: [Area(weight: 0.1),Area(weight: 0.9)],
        children: children);
    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data:
        MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved2(backgroundColor: stringColor(ThemeManager.theme.splitBgColor))),
        child: multiSplitView);
    return Scaffold(
        body: Container(
          child: Column(children: [Expanded(child: theme)]),
        )
      // body: horizontal,
    );
  }

}