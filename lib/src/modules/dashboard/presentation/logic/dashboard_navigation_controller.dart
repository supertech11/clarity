import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardNavigationController extends GetxController {
  static DashboardNavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigatorKey.currentState!.pop();
}
