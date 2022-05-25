import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

final appDarkTheme = ThemeData(
  primaryIconTheme: const IconThemeData(color: Colors.white),
  scaffoldBackgroundColor: const Color.fromRGBO(21, 22, 23, 1),
  backgroundColor: const Color.fromRGBO(21, 22, 23, 1),
  cardColor: const Color.fromRGBO(30, 31, 33, 1),
  canvasColor: const Color.fromRGBO(30, 31, 33, 1),
  hintColor: const Color(0xff323233),
  primaryColorDark: Colors.white,
  primaryColorLight: const Color.fromRGBO(64, 64, 64, 1),
  indicatorColor: Colors.white,
  disabledColor: Colors.black,
  hoverColor: Pallet.primary.withOpacity(0.2),
  fontFamily: "Inter",
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
  }),
  splashColor: const Color(0x40CCCCCC),
  highlightColor: const Color(0x40CCCCCC),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: true,
  ),
  iconTheme: const IconThemeData(color: Color.fromRGBO(128, 128, 128, 1)),
  dividerTheme: const DividerThemeData(
    color: Color.fromRGBO(38, 38, 38, 1),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: ShapeDecoration(
        shape: UnderlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(117, 117, 117, 1), width: 1),
    )),
    labelColor: Color.fromRGBO(223, 223, 223, 1),
    unselectedLabelColor: Color.fromRGBO(112, 112, 112, 1),
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  primaryColor: Pallet.primary,
);
