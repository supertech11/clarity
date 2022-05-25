import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/render_survey.dart';

class SampleLayer extends StatefulWidget {
  final Widget child;
  const SampleLayer({Key? key, required this.child}) : super(key: key);

  @override
  _SampleLayerState createState() => _SampleLayerState();
}

class _SampleLayerState extends State<SampleLayer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Get.put(MenuController(vsync: this));
    return Container(
      child: widget.child,
    );
  }
}

void main() {
  late Widget widget;
  final scaffoldKey = Key("scaffold");
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
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: RouteSettings(
                arguments: {"survey": survey!}), // Your Argument here),
            builder: (context) {
              return Scaffold(
                key: scaffoldKey,
                body: SampleLayer(child: RenderSurvey()),
              );
            });
      },
    );
  });

  group('RenderSurvey Widget Test', () {
    testWidgets("Validate widgets are visible on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("logo")), findsOneWidget);
      expect(find.byKey(Key("back_button")), findsOneWidget);
      expect(find.byKey(Key("title")), findsOneWidget);
      expect(find.byKey(Key("webview")), findsOneWidget);
    });
  });
}
