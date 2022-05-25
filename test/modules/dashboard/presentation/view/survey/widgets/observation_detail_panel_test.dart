import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_detail_panel.dart';
import 'package:fhir/r4.dart' as fhir;

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
            body: ObservationDetailPanel(
              observation: observation,
            ),
          );
        });
      },
    );
  });

  group('ObservationDetailPanel Widget Test', () {
    testWidgets("Validate visibility of ObservationDetailPanel items ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("actual_result")), findsOneWidget);
      expect(find.byKey(Key("status")), findsOneWidget);
      expect(find.byKey(Key("method")), findsOneWidget);
      expect(find.byKey(Key("performer")), findsOneWidget);
      expect(find.byKey(Key("subject")), findsOneWidget);
    });
  });
}
