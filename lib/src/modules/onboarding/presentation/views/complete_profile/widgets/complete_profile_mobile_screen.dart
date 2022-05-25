import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class CompleteProfileMobileScreen extends StatelessWidget {
  final Widget firstnameWidget;
  final Widget lastnameWidget;
  final Widget dobWidget;
  final Widget finishButtonWidget;
  final Widget imageAvatarWidget;
  final VoidCallback onUploadImageClicked;
  final VoidCallback onSignInClicked;
  const CompleteProfileMobileScreen({
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
    return Scaffold(
      backgroundColor: Pallet.white,
      body: SingleChildScrollView(
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
              height: SizeConfig.verticalHeightScaled,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: firstnameWidget),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: lastnameWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: dobWidget,
            ),
            SizedBox(
              height: SizeConfig.verticalHeightScaled * 10,
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
    );
  }
}
