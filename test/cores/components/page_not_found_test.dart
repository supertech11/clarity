import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/page_not_found.dart';

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
            body: PageNotFound(),
          );
        });
      },
    );
  });

  group('PageNotFound Widget Test', () {
    testWidgets("Validate visibility of the content specified in design",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.byKey(Key("error404_image")), findsOneWidget);
      expect(find.byKey(Key("where_are_we")), findsOneWidget);
      expect(find.byKey(Key("cant_find_page")), findsOneWidget);
      expect(find.byKey(Key("go_back_home")), findsOneWidget);
    });

    testWidgets(
        "Validate page navigation from current screen if go back home is pressed",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byKey(Key("go_back_home")));

      await tester.pump();

      expect(find.byWidget(PageNotFound()), findsNothing);
    });
  });
}
