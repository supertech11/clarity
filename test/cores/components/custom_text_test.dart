import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

void main() {
  late Widget widget;
  final scaffoldKey = Key("scaffold");
  final String sampleText = "Hello World";
  setUp(() {
    widget = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            key: scaffoldKey,
            body: CustomText(
              text: sampleText,
            ),
          );
        });
      },
    );
  });

  group('CustomText Widget Test', () {
    testWidgets("Validate visibility of the actual text specified",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.text(sampleText), findsOneWidget);
    });
  });
}
