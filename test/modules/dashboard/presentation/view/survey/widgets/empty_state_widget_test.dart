import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/empty_state_widget.dart';

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
            body: EmptyStateWidget(),
          );
        });
      },
    );
  });

  group('EmptyStateWidget Widget Test', () {
    testWidgets("Validate visibility of EmptyStateWidget items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("illustrator")), findsOneWidget);
      expect(find.byKey(Key("title")), findsOneWidget);
      expect(find.byKey(Key("subtitle")), findsOneWidget);
    });
  });
}
