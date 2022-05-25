import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/widgets/drawer_profile_title.dart';

void main() {
  late Widget widget1, widget2;
  setUp(() {
    widget1 = GetMaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: DrawerProfileTitleWidget(
              firstName: "firstName",
              lastName: "lastName",
              isHorizontal: true,
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
            body: DrawerProfileTitleWidget(
              firstName: "firstName",
              lastName: "lastName",
              isHorizontal: false,
            ),
          );
        });
      },
    );
  });

  group('DrawerProfileTitleWidget Widget Test', () {
    testWidgets(
        "Validate visibility of DrawerProfileTitleWidget horizontal components ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.byKey(Key("user_placeholder_horizontal")), findsOneWidget);
    });

    testWidgets(
        "Validate visibility of DrawerProfileTitleWidget vertical components ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);

      expect(find.byKey(Key("user_placeholder_vertical")), findsOneWidget);
      expect(find.byKey(Key("name")), findsOneWidget);
    });
  });
}
