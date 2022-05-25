import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_mobile_card.dart';

void main() {
  late Widget widget;
  final SurveyModel? survey = SurveyModel(
      attempted: true,
      createdAt: "23-04",
      id: 90,
      numberOfQuestionnaire: 8,
      practitioner: "Tosin Idowu",
      questionnaire: null,
      seen: true,
      title: "ahc",
      user: "10");
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          final SurveyController surveyController = Get.find();
          surveyController.surveyObservations = [];

          return Scaffold(
            body: SurveyMobileCard(
              survey: survey!,
              onSurveyCardTap: () {},
            ),
          );
        });
      },
    );
  });

  group('SurveyMobileCard Widget Test', () {
    testWidgets("Validate visibility of SurveyMobileCard items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("title")), findsOneWidget);
      expect(find.byKey(Key("practitioner_picture")), findsOneWidget);
      expect(find.byKey(Key("practitioner_name")), findsOneWidget);
      expect(find.byKey(Key("indicator_icon")), findsOneWidget);
      expect(find.byKey(Key("question_indicator")), findsOneWidget);
      expect(find.byKey(Key("created_at")), findsOneWidget);
      expect(find.text("TI"), findsOneWidget);
    });
  });
}
