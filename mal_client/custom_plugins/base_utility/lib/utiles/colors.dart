import 'dart:math';

import 'package:base_utility/utiles/type_convert.dart';
import 'package:flutter/material.dart';

Color randomColor({List<String>? colors}) {
  var rng = Random();
  String colorStr;
  if (colors == null) {
    var colorInt = 0;
    for (int i = 0; i < 3; i++) {
      colorInt += (rng.nextInt(256) << ((3-i-1) * 8));
    }
    colorStr = colorInt.toRadixString(16);
  } else {
    colorStr = colors[rng.nextInt(colors.length)];
  }

  return convertStringToColor(colorStr)!;
}