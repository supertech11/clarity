import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/dashed_padded_text.dart';

void main() {
  late Widget widget;
  final String sampleText = "Hello World";
  setUp(() {
    widget = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: DashedPaddedText(
              text: sampleText,
            ),
          );
        });
      },
    );
  });

  group('DashedPaddedText Widget Test', () {
    testWidgets(
        "Validate visibility of the actual text specified with left and right dash",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.text(sampleText), findsOneWidget);
      expect(find.byKey(Key("left_dash")), findsOneWidget);
      expect(find.byKey(Key("right_dash")), findsOneWidget);
    });
  });
}
