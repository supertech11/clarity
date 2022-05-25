import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/walkthrough/widgets/slide_dots.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late MenuController menuController;
  DashboardNavigationController navigationController = Get.find();
  LoginController loginController = Get.find();
  @override
  void initState() {
    super.initState();
    menuController = Get.put(MenuController(vsync: this));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.bgWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Obx(
                  () => CustomText(
                    key: Key("greetings_bar"),
                    text:
                        "${StringConfig.text.hello}, ${loginController.firstName}",
                    weight: FontWeight.w500,
                    size: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  key: Key("welcome_msg"),
                  text: "${StringConfig.text.welcomeWithoutExclamation}",
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.verticalHeightScaled * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                key: Key("tap_to_view"),
                text: StringConfig.text.tapToView,
                weight: FontWeight.w500,
              ),
            ],
          ),
          Expanded(
            child: CarouselSlider.builder(
                itemCount: 2,
                key: Key("actions_carousel"),
                options: CarouselOptions(
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    height: double.maxFinite,
                    viewportFraction: 0.8,
                    // enlargeCenterPage: true,
                    onPageChanged: (index, rsn) =>
                        menuController.onPageChanged(index)),
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    Container(
                      height: 800,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: SizeConfig.verticalHeightScaled),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      switch (
                                          menuController.currentPage.value) {
                                        case 0:
                                          menuController.activeItem.value =
                                              RouteConstants.surveyPageRoute;
                                          navigationController.navigateTo(
                                              RouteConstants.surveyPageRoute);
                                          break;
                                        case 1:
                                          menuController.activeItem.value =
                                              RouteConstants.referralPageRoute;
                                          navigationController.navigateTo(
                                              RouteConstants.referralPageRoute);
                                          break;
                                        default:
                                          break;
                                      }
                                    },
                                    child: Container(
                                        constraints:
                                            BoxConstraints(maxHeight: 348),
                                        decoration: BoxDecoration(),
                                        child: menuController
                                            .sliderItems![itemIndex]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.verticalHeightScaled * 2,
                          ),
                        ],
                      ),
                    )),
          ),
          SizedBox(
            height: SizeConfig.verticalHeightScaled * 2,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideDots(
                      menuController.currentPage.value,
                      key: Key("slide_dots"),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: SizeConfig.verticalHeightScaled * 2,
          ),
        ],
      ),
    );
  }
}
