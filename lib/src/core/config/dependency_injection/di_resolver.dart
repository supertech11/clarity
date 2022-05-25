import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/navigation/app_router.dart';

class DI {
  static AppRouter get resolveRouter => AppRouter.it;

  static T resolve<T>() => Get.find();
}
