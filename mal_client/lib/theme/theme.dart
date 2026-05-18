import 'package:flutter/cupertino.dart';

class CustomTheme {
  String topPanelColor = "#3b3f41";
  String leftPanelColor = "#3b3f41";
  String centerPanelColor = "#2b2b2b";
  String rightPanelColor = "#3b3f20";
  String lineColor = "#b4b5b5";
  String fontColor = "#ffffff";
  String fontDisableColor = "#c1c1c1";
  String splitColor = "#ffffff";
  String splitBgColor = "#ffffff";
  int fontSize = 12;
  CustomTheme({required this.topPanelColor, required this.leftPanelColor, required this.centerPanelColor,
    required this.rightPanelColor, required this.fontColor, required this.lineColor,required this.splitColor,required this.splitBgColor,required this.fontDisableColor});
}

var darkTheme = CustomTheme(
    topPanelColor:"#5d5d5d",
    leftPanelColor: "#3b3f41",
    centerPanelColor: "#2b2b2b",
    rightPanelColor: "#3b3f20",
    fontColor: "#ffffff",
    lineColor: "#313335",
    splitColor: "#ffffff",
    splitBgColor: "#ffffff",
    fontDisableColor: "#c1c1c1"
);

var lightTheme = CustomTheme(
    topPanelColor:"#fbfbfb",
    leftPanelColor: "#fdfdfd",
    centerPanelColor: "#fbfbfb",
    rightPanelColor: "#fbfbfb",
    fontColor: "#000000",
    lineColor: "#b4b5b5",
    splitColor: "#000000",
    splitBgColor: "#d3d9e0",
    fontDisableColor: "#c1c1c1"
);