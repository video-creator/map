
import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/cupertino.dart';

enum BackStyle {
  none, //隐藏
  backImage //返回
}
class NavBarWidget extends StatefulWidget {
  final List<Widget>? leftWidgetList;
  final List<Widget>? rightWidgetList;
  final Widget? customWidget;
  final Widget? customCenterWidget;
  final BackStyle backStyle;
  final String backgroundColor;
  final String backImagePath;
  final String titleColor;
  final double titleFontSize;
  final String title;
  final Function? backBtnClick;
  final double height;
  const NavBarWidget({super.key, 
    this.leftWidgetList,
    this.rightWidgetList,
    this.customWidget,
    this.backStyle = BackStyle.backImage,
    this.backgroundColor = "#EDEDED",
    this.backImagePath = "assets/images/nav_back_icon.png",
    this.title = "",
    this.titleFontSize = 18.0,
    this.titleColor = "#5E3323",
    this.backBtnClick,
    this.customCenterWidget,
    this.height = 44
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavBarStage();
  }
}

class _NavBarStage extends State<NavBarWidget> {

  Widget? getLeftBackWidget(){
    BackStyle backStyle = widget.backStyle;
    if (backStyle == BackStyle.none) {
      return null;
    } else if (backStyle == BackStyle.backImage){
      return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(widget.backImagePath ?? "", scale: 3,),
        ),
        onTapUp: (detail) {
          if (widget.backBtnClick != null) {
            widget.backBtnClick!();
          } else {
            Navigator.pop(context);
          }
        },
      ) ;
    }
    return Container();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> allWidget = [];
    Widget? leftWidget = getLeftBackWidget();
    if(leftWidget != null){
      allWidget.add(leftWidget);
    }
    if(widget.leftWidgetList != null){
      allWidget.addAll(widget.leftWidgetList!);
    }
    if(widget.customCenterWidget != null) {
      allWidget.add(Expanded(child: widget.customCenterWidget!));
    }
    if(widget.rightWidgetList != null){
      if(widget.customCenterWidget == null) {
        allWidget.add(Expanded(child: Container()));
      }
      allWidget.addAll(widget.rightWidgetList!);
    }
    // TODO: implement build
    return Container(
      color: fromHex(widget.backgroundColor),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          height: widget.height,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  child: generateTextWidget(
                      textColor: widget.titleColor,
                      textAlign: TextAlign.center,
                      text: widget.title,
                      textSize: widget.titleFontSize,
                      weight: FontWeight.bold
                  ),
                ),
              ),
              Positioned.fill(
                child:  (allWidget.length ?? 0) > 0 ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: allWidget,
                ) : (widget.customWidget ?? Container()),
              ),

            ],
          ),
        ),
      ),
    );
  }

}