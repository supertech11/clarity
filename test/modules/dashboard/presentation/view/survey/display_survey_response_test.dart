import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/display_survey_response.dart';

void main() {
  late Widget widget;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: RouteSettings(arguments: {
              "survey": SurveyModel(id: 18)
            }), // Your Argument here),
            builder: (context) {
              return Scaffold(
                  key: scaffoldKey,
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 519,
                          child: DisplaySurveyResponseScreen(),
                        ),
                      ],
                    ),
                  ));
            });
      },
    );
  });

  group('DisplaySurveyResponseScreen Widget Test', () {
    testWidgets("Validate initial loading state of DisplaySurveyResponseScreen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("loader")), findsOneWidget);
    });

    testWidgets(
        "Validate views of DisplaySurveyResponseScreen after fetching data",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("loader")), findsOneWidget);
    });
  });
}
