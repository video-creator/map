import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:flutter/material.dart';
enum ItemDisplayType{
  text,
  back,
  custom,
  none
}
enum NavDirection{
  left,
  right,
}

class LeftTitleAppBarWidget extends StatefulWidget implements PreferredSizeWidget{

  final double height;
  final double elevation;//阴影
  final Function? leftTitleChangeCallback;
  final ItemDisplayType leftDisplayType;
  final Function? leftWidgetCallback;
  final Function? leftBackWidgetClickCalBack;
  final Function? rightTitleChangeCallback;
  final Function? rightWidgetCallback;

  final ItemDisplayType rightDisplayType;

  final double leftTitleFontSize;
  final String leftTitleFontColor;
  final String leftBackImagePath;
  final double rightTitleFontSize;
  final String rightTitleFontColor;
  final bool leftExpand;
  final Widget? rightWidget;

  final String centerTitle;
  final String centerColor;
  final double centerTitleFontSize;

  final List<Widget>? leftWidgetList;
  final List<Widget>? rightWidgetList;
  const LeftTitleAppBarWidget({super.key, 
    this.height =44,
    this.elevation =0.5,
    this.leftTitleChangeCallback,
    this.rightTitleChangeCallback,
    this.rightWidgetCallback,
    this.rightDisplayType =ItemDisplayType.none,
    this.leftDisplayType =ItemDisplayType.back,
    this.leftWidgetCallback,
    this.leftTitleFontColor ="#5E3323",
    this.leftTitleFontSize =26,
    this.rightTitleFontColor ="#5E3323",
    this.rightTitleFontSize =26,
    this.leftBackWidgetClickCalBack,
    this.rightWidget,
    this.leftWidgetList,
    this.rightWidgetList,
    this.leftExpand =true,
    this.centerColor ="#F4EFE6",
    this.centerTitleFontSize =18,
    this.centerTitle ="",
    this.leftBackImagePath = "assets/images/nav_back_icon.png"
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LeftTitleAppBarWidgetState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);

}

class _LeftTitleAppBarWidgetState extends State<LeftTitleAppBarWidget>{

  Widget getItemWidget(NavDirection direction){

    ItemDisplayType currentDisplayType = direction == NavDirection.left ? widget.leftDisplayType : widget.rightDisplayType;
    double currentFontSize = direction == NavDirection.left ? widget.leftTitleFontSize : widget.rightTitleFontSize;
    String? currentTextColor = direction == NavDirection.left ? widget.leftTitleFontColor : widget.rightTitleFontColor;
    Function? currentTextCallBack = direction == NavDirection.left ? widget.leftTitleChangeCallback : widget.rightTitleChangeCallback;
    Function? currentWidgetCallBack = direction == NavDirection.left ? widget.leftWidgetCallback:widget.rightWidgetCallback;

    EdgeInsets insets = direction == NavDirection.left ? const EdgeInsets.only(left: 16) : const EdgeInsets.only(right: 16);
    Alignment alignment = direction == NavDirection.left ? Alignment.centerLeft : Alignment.centerRight;

    if (currentDisplayType == ItemDisplayType.text){
      return Padding(
        padding: insets,
        child: Container(
          alignment: alignment,
          child: generateTextWidget(textSize:currentFontSize,textColor:currentTextColor,text: currentTextCallBack == null ? "":currentTextCallBack(),weight: FontWeight.bold  ),
        ),
      );

    } else if(currentDisplayType == ItemDisplayType.custom){
      return currentWidgetCallBack == null ? null:currentWidgetCallBack();
    } else if(currentDisplayType == ItemDisplayType.none){
      return Container();
    } else if(currentDisplayType == ItemDisplayType.back){
      return GestureDetector(
        child: Padding(
          padding: insets,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(widget.leftBackImagePath ?? "", scale: 3,),
          ),
        ),
        onTap: (){
          if (widget.leftBackWidgetClickCalBack != null){
            widget.leftBackWidgetClickCalBack!();
          }
        },
      );
    }
    return Container();
  }



  @override
  Widget build(BuildContext context) {
    List<Widget> allWidget = [];
    Widget leftWidget = getItemWidget(NavDirection.left);
    allWidget.add(leftWidget);
    if(widget.leftWidgetList != null){
      allWidget.addAll(widget.leftWidgetList!);
    }
    allWidget.add(Expanded(child: Container()));
    if(widget.rightWidgetList != null){
      allWidget.addAll(widget.rightWidgetList!);
    }
    Widget rightWidget = getItemWidget(NavDirection.right);
    allWidget.add(rightWidget);
    // TODO: implement build
    return SafeArea(
      top: true,
      child: Container(
        height: widget.height,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: generateTextWidget(textColor: widget.centerColor,textAlign: TextAlign.center,text: widget.centerTitle,textSize: widget.centerTitleFontSize),
              ),
            ),
            Positioned.fill(
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                children: allWidget,
              ),
            ),

          ],
        ),
      ),
    );
  }
}