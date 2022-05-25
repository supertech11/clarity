import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 900;
const int smallSceenSize = 520;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  // the custom screen size is specific to this project
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context,
      {BoxConstraints? constraints}) {
    if (constraints != null) {
      return constraints.maxWidth < smallSceenSize;
    } else {
      return MediaQuery.of(context).size.width < smallSceenSize;
    }
  }

  static bool isMediumScreen(BuildContext context,
      {BoxConstraints? constraints}) {
    if (constraints != null) {
      return constraints.maxWidth >= smallSceenSize &&
          constraints.maxWidth <= mediumScreenSize;
    } else {
      return MediaQuery.of(context).size.width >= smallSceenSize &&
          MediaQuery.of(context).size.width <= mediumScreenSize;
    }
  }

  static bool isLargeScreen(BuildContext context,
      {BoxConstraints? constraints}) {
    if (constraints != null) {
      return constraints.maxWidth > mediumScreenSize;
    } else {
      return MediaQuery.of(context).size.width > mediumScreenSize;
    }
  }

  // static bool isCustomSize(BuildContext context) {
  //   return MediaQuery.of(context).size.width <= customScreenSize &&
  //       MediaQuery.of(context).size.width >= mediumScreenSize;
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mediumScreenSize) {
          return largeScreen;
        } else if (constraints.maxWidth >= smallSceenSize &&
            constraints.maxWidth <= mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else if (constraints.maxWidth < smallSceenSize) {
          return smallScreen ?? largeScreen;
        } else {
          return smallScreen!;
        }
      },
    );
  }
}
