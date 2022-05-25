import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/components/internal_error.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          // settings: RouteSettings(
          //     arguments: {"user": User()}), // Your Argument here),
          builder: (context) {
            return InternalErrorScreen();
          },
        );
      },
    );
  });

  group('Internal Error Screen Widget Test', () {
    testWidgets(
        "Validate screen exit button to close the app upon server error",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      // await tester.pumpAndSettle();

      expect(find.byKey(Key("close")), findsNWidgets(1));
    });

    testWidgets("Validate app closes upon exit clicked",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byKey(Key("close")));

      expect(find.byWidget(MaterialApp()), findsNothing);
    });
  });
}
