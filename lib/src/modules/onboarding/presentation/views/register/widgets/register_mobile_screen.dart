import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/dashed_padded_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class RegisterMobileScreen extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signUpButtonWidget;
  final Widget signUpGoogleButtonWidget;
  final VoidCallback onSignInClicked;
  const RegisterMobileScreen({
    Key? key,
    required this.emailWidget,
    required this.passwordWidget,
    required this.signUpButtonWidget,
    required this.onSignInClicked,
    required this.signUpGoogleButtonWidget,
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
              text: StringConfig.text.signUp,
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
              child: Image.asset(
                AppImageAssets.reg_illustrator_mobile2,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: emailWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: passwordWidget,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: signUpButtonWidget,
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
              child: signUpGoogleButtonWidget,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: StringConfig.text.alreadyHaveAccount),
                CustomText(
                  text: StringConfig.text.signIn,
                  color: Pallet.primary,
                  weight: FontWeight.bold,
                  isUnderlined: true,
                  onTap: onSignInClicked,
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
