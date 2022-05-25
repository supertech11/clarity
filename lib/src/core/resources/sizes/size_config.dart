import 'package:get/get.dart';

/// This class will handled the manual size configurations

class SizeConfig {
  static double get screenHeight => Get.height;

  static double get screenWidth => Get.width;

//  Height
  static double get verticalHeightScaled => Get.height * 0.025;
  static double get horizontalWidthScaled => Get.width * 0.025;
  static double get midHeightScaled => verticalHeightScaled * 20;

  static double get normalTextSize => 14;
  static double get mediumTextSize => 24;
}
