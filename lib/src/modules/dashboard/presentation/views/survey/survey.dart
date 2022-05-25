import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_large_screen.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_mobile_screen.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

class SurveyScreen extends StatefulWidget {
  SurveyScreen({Key? key}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  SurveyController surveyController = Get.find();
  LoginController loginController = Get.find();
  bool isInit = true;
  late Timer t;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInit) {
      t = Timer(Duration.zero, () async {
        await surveyController.fetchSurveys(loginController.userId.toString());
        setState(() {
          isInit = false;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (t.isActive) {
      t.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Future.microtask(() => );
    return ResponsiveWidget(
      largeScreen: SurveyLargeScreen(
        key: Key("large_screen"),
      ),
      mediumScreen: SurveyLargeScreen(
        key: Key("medium_screen"),
      ),
      smallScreen: SurveyMobileScreen(
        surveys: surveyController.userSurveys,
        key: Key("mobile_screen"),
      ),
    );
  }
}
