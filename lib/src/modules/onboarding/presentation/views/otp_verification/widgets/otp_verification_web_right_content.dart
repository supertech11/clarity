import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class OtpVerificationWebRightContent extends StatelessWidget {
  final Widget otpWidget;
  final Widget submitOtpButtonWidget;
  final VoidCallback onSignInClicked;
  const OtpVerificationWebRightContent({
    Key? key,
    required this.otpWidget,
    required this.onSignInClicked,
    required this.submitOtpButtonWidget,
  }) : super(key: key);

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
                    text: StringConfig.text.alreadyHaveAccount,
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
                    text: StringConfig.text.verification,
                    size: SizeConfig.mediumTextSize,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  CustomText(
                    text: StringConfig.text.verificationMsg,
                    color: Pallet.blackNeutral,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled / 3,
                  ),
                  CustomText(
                    text: "saffron@gmail.com",
                    color: Pallet.blackNeutral,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled * 2,
                  ),
                  otpWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled * 2,
                  ),
                  CustomText(
                    text: StringConfig.text.resendCode,
                    isUnderlined: true,
                    color: Pallet.primary,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  submitOtpButtonWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  CustomText(
                    text: StringConfig.text.changeEmail,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
