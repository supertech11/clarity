import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

final appLightTheme = ThemeData(
  primaryIconTheme: const IconThemeData(color: Color.fromRGBO(96, 38, 158, 1)),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: const Color(0xffF2F2F2),
  canvasColor: Colors.white,
  primaryColorLight: Pallet.primary.withOpacity(0.1),
  primaryColorDark: Pallet.primary,
  disabledColor: Pallet.black,
  indicatorColor: const Color.fromRGBO(33, 10, 84, 1),
  hoverColor: Pallet.primary.withOpacity(0.2),
  hintColor: const Color.fromRGBO(235, 236, 240, 0.6),
  splashColor: const Color(0x66C8C8C8),
  highlightColor: const Color(0x66BCBCBC),
  fontFamily: "Inter",
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
  }),
  iconTheme: const IconThemeData(color: Pallet.primary),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    centerTitle: true,
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xffEAE9E9),
  ),
  tabBarTheme: TabBarTheme(
    indicator: const ShapeDecoration(
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(117, 117, 117, 1),
          width: 1,
        ),
      ),
    ),
    labelColor: const Color.fromRGBO(33, 10, 84, 1),
    unselectedLabelColor: const Color(0xff333333).withOpacity(0.5),
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),
  primaryColor: Pallet.primary,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color.fromRGBO(72, 22, 182, 1),
  ),
);
