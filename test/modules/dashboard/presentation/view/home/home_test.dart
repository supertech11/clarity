import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/home/home.dart';

void main() {
  late Widget widget;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
              key: scaffoldKey,
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 519,
                      child: HomeScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('HomeScreen Widget Test', () {
    testWidgets("Validate HomeScreen widgets are visible on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.byKey(Key("greetings_bar")), findsOneWidget);
      expect(find.byKey(Key("welcome_msg")), findsOneWidget);
      expect(find.byKey(Key("tap_to_view")), findsOneWidget);
      expect(find.byKey(Key("actions_carousel")), findsOneWidget);
      expect(find.byKey(Key("slide_dots")), findsOneWidget);
    });

    // testWidgets("Validate navigation to profile info screen",
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(widget);
    //   await tester.tap(find.byKey(Key("general_info_item")));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(SettingsScreen), findsNothing);
    //   expect(find.byType(ProfileScreen), findsOneWidget);
    // });

    // testWidgets("Validate navigation to SettingsScreen screen",
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(widget);
    //   await tester.tap(find.byKey(Key("security_item")));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(SettingsScreen), findsNothing);
    //   expect(find.byType(SecurityScreen), findsOneWidget);
    // });

    // testWidgets("Validate navigation to NotificationSettingsScreen screen",
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(widget);
    //   await tester.tap(find.byKey(Key("notification_item")));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(SettingsScreen), findsNothing);
    //   expect(find.byType(NotificationSettingsScreen), findsOneWidget);
    // });
  });
}
