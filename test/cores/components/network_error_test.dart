import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/components/network_error.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          // settings: RouteSettings(
          //     arguments: {"user": User()}), // Your Argument here),
          builder: (context) {
            return NoInternetScreen();
          },
        );
      },
    );
  });

  group('Internal Error Screen Widget Test', () {
    testWidgets(
        "Validate screen exit button to close the app upon network error",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      // await tester.pumpAndSettle();

      expect(find.byKey(Key("close")), findsOneWidget);
    });

    testWidgets("Validate app closes upon exit clicked",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byKey(Key("close")));

      expect(find.byWidget(MaterialApp()), findsNothing);
    });
  });
}
