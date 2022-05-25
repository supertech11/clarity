import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_response_top_bar.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          final SurveyModel? survey = SurveyModel(
              attempted: true,
              createdAt: "23-04",
              id: 90,
              numberOfQuestionnaire: 8,
              practitioner: "tosin",
              questionnaire: null,
              seen: true,
              title: "ahc",
              user: "10");
          final LoginController loginController = Get.find();
          final SurveyController surveyController = Get.find();
          loginController.firstName.value = "tosin";
          loginController.lastName.value = "idowu";

          return Scaffold(
            body: SurveyResponseTopBar(
              loginController: loginController,
              surveyController: surveyController,
              survey: survey,
            ),
          );
        });
      },
    );
  });

  group('SurveyResponseTopBar Widget Test', () {
    testWidgets("Validate visibility of SurveyResponseTopBar items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("logo")), findsOneWidget);
      expect(find.byKey(Key("back_button")), findsOneWidget);
      expect(find.byKey(Key("survey_title")), findsOneWidget);
      expect(find.byKey(Key("patient_info")), findsOneWidget);
      expect(find.byKey(Key("questions_info")), findsOneWidget);
      expect(find.text("ahc"), findsOneWidget);
      expect(find.text("tosin idowu"), findsOneWidget);
    });
  });
}
