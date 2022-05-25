import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:fhir/r4.dart' as fhir;
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_response_card.dart';

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
          final fhir.Observation observation =
              fhir.Observation(code: fhir.CodeableConcept(text: ""));

          return Scaffold(
            body: ObservationResponseCard(
              observation: observation,
            ),
          );
        });
      },
    );
  });

  group('ObservationResponseCard Widget Test', () {
    testWidgets("Validate visibility of ObservationResponseCard items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("display")), findsOneWidget);
      expect(find.byKey(Key("details")), findsOneWidget);
    });
  });
}
