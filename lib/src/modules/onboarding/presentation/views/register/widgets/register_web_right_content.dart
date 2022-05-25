import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/dashed_padded_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class RegisterWebRightContent extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signUpButtonWidget;
  final Widget signUpGoogleButtonWidget;
  final VoidCallback onSignInClicked;
  const RegisterWebRightContent({
    Key? key,
    required this.emailWidget,
    required this.passwordWidget,
    required this.signUpButtonWidget,
    required this.onSignInClicked,
    required this.signUpGoogleButtonWidget,
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
                    text: StringConfig.text.signUp,
                    weight: FontWeight.bold,
                    size: SizeConfig.mediumTextSize,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  CustomText(
                    text: StringConfig.text.inputDetails,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled * 2,
                  ),
                  emailWidget,
                  passwordWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  signUpButtonWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  DashedPaddedText(text: StringConfig.text.continueWith),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  signUpGoogleButtonWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
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
