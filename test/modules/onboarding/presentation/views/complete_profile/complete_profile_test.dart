import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complete_profile/complete_profile.dart';

void main() {
  late Widget widget1, widget2, widget3;
  final scaffoldKey = Key("scaffold");
  setUp(() {
    widget1 = GetMaterialApp(
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
                      width: 519,
                      child: CompleteProfileScreen(),
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
                      child: CompleteProfileScreen(),
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
                      child: CompleteProfileScreen(),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  });

  group('CompleteProfileScreen Widget Test', () {
    testWidgets(
        "Validate CompleteProfileScreen when screen is lesser than 520, small screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget1);

      expect(find.byKey(Key("mobile_screen")), findsOneWidget);
    });

    testWidgets(
        "Validate CompleteProfileScreen when screen is greater than 520 and lesser than 900, medium screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget2);

      expect(find.byKey(Key("medium_screen")), findsOneWidget);
    });

    testWidgets(
        "Validate CompleteProfileScreen when screen is greater than 900, large screen is loaded to view",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget3);

      expect(find.byKey(Key("large_screen")), findsOneWidget);
    });
  });
}
