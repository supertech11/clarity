import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: Pallet.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImageAssets.error404,
                key: Key("error404_image"),
              ),
              SizedBox(
                height: SizeConfig.verticalHeightScaled * 3,
              ),
              CustomText(
                text: StringConfig.text.whereAreWe,
                weight: FontWeight.bold,
                size: SizeConfig.mediumTextSize,
                key: Key("where_are_we"),
              ),
              SizedBox(
                height: SizeConfig.verticalHeightScaled * 2,
              ),
              CustomText(
                text: StringConfig.text.cantFindPage,
                color: Pallet.blackNeutral,
                key: Key("cant_find_page"),
              ),
              SizedBox(
                height: SizeConfig.verticalHeightScaled * 2,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400, minWidth: 300),
                child: CustomButton(
                  key: Key("go_back_home"),
                  label: StringConfig.text.goBackHome,
                  onPressed: () {
                    Get.toNamed(DashboardModule.dashboardScreen.name);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
