import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';

void main() {
  late Widget widget;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            key: scaffoldKey,
            body: CustomBackButton(),
          );
        });
      },
    );
  });

  group('CustomBackButton Widget Test', () {
    testWidgets("Validate the presence of back button",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("back")), findsOneWidget);
      await tester.tap(find.byKey(Key("back")));
    });
  });
}
