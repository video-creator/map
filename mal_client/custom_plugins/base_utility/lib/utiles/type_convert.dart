import 'package:flutter/material.dart';

int convertToInt(Object? source){
  if(source == null){
    return 0;
  }
  if(source is int){
//    print(">>>>>>convertToInt 1");
    return source;
  } else if(source is String){
    return int.parse(source);
  } else if(source is bool){
//    print(">>>>>>convertToInt 3");
    return source == true ? 1:0;
  } else {
//    print(">>>>>>convertToInt 4");
    return int.parse(source.toString());
  }
}

double convertToDouble(Object? source){
  if(source == null){
    return 0;
  }
//  print(">>>>>>convertToInt $source");
  if(source is double){
//    print(">>>>>>convertToInt 1");
    return source;
  } else if(source is String){
//    print(">>>>>>convertToInt 2");
    return double.parse(source);
  } else if(source is bool){
//    print(">>>>>>convertToInt 3");
    return source == true ? 1:0;
  } else {
//    print(">>>>>>convertToInt 4");
    return double.parse(source.toString());
  }
}

bool convertToBool(Object? source){
  if(source == null){
    return false;
  }
  if(source is int){
    return source == 1 ? true:false;
  }
  if(source is String){
    return source == "false" ? false:true;
  }
  if(source is bool){
    return source;
  }
  return true;
}

Color stringColor(String? colorStr,{double alpha = 1}) {
  return convertStringToColor(colorStr,alpha: alpha) ?? Colors.red;
}
Color? convertStringToColor(String? colorStr,{double alpha = 1}){
  if(colorStr == null){
    return null;
  }

//  print(">>>>>>>>convertStringToColor $colorStr");
  return Color(getColorHexFromStr(colorStr,alpha: alpha));
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
//String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
//    '${alpha.toRadixString(16)}'
//    '${red.toRadixString(16)}'
//    '${green.toRadixString(16)}'
//    '${blue.toRadixString(16)}';

int getColorHexFromStr(String colorStr,{double alpha=1})
{
  int useAlpha =  (alpha * 256).floor()-1;
  if (useAlpha < 0) {
    useAlpha = 0;
  }
  String alphaStr = useAlpha.toRadixString(16).padLeft(2,"0");
  colorStr = colorStr.replaceAll("#", "");
  colorStr = colorStr.replaceAll("0x", "");
  if(colorStr.length == 6){
    colorStr = alphaStr + colorStr;
  }
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw const FormatException("An error occurred when converting a color");
    }
  }
//  print(">>>>>>>>getColorHexFromStr $colorStr");
  return val;
}