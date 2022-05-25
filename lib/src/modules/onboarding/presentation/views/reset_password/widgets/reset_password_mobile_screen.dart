import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class ResetPasswordMobileScreen extends StatelessWidget {
  final Widget emailWidget, sendCodeButtonWidget;
  final VoidCallback onSignInClicked;
  const ResetPasswordMobileScreen({
    Key? key,
    required this.emailWidget,
    required this.sendCodeButtonWidget,
    required this.onSignInClicked,
  }) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 1.5,
            ),
            CustomText(
              text: StringConfig.text.resetPassword,
              weight: FontWeight.bold,
              size: SizeConfig.mediumTextSize,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            CustomText(
              text: StringConfig.text.enterEmailMsg,
              color: Pallet.blackNeutral,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 2,
            ),
            emailWidget,
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            sendCodeButtonWidget,
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
                    onTap: onSignInClicked)
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
