import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class CompleteProfileWebRightContent extends StatelessWidget {
  final Widget firstnameWidget;
  final Widget lastnameWidget;
  final Widget dobWidget;
  final Widget finishButtonWidget;
  final Widget imageAvatarWidget;
  final VoidCallback onUploadImageClicked;
  final VoidCallback onSignInClicked;
  const CompleteProfileWebRightContent({
    Key? key,
    required this.firstnameWidget,
    required this.lastnameWidget,
    required this.onUploadImageClicked,
    required this.dobWidget,
    required this.imageAvatarWidget,
    required this.onSignInClicked,
    required this.finishButtonWidget,
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
                    text: StringConfig.text.almostDone,
                    weight: FontWeight.bold,
                    size: SizeConfig.mediumTextSize,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled / 2,
                  ),
                  CustomText(
                    text: StringConfig.text.aboutYourselfMsg,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  imageAvatarWidget,
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: StringConfig.text.uploadImage,
                    isUnderlined: true,
                    color: Pallet.primary,
                    onTap: onUploadImageClicked,
                  ),
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  firstnameWidget,
                  lastnameWidget,
                  dobWidget,
                  SizedBox(
                    height: SizeConfig.verticalHeightScaled,
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: finishButtonWidget,
                  ),
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
