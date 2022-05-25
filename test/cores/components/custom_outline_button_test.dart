import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/custom_outline_button.dart';

void main() {
  late Widget widget1, widget2;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget1 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            key: scaffoldKey,
            body: CustomOutlineButton(
              label: "Press",
              key: Key("button1"),
              isLoading: true,
            ),
          );
        });
      },
    );
    widget2 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            key: scaffoldKey,
            body: CustomOutlineButton(
              label: "Press",
              key: Key("button1"),
              isLoading: false,
            ),
          );
        });
      },
    );
  });

  group('CustomOutlineButton Widget Test', () {
    testWidgets("Validate circular loader when the state is loading ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.byKey(Key("loader")), findsOneWidget);
      expect(find.text("Press"), findsNothing);
    });
    testWidgets("Validate label showed when the state is not loading ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);

      expect(find.byKey(Key("loader")), findsNothing);
      expect(find.text("Press"), findsOneWidget);
    });
  });
}
