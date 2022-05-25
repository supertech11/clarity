import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class WalkthroughController extends GetxController {
  final currentPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  Timer? timer;
  List<Map<String, String>>? sliderItems = [
    {
      "title": StringConfig.text.getExamined,
      "desc": StringConfig.text.getExaminedMsg,
      "image": AppImageAssets.walkthrough_illustrator1
    },
    {
      "title": StringConfig.text.referralServices,
      "desc": StringConfig.text.referralServiceMsg,
      "image": AppImageAssets.walkthrough_illustrator2
    },
    {
      "title": StringConfig.text.byProfessionals,
      "desc": StringConfig.text.byProfessionalsMsg,
      "image": AppImageAssets.walkthrough_illustrator3
    }
  ];

  onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   if (currentPage < 2) {
    //     currentPage.value++;
    //   } else {
    //     currentPage.value = 0;
    //   }
    //   pageController.animateToPage(currentPage.value,
    //       duration: Duration(microseconds: 300), curve: Curves.easeIn);
    // });
  }

  @override
  void onClose() {
    super.onClose();
    if (timer != null) timer!.cancel();
  }
}
