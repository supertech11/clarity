import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';

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
            body: CustomTextFormField(
              key: Key("firstname"),
              labelText: "Firstname",
              icon: Icon(Icons.ac_unit),
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
            body: CustomTextFormField(
              key: Key("lastname"),
              hintText: "Lastname",
            ),
          );
        });
      },
    );
  });

  group('CustomTextFormField Widget Test', () {
    testWidgets("Validate text form contain labels and icon if specified",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.text("Firstname"), findsOneWidget);
      expect(find.byKey(Key("prefixIcon")), findsOneWidget);
    });

    testWidgets(
        "Validate text form contain hint and no icon if icon not provided",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);

      expect(find.text("Lastname"), findsOneWidget);
      expect(find.byKey(Key("prefixIcon")), findsNothing);
    });
  });
}
