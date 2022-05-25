import 'package:get/get.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';
import 'package:saffron_clarity/src/modules/module.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';

class AppRouter {
  AppRouter._();

  static AppRouter get it => AppRouter._();

  String get mobileInitialRoute => OnboardingModule.splashScreen.name;
  String get webInitialRoute => OnboardingModule.loginScreen.name;
  // String get initialRoute => HomeModule.homeScreen.name;

  static final _modules = <Module>[
    DashboardModule(),
    OnboardingModule(),
  ];

  List<GetPage> get all {
    final routes = <GetPage>[];
    for (var module in _modules) {
      module.register(routes);
    }
    return routes;
  }
}
