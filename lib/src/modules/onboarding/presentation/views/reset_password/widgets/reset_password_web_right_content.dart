import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class ResetPasswordWebRightContent extends StatelessWidget {
  final Widget emailWidget, sendCodeButtonWidget;
  final VoidCallback onSignInClicked;
  const ResetPasswordWebRightContent({
    Key? key,
    required this.emailWidget,
    required this.sendCodeButtonWidget,
    required this.onSignInClicked,
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
                  text: StringConfig.text.resetPassword.replaceAll("\n", " "),
                  weight: FontWeight.bold,
                  size: SizeConfig.mediumTextSize,
                ),
                SizedBox(
                  height: SizeConfig.verticalHeightScaled * 2,
                ),
                CustomText(
                  text: StringConfig.text.enterEmailMsg,
                  color: Pallet.blackNeutral,
                  isCentered: true,
                ),
                SizedBox(
                  height: SizeConfig.verticalHeightScaled * 2,
                ),
                emailWidget,
                SizedBox(
                  height: SizeConfig.verticalHeightScaled,
                ),
                sendCodeButtonWidget
              ],
            ),
          ),
        )),
      ],
    );
  }
}
