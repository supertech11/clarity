import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class ResetPasswordOtpWebRightContent extends StatelessWidget {
  final Widget otpWidget, verifyButtonWidget;
  final VoidCallback onSignInClicked;
  ResetPasswordOtpWebRightContent(
      {Key? key,
      required this.otpWidget,
      required this.verifyButtonWidget,
      required this.onSignInClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.verticalHeightScaled,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.horizontalWidthScaled),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImageAssets.logo),
              Row(
                children: [
                  CustomText(
                    text: StringConfig.text.rememberPassword,
                    color: Pallet.blackNeutral,
                  ),
                  CustomText(
                    text: StringConfig.text.signIn,
                    color: Pallet.primary,
                    onTap: onSignInClicked,
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontalWidthScaled * 3),
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.verticalHeightScaled * 3,
                ),
                CustomText(
                  text: StringConfig.text.checkYourMail.replaceAll("\n", " "),
                  weight: FontWeight.bold,
                  size: SizeConfig.mediumTextSize,
                ),
                SizedBox(
                  height: SizeConfig.verticalHeightScaled * 2,
                ),
                CustomText(
                  text:
                      StringConfig.text.checkYourMailMsg.replaceAll("\n", " "),
                  color: Pallet.blackNeutral,
                ),
                SizedBox(
                  height: SizeConfig.verticalHeightScaled * 2,
                ),
                otpWidget,
                SizedBox(
                  height: SizeConfig.verticalHeightScaled,
                ),
                verifyButtonWidget,
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: StringConfig.text.openEmailApp,
                      color: Pallet.primary,
                      isUnderlined: true,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
