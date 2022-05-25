import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/walkthrough/widgets/slide_dots.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: SlideDots(0),
          );
        });
      },
    );
  });

  group('Slidedots Widget Test', () {
    testWidgets("Validate visibility of indicator ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.byKey(Key("indicator")), findsOneWidget);
    });
  });
}
