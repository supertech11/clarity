import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/referral_detail.dart';

void main() {
  late Widget widget1, widget2, widget3;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget1 = GetMaterialApp(
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
                      child: ReferralDetailScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );

    widget2 = GetMaterialApp(
      initialBinding: OnboardingBinding(),
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
                      width: 899,
                      child: ReferralDetailScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );

    widget3 = GetMaterialApp(
      initialBinding: OnboardingBinding(),
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
                      width: 1360,
                      child: ReferralDetailScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('ReferralDetailScreen Widget Test', () {
    testWidgets(
        "Validate ReferralDetailScreen when screen is lesser than 520, small screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.byKey(Key("mobile_screen")), findsOneWidget);
    });

    testWidgets(
        "Validate ReferralDetailScreen when screen is greater than 520 and lesser than 900, medium screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);

      expect(find.byKey(Key("medium_screen")), findsOneWidget);
    });

    testWidgets(
        "Validate ReferralDetailScreen when screen is greater than 900, large screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget3);

      expect(find.byKey(Key("large_screen")), findsOneWidget);
    });
  });
}
