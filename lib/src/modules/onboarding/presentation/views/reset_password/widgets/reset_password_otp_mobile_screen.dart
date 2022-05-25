import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class ResetPasswordOtpMobileScreen extends StatelessWidget {
  final Widget otpWidget, verifyButtonWidget;
  final VoidCallback onSignInClicked;

  const ResetPasswordOtpMobileScreen(
      {Key? key,
      required this.otpWidget,
      required this.verifyButtonWidget,
      required this.onSignInClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mobileAppBar(
        appBar: AppBar(
          backgroundColor: Pallet.white,
          elevation: 0,
          leading: CustomBackButton(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Pallet.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 1.5,
            ),
            CustomText(
              text: StringConfig.text.checkYourMail,
              weight: FontWeight.bold,
              size: SizeConfig.mediumTextSize,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            CustomText(
              text: StringConfig.text.checkYourMailMsg,
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
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: StringConfig.text.rememberPassword,
                  color: Pallet.blackNeutral,
                ),
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
