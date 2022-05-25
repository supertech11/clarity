import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/widgets/app_drawer.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: DashboardBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: AppDrawer(),
          );
        });
      },
    );
  });

  group('AppDrawer Widget Test', () {
    testWidgets("Validate visibility of AppDrawer menus ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.byKey(Key("home")), findsOneWidget);
      expect(find.byKey(Key("surveys")), findsOneWidget);
      expect(find.byKey(Key("referrals")), findsOneWidget);
      expect(find.byKey(Key("settings")), findsOneWidget);
      expect(find.byKey(Key("signOut")), findsOneWidget);
    });
  });
}
