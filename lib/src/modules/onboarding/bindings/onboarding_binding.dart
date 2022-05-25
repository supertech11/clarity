import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:saffron_clarity/src/core/services/network_connect.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/splashscreen_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/walkthrough_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashscreenController());
    Get.lazyPut(() => WalkthroughController());
    Get.put(LoginController(), permanent: true);
    final getConnectInstance = new GetConnect();
    Get.put(NetworkConnect(getConnectInstance), permanent: true);
  }
}
