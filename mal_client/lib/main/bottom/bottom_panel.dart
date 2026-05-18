import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../../theme/theme_manager.dart';
import 'center/center_panel.dart';
import 'left/meta_panel.dart';
import 'right/image_panel.dart';

class BottomPanel extends StatefulWidget {
  const BottomPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomPanelState();
  }

}

class BottomPanelState extends State<BottomPanel> {
  final MultiSplitViewController _controller = MultiSplitViewController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _controller.areas = [Area(weight: 0.15,minimalWeight: 0.05), Area(),Area(weight: 0.25,minimalWeight: 0.2)];
    final List<Widget> children = [const MetaPanel(),const CenterPanel(),ImagePanel()];
    MultiSplitView multiSplitView = MultiSplitView(
        controller: _controller,
        // onWeightChange:_onWeightChange,
        // initialAreas: [Area(weight: 0.1),Area(weight: 0.9)],
        children: children);
    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data:
        MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved1(backgroundColor: stringColor(ThemeManager.theme.splitBgColor),color: stringColor(currentTheme.splitColor))),
        child: multiSplitView);
    return Scaffold(
        body: Container(
          child: Column(children: [Expanded(child: theme)]),
        )
      // body: horizontal,
    );
  }

}