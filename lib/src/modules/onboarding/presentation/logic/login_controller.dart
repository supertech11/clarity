import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  final storage = new FlutterSecureStorage();
  final userToken = "".obs;
  final userId = "".obs;
  final firstName = "".obs;
  final lastName = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loginWithMedicareClicked() {
    if (!kIsWeb) {
      // Get.toNamed(DashboardModule.dashboardScreen.name);
      Get.toNamed(OnboardingModule.loginWithMedicareScreen.name);
    } else {}
  }

  Future validateLoginWithMedicare(dynamic response) async {
    try {
      Map<String, dynamic> decodedToken = {};

      if (response["status"] != 200) {
        throw HttpException(response["message"]);
      } else {
        decodedToken = JwtDecoder.decode(response["data"]);
        debugPrint("successfully validated");
      }

      userToken.value = response["data"];
      userId.value = decodedToken["resourceId"];
      firstName.value = decodedToken["firstName"];
      lastName.value = decodedToken["lastName"];
      debugPrint("userId : " + userId.toString());

      final userData = json.encode({
        'userToken': userToken.value,
        'userId': userId.value,
        'firstName': firstName.value,
        'lastName': lastName.value
      });
      await storage.write(key: "userData", value: userData);
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> tryAutoLogin() async {
    bool isContainedUserData = await storage.containsKey(key: "userData");
    if (!isContainedUserData) {
      return false;
    }
    String? userData = await storage.read(key: "userData");
    final extractedUserData = json.decode(userData!);

    userToken.value = extractedUserData["userToken"];
    userId.value = extractedUserData["userId"];
    firstName.value = extractedUserData["firstName"] ?? "";
    lastName.value = extractedUserData["lastName"] ?? "";
    return true;
  }

  void logout() async {
    userToken.value = "";
    storage.deleteAll();
  }
}
