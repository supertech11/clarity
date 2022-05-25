import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/dashed_padded_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class LoginMobileScreen extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signInButtonWidget;
  final Widget signInGoogleButtonWidget;
  final VoidCallback onForgotPasswordClicked;
  final VoidCallback onSignUpClicked;
  const LoginMobileScreen({
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
    return Scaffold(
      backgroundColor: Pallet.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 3,
            ),
            CustomText(
              text: StringConfig.text.welcome,
              weight: FontWeight.bold,
              size: SizeConfig.mediumTextSize,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled / 2,
            ),
            CustomText(
              text: StringConfig.text.inputDetails,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled / 2,
            ),
            Container(
              height: SizeConfig.midHeightScaled / 2,
              // width: SizeConfig.screenWidth * 0.5,
              child: Image.asset(
                AppImageAssets.reg_illustrator_mobile2,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: emailWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: passwordWidget,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: signInButtonWidget,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            DashedPaddedText(text: StringConfig.text.continueWith),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: signInGoogleButtonWidget,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: StringConfig.text.dontHaveAccount),
                CustomText(
                  text: StringConfig.text.signUp,
                  color: Pallet.primary,
                  weight: FontWeight.bold,
                  isUnderlined: true,
                  onTap: onSignUpClicked,
                )
              ],
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
