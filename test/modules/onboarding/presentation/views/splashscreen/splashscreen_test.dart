import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/splashscreen/splashscreen.dart';

void main() {
  late Widget widget;
  setUp(() {
    widget = GetMaterialApp(
      initialBinding: OnboardingBinding(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            // settings: RouteSettings(
            //     arguments: {"user": User()}), // Your Argument here),
            builder: (context) {
          return Scaffold(
            body: SplashScreen(),
          );
        });
      },
    );
  });

  group('SplashScreen Widget Test', () {
    testWidgets("Validate visibility of SplashScreen components ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.byKey(Key("logo")), findsOneWidget);
    });
  });
}
