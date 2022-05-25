import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/dashboard.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/home/home.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/referral.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/referral_detail.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/settings.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/display_survey_observation.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/display_survey_response.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/render_survey.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/survey.dart';
import 'package:saffron_clarity/src/modules/module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

class DashboardModule extends Module {
  DashboardNavigationController navigationController =
      Get.put(DashboardNavigationController());

  static final dashboardScreen = GetPage(
    name: '/dashboard',
    page: () => DashboardScreen(),
    // middlewares: [AuthMiddlware()],
    binding: DashboardBinding(),
  );

  static final displaysurveyresponseScreen = GetPage(
    name: '/displaysurveyresponse',
    page: () => DisplaySurveyResponseScreen(),
    // middlewares: [AuthMiddlware()]
    binding: DashboardBinding(),
  );

  static final displaysurveyobservationScreen = GetPage(
    name: '/displaysurveyobservation',
    page: () => DisplaySurveyObservationScreen(),
    // middlewares: [AuthMiddlware()]
    binding: DashboardBinding(),
  );

  static final rendersurveyScreen = GetPage(
    name: '/rendersurvey',
    page: () => RenderSurvey(),
    // middlewares: [AuthMiddlware()]
    binding: DashboardBinding(),
  );

  @override
  void register(List<GetPage> routes) {
    routes.addAll([
      dashboardScreen,
      displaysurveyresponseScreen,
      displaysurveyobservationScreen,
      rendersurveyScreen
    ]);
  }

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Future<dynamic> navigateTo(String routeName) {
  //   return navigatorKey.currentState!.pushNamed(routeName);
  // }

  Navigator dashboardLocalNavigator() => Navigator(
        key: navigationController.navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: kIsWeb
            ? RouteConstants.referralPageRoute
            : RouteConstants.homePageRoute,
      );

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homePageRoute:
        return _getPageRoute(HomeScreen());
      case RouteConstants.referralPageRoute:
        return _getPageRoute(ReferralScreen());
      case RouteConstants.settingsPageRoute:
        return _getPageRoute(SettingsScreen());
      case RouteConstants.surveyPageRoute:
        return _getPageRoute(SurveyScreen());
      case RouteConstants.referralDetailPageRoute:
        return _getPageRoute(ReferralDetailScreen());
      default:
        return kIsWeb
            ? _getPageRoute(ReferralScreen())
            : _getPageRoute(HomeScreen());
    }
  }

  PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
