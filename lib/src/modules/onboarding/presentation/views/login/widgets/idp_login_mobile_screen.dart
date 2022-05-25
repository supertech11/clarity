import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class IdpLoginMobileScreen extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signInButtonWidget;
  final Widget signInGoogleButtonWidget;
  final VoidCallback onForgotPasswordClicked;
  final VoidCallback onSignUpClicked;
  const IdpLoginMobileScreen({
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
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight / 1.4,
            width: SizeConfig.screenWidth,
            child: Image.asset(
              AppImageAssets.login_bg_image,
              fit: BoxFit.fill,
            ),
          ),
          // SizedBox(
          //   height: SizeConfig.verticalHeightScaled / 2,
          // ),
          CustomText(
            text: "Get care",
            weight: FontWeight.bold,
            size: SizeConfig.mediumTextSize,
            color: Colors.white,
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomText(
              text: StringConfig.text.getExaminedMsg,
              color: Colors.white,
              isCentered: true,
            ),
          ),
          SizedBox(
            height: SizeConfig.verticalHeightScaled * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: signInGoogleButtonWidget,
          ),
        ],
      ),
    );
  }
}
