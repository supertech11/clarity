import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/change_password.dart';

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
                      child: ChangePasswordScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('ChangePasswordScreen Widget Test', () {
    testWidgets("Validate ChangePasswordScreen widgets are visible on screen",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(Key("back_button")), findsOneWidget);
      expect(find.byKey(Key("page_title")), findsOneWidget);
      expect(find.byKey(Key("currentpassword")), findsOneWidget);
      expect(find.byKey(Key("newpassword")), findsOneWidget);
      expect(find.byKey(Key("oldpassword")), findsOneWidget);
      expect(find.byKey(Key("changepassword")), findsOneWidget);
    });
  });
}
