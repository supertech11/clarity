import 'package:flutter/material.dart';

import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
// import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complet_profile/complete_profile.dart';

class OtpVerificationMobileScreen extends StatelessWidget {
  final Widget otpWidget;
  final Widget submitOtpButtonWidget;
  final VoidCallback onSignInClicked;
  const OtpVerificationMobileScreen({
    Key? key,
    required this.otpWidget,
    required this.onSignInClicked,
    required this.submitOtpButtonWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.white,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.verticalHeightScaled * 3,
              ),
              Container(
                child: Image.asset(
                  AppImageAssets.done,
                  fit: BoxFit.fill,
                ),
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
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: submitOtpButtonWidget),
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
    );
  }
}
