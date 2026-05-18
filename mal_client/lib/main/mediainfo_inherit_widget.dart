import 'package:flutter/material.dart';

import 'media_info.dart';

class MediaInfoInheritWidget extends InheritedWidget with MediaInfo{
  MediaInfoInheritWidget({super.key, required Widget child}) : super (child: child);

  @override
  bool updateShouldNotify(MediaInfoInheritWidget oldWidget) {
    // prsCtx = oldWidget.prsCtx;
    // path = oldWidget.path;
    // selectedMediaType = oldWidget.selectedMediaType;
    return false;
  }
}

class MediaInfoWidget extends StatelessWidget {
  final String path;
  final Widget child;
  const MediaInfoWidget({Key? key, required this.path, required this.child}) : super (key: key);
  static Map<Key,Widget> widgets = {};
  @override
  Widget build(BuildContext context) {
    if (!widgets.containsKey(key)) {
      widgets[key!] =  MediaInfoInheritWidget(
        child: child,
      );
    }
    return widgets[key!]!;
  }
  static MediaInfoInheritWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MediaInfoInheritWidget>();
  }

  // @override
  // State<StatefulWidget> createState() => _MediaInfoWidgetState();
}
