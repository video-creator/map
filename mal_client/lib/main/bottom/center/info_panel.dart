import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../../../theme/theme_manager.dart';
import 'binary_panel.dart';
import 'field_info_panel.dart';

class InfoPanel extends StatefulWidget {
  const InfoPanel({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoPanelState();
  }

}

class InfoPanelState extends State<InfoPanel> {
  final MultiSplitViewController _controller = MultiSplitViewController();
  @override
  Widget build(BuildContext context) {
    _controller.areas = [Area(weight: 0.20,minimalWeight: 0.2), Area()];
    final List<Widget> children = [const FieldInfoPanel(),const BinaryPanel(),];
    MultiSplitView multiSplitView = MultiSplitView(
        controller: _controller,
        axis: Axis.vertical,
        // onWeightChange:_onWeightChange,
        // initialAreas: [Area(weight: 0.1),Area(weight: 0.9)],
        children: children);
    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data:
        MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved2(backgroundColor: stringColor(ThemeManager.theme.splitBgColor))),
        child: multiSplitView);
    return Scaffold(
        body: Container(
          color: convertStringToColor(currentTheme.centerPanelColor),
          child: Column(children: [Expanded(child: theme)]),
        )
      // body: horizontal,
    );
  }

}