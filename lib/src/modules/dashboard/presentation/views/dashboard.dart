import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/components/circular_avatar_with_name.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/utils/constants.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

import './widgets/app_drawer.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen();
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  bool _isInit = true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  DashboardModule dashboardModule = DashboardModule();
  Map<String, dynamic> labels = {};

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  late MenuController menuController;
  LoginController loginController = Get.find();

  @override
  void initState() {
    super.initState();
    menuController = Get.put(MenuController(vsync: this));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isInit = false;
      });
    }
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (menuController.state.value) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 40.0 * menuController.percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: kShadowColor.withOpacity(0.2),
              offset: const Offset(0.0, 4.0),
              blurRadius: 25.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Exit",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              "Are you sure you want to exit the App?",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("NO"),
                onPressed: () {
                  return Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text("YES"),
                onPressed: () {
                  return Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Container(
              child: Scaffold(
                body: AppDrawer(),
              ),
            ),
            createContentDisplay(context)
          ],
        ));
  }

  createContentDisplay(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context)) {
      menuController.state.value == MenuState.open
          ? menuController.close()
          // ignore: unnecessary_statements
          : null;
    }
    return zoomAndSlideContent(
      Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: ResponsiveWidget.isSmallScreen(context) ||
                ResponsiveWidget.isMediumScreen(context)
            ? AppBar(
                // title: Text(
                //   "Hi",
                //   style: TextStyle(color: Theme.of(context).accentColor),
                // ),
                leading: new IconButton(
                    icon: Image.asset(AppImageAssets.menu),
                    onPressed: () {
                      menuController.toggle();
                    }),
                centerTitle: false,
                backgroundColor: Colors.white10,
                titleSpacing: 0,
                title: clarityLogoText(),
                // Text(
                //   "Clarity",
                //   textAlign: TextAlign.left,
                //   overflow: TextOverflow.visible,
                //   style: GoogleFonts.radley(
                //     fontSize: 20,
                //     fontWeight: FontWeight.w500,
                //     color: Theme.of(context).primaryColor,
                //   ),
                // ),

                elevation: 0,
                actions: [
                  GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed(kProfileScreen);
                      },
                      child: Obx(
                        () => CircularImageWithName(
                          radius: 20,
                          firstName: UtilFunctions.getNameInitials(
                            loginController.firstName.value,
                            0,
                          ),
                          lastName: UtilFunctions.getNameInitials(
                            loginController.lastName.value,
                            1,
                          ),
                        ),
                      )

                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundColor: Color(0xffF5F5F5),
                      //   child: Image.asset(
                      //     AppImageAssets.user_placeholder,
                      //     width: 20,
                      //   ),
                      // ),
                      ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            : AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(),
              ),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 6) {
                  menuController.toggle();
                }
              },
              child: ResponsiveWidget.isSmallScreen(context) ||
                      ResponsiveWidget.isMediumScreen(context)
                  ? dashboardModule.dashboardLocalNavigator()
                  : Row(
                      children: [
                        Expanded(child: AppDrawer()),
                        Expanded(
                            flex: 4,
                            child: dashboardModule.dashboardLocalNavigator())
                      ],
                    )),
        ),
      ),
    );
  }
}
