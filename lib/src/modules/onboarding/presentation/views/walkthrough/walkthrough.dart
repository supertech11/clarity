import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/walkthrough_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/login_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/register.dart';
import 'package:get/get.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  WalkthroughController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: controller.onPageChanged,
                      controller: controller.pageController,
                      itemCount: 3,
                      itemBuilder: (ctx, i) => SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: SizeConfig.verticalHeightScaled * 5,
                            ),
                            Container(
                              key: Key("image"),
                              height: SizeConfig.midHeightScaled,
                              width: SizeConfig.screenWidth,
                              child: Image.asset(
                                "${controller.sliderItems![i]['image']}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.verticalHeightScaled,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: CustomText(
                                    key: Key("title"),
                                    text:
                                        "${controller.sliderItems![i]['title']}",
                                    size: SizeConfig.mediumTextSize,
                                    weight: FontWeight.bold)),
                            SizedBox(
                              height: SizeConfig.verticalHeightScaled,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: CustomText(
                                  key: Key("desc"),
                                  text: "${controller.sliderItems![i]['desc']}",
                                  color: Pallet.blackNeutral,
                                )),
                            SizedBox(
                              height: SizeConfig.verticalHeightScaled * 1.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      key: Key("signin"),
                      label: StringConfig.text.signIn,
                      buttonColor: Pallet.primaryLight,
                      labelColor: Pallet.primary,
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                      key: Key("signup"),
                      label: StringConfig.text.signUp,
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
          ],
        ),
      ),
    );
  }
}
