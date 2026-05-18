import 'dart:ffi';

import 'package:base_utility/utiles/method_listen_interface.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeManager {
  static CustomTheme theme = lightTheme;
  static void updateTheme(CustomTheme t) {
    theme = t;
    MethodListen.shareInstance().postMethod("theme_update", theme);
  }
  static CustomTheme currentTheme() {
    return theme;
  }
  static bool isDark() {
    return ThemeManager.currentTheme() == darkTheme;
  }
}
CustomTheme currentTheme = ThemeManager.currentTheme();
