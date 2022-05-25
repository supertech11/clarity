import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/widgets/notification_settings_item.dart';

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
                      child: NotificationSettingsItem(
                          title: "title", subtitle: "subtitle"),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('NotificationSettingsItem Widget Test', () {
    testWidgets("Validate widgets are visible on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.text("title"), findsOneWidget);
      expect(find.text("subtitle"), findsOneWidget);
      expect(find.byKey(Key("title")), findsOneWidget);
      expect(find.byKey(Key("subtitle")), findsOneWidget);
      expect(find.byKey(Key("switch")), findsOneWidget);
    });
  });
}
