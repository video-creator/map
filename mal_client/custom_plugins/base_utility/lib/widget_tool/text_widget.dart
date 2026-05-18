import 'dart:ui';

import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/material.dart';


generateAllDefineTextWidget(double textSize,
    Color textColor,
    String text,
    double alpha,
    FontWeight fontWeight,
    maxlines,
    textAlign,
    shadows,
    overflow,
    fontFamily,
    letterSpacing){
  text ??= "";
  fontWeight ??= FontWeight.normal;
  textColor ??= Colors.black;

  return Text(
    text,
    style: TextStyle(
      fontSize: textSize,
      color: textColor,
      decoration: TextDecoration.none,
      fontWeight: fontWeight,
      shadows: shadows,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing
    ),
    textAlign: textAlign,
    maxLines: maxlines,
    softWrap: true,
    overflow: overflow,
  );

}


generateAllDefineSelectableTextWidget(double textSize,
    Color textColor,
    String text,
    double alpha,
    FontWeight fontWeight,
    minlines,
    textAlign,
    shadows,
    overflow,
    fontFamily,
    letterSpacing, {maxlines=100}){
  text ??= "";
  fontWeight ??= FontWeight.normal;
  textColor ??= Colors.black;

  return SelectableText(
    text,
    style: TextStyle(
        fontSize: textSize,
        color: textColor,
        decoration: TextDecoration.none,
        fontWeight: fontWeight,
        shadows: shadows,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
    ),
    textAlign: textAlign,
    minLines: minlines,
    maxLines: maxlines,
    selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
  );

}


//generateBlackColorTextWidget(double textSize,String text){
//
//  return generateAllDefineTextWidget(textSize, Colors.black, text, FontWeight.normal);
//}
//
//generateTextWidget(double textSize,Color textColor, String text){
//  if(textColor == null){
//    textColor = Colors.black;
//  }
//  return generateAllDefineTextWidget(textSize, textColor, text, FontWeight.normal);
//}
generateTextWidget({double textSize  = 14,
  String textColor = "#1D1E2C",
  String text = "" ,
  alpha = 1.0,
  FontWeight weight = FontWeight.w300,
  maxLines = 1,
  textAlign = TextAlign.left,
  overflow = TextOverflow.ellipsis,
  shadows,
  fontFamily,
  letterSpacing
  }){
  if(alpha != 1.0) {
    textColor = colorWithAlpha(textColor, alpha);
  }
  return generateAllDefineTextWidget(textSize,
      convertStringToColor(textColor) ?? Colors.black,
      text,
      alpha,
      weight,
      maxLines,
      textAlign,
      shadows,
      overflow,
      fontFamily,
      letterSpacing
  );

}


generateSelectableTextWidget({double textSize  = 14,
  String textColor = "#1D1E2C",
  String text = "" ,
  alpha = 1.0,
  FontWeight weight = FontWeight.w300,
  minLines = 1,
  textAlign = TextAlign.left,
  overflow = TextOverflow.ellipsis,
  shadows,
  fontFamily,
  letterSpacing,
  maxLines=100
}){
  if(alpha != 1.0) {
    textColor = colorWithAlpha(textColor, alpha);
  }
  return generateAllDefineSelectableTextWidget(textSize,
      convertStringToColor(textColor) ?? Colors.black,
      text,
      alpha,
      weight,
      minLines,
      textAlign,
      shadows,
      overflow,
      fontFamily,
      letterSpacing,
    maxlines: maxLines
  );

}

String colorWithAlpha(String color, double alpha) {
  if(alpha == 1.0) {
    return color;
  }
  int al = (alpha * 256).toInt();
  String als = al.toRadixString(16).padLeft(2,"0");
  return "$als$color";
}

class DefaultTextField extends StatelessWidget {
  late String _text;
  TextEditingController controller = TextEditingController();
  DefaultTextField(String text,{super.key}) {
    _text = text;
    controller.text = _text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        child: TextField(
          controller: controller,
          maxLines: null,
        ),
      );
  }

}