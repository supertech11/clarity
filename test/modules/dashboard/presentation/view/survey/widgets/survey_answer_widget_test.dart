import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_answer_widget.dart';

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
          return Scaffold(
            body: SurveyAnswerWidget(
              answer: "answer",
            ),
          );
        });
      },
    );
  });

  group('SurveyAnswerWidget Widget Test', () {
    testWidgets("Validate visibility of SurveyAnswerWidget items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("bullet")), findsOneWidget);
      expect(find.byKey(Key("answer")), findsOneWidget);
      expect(find.text("answer"), findsOneWidget);
    });
  });
}
