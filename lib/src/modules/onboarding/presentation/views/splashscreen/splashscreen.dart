import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController loginController = Get.find();

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 2), () async {
      try {
        bool isLoggedIn = await loginController.tryAutoLogin();
        if (isLoggedIn) {
          Get.offNamedUntil(
              DashboardModule.dashboardScreen.name, (route) => false);
        } else {
          Get.offNamed(OnboardingModule.loginScreen.name);
        }
      } catch (err) {
        Get.offNamed(OnboardingModule.loginScreen.name);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.primary,
      body: Center(
        key: Key("logo"),
        child: Image.asset(AppImageAssets.logo_with_text_white),
      ),
    );
  }
}
