import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class OtpVerificationWebLeftContent extends StatelessWidget {
  const OtpVerificationWebLeftContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.horizontalWidthScaled * 3),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImageAssets.web_bg), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImageAssets.reg_illustrator_web),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            CustomText(
              text: StringConfig.text.referralMadeEasy,
              size: SizeConfig.mediumTextSize,
              isCentered: true,
              weight: FontWeight.bold,
              color: Pallet.white,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            CustomText(
              text: StringConfig.text.recordAndShareMsg,
              color: Pallet.white,
              isCentered: true,
            )
          ],
        ),
      ),
    );
  }
}
