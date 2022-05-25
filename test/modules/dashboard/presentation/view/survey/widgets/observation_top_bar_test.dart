import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_top_bar.dart';

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
          final SurveyController surveyController = Get.find();
          surveyController.surveyObservations = [];

          return Scaffold(
            body: ObservationTopBar(
              surveyController: surveyController,
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
      expect(find.byKey(Key("observation_details")), findsOneWidget);
      expect(find.byKey(Key("total")), findsOneWidget);
      expect(find.byKey(Key("divider")), findsOneWidget);

      expect(find.text("0 Observations"), findsOneWidget);
    });
  });
}
