import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/dashed_padded_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class LoginWebRightContent extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signInButtonWidget;
  final Widget signInGoogleButtonWidget;
  final VoidCallback onForgotPasswordClicked;
  final VoidCallback onSignUpClicked;
  const LoginWebRightContent({
    Key? key,
    required this.emailWidget,
    required this.passwordWidget,
    required this.onForgotPasswordClicked,
    required this.signInButtonWidget,
    required this.onSignUpClicked,
    required this.signInGoogleButtonWidget,
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
                    text: StringConfig.text.dontHaveAccount,
                    color: Pallet.blackNeutral,
                  ),
                  CustomText(
                    text: StringConfig.text.signUp,
                    color: Pallet.primary,
                    onTap: onSignUpClicked,
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
                    text: StringConfig.text.signIn,
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
                    height: SizeConfig.verticalHeightScaled / 2,
                  ),
                  emailWidget,
                  passwordWidget,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: StringConfig.text.forgotPassword,
                          weight: FontWeight.w500,
                          onTap: onForgotPasswordClicked,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  signInButtonWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  DashedPaddedText(text: StringConfig.text.continueWith),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  signInGoogleButtonWidget,
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
