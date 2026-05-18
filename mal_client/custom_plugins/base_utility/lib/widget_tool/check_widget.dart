// 选中按钮，用在是否匿名，是否阅读协议等
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckWidgetController extends ValueNotifier<bool>{
  CheckWidgetController(bool value) : super(value);
  void setChecked(bool checked) {
    value = checked;
  }
  bool checked() {
    return value;
  }
  void switchCheckedState() {
    value = !value;
  }
}

class CheckWidget extends StatefulWidget {
  final String unCheckedImageName;
  final String checkedImageName;
  final bool defaultChecked;
  final CheckWidgetController checkWidgetController;
  final EdgeInsets insets;
  const CheckWidget(
      this.unCheckedImageName,
      this.checkedImageName,
      this.defaultChecked,
      this.checkWidgetController,
     {super.key, this.insets = EdgeInsets.zero}
      );
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckWidgetState(defaultChecked, checkWidgetController);
  }
}

class _CheckWidgetState extends State<CheckWidget> {
  bool checked = false;
  final CheckWidgetController _checkWidgetController;
  _CheckWidgetState(this.checked, this._checkWidgetController);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkWidgetController.addListener(update);
  }
  void update() {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    //    // TODO: implement build
    return Container(
      child: GestureDetector(
        child: Container(
          padding: widget.insets,
          child: Image.asset(
            widget.checkWidgetController.value ? widget.checkedImageName : widget.unCheckedImageName,
            scale: 3.0,
          ),
        ),
        onTap: (){
          _checkWidgetController.switchCheckedState();
        },
      ),
    );
  }
  @override
  void dispose() {
    _checkWidgetController.removeListener(update);
    // TODO: implement dispose
    super.dispose();
  }
}