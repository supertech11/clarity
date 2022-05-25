import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/config/dependency_injection/di.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    DISetup.init();
  }
}
