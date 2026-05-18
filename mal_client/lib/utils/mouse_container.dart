import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class MouseContainer extends StatelessWidget {
  final Object? opaque;
  final Widget child;
  void Function(Object?,PointerEnterEvent)? onEnter;
  void Function(Object?,PointerExitEvent)? onExit;
  void Function(Object?,PointerHoverEvent)? onHover;
  MouseContainer({super.key,required this.child, this.opaque,this.onEnter,this.onHover,this.onExit});

  void _onEnter(PointerEnterEvent event) {
    onEnter?.call(opaque,event);
  }
  void _onExit(PointerExitEvent event) {
    onExit?.call(opaque,event);
  }
  void _onHover(PointerHoverEvent event) {
    onHover?.call(opaque,event);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        onHover: _onHover,
        child: child,
      );
  }

}