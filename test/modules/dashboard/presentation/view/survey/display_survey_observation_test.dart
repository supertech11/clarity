import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/display_survey_observation.dart';

void main() {
  late Widget widget;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
              key: scaffoldKey,
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 800,
                      child: DisplaySurveyObservationScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('DisplaySurveyObservationScreen Widget Test', () {
    testWidgets("Validate widgets are visible on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      SurveyController surveyController = Get.find();
      expect(find.byKey(Key("page_title")), findsOneWidget);
      expect(find.byKey(Key("back_button")), findsOneWidget);
      surveyController.isLoadingSingleSurvey.value = false;
      await tester.pumpAndSettle();
      expect(find.byKey(Key("top_bar")), findsOneWidget);
      expect(find.byKey(Key("responses")), findsOneWidget);
    });
  });
}
