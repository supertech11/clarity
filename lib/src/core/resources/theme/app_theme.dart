import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';

class AppTheme {
  static ThemeData current(BuildContext context) => context.theme;

  static ThemeData get darkTheme => appDarkTheme;

  static ThemeData get lightTheme => appLightTheme;
}
