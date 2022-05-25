import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/item_answer.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_response_card.dart';

import '../../../../../../fixtures/fixture_reader.dart';

void main() {
  late Widget widget1, widget2;
  final Map<String, dynamic> data =
      json.decode(fixture('sample_survey_item_answer.json'));
  final Map<String, dynamic> data2 =
      json.decode(fixture('sample_survey_nested_item_answer.json'));
  ItemAnswer itemAnswer = ItemAnswer.fromJson(data);
  ItemAnswer itemAnswer2 = ItemAnswer.fromJson(data2);
  setUp(() {
    widget1 = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          print(itemAnswer2.isGrouped);
          return Scaffold(
            body: SurveyResponseCard(
              item: itemAnswer,
            ),
          );
        });
      },
    );

    widget2 = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: SurveyResponseCard(
              item: itemAnswer2,
            ),
          );
        });
      },
    );
  });

  group('SurveyResponseCard Widget Test', () {
    testWidgets(
        "Validate visibility of SurveyResponseCard items that don't have nested items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);
      expect(find.byKey(Key("question")), findsOneWidget);
      await tester.tap(find.byKey(Key("question")));
      await tester.pumpAndSettle();
      expect(find.byKey(Key("ungrouped_answer")), findsOneWidget);
    });

    testWidgets(
        "Validate visibility of SurveyResponseCard items that have nested items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);
      expect(find.byKey(Key("question")), findsOneWidget);
      await tester.tap(find.byKey(Key("question")));
      await tester.pumpAndSettle();
      expect(find.byKey(Key("grouped_question")), findsOneWidget);
      expect(find.byKey(Key("grouped_answer")), findsOneWidget);

      // expect(find.text("answer"), findsOneWidget);
    });
  });
}
