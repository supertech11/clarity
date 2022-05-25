import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/login_with_medicare_webview.dart';

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
            body: LoginWithMedicareWebview(),
          );
        });
      },
    );
  });

  group('LoginWithMedicareWebview Widget Test', () {
    testWidgets(
        "Validate visibility of LoginWithMedicareWebview crucial components ",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);

      expect(find.byKey(Key("clarityLogoText")), findsOneWidget);
      expect(find.byKey(Key("back")), findsOneWidget);
      expect(find.byKey(Key("title")), findsOneWidget);
      expect(find.byKey(Key("webview")), findsOneWidget);
    });
  });
}
