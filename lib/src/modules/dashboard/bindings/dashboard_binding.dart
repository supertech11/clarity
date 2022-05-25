import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';
import 'package:saffron_clarity/src/core/services/network_connect.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), permanent: true);
    final getConnectInstance = new GetConnect();
    Get.put(NetworkConnect(getConnectInstance), permanent: true);
    Get.lazyPut(() => SurveyController());
    Get.lazyPut(() => DashboardNavigationController());
  }
}
