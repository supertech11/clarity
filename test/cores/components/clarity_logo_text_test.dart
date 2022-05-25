import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return clarityLogoText();
        });
      },
    );
  });

  group('ClarityLogoText Widget Test', () {
    testWidgets("Validate the presence of the logo",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      // await tester.pumpAndSettle();

      expect(find.byKey(Key("clarity_logo_text")), findsNWidgets(1));
    });
  });
}
