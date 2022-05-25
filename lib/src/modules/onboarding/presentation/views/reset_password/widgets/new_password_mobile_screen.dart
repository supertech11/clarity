import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NewPasswordMobileScreen extends StatelessWidget {
  final Widget newPasswordWidget,
      confirmPasswordWidget,
      changePasswordButtonWidget;
  final VoidCallback onSignInClicked;
  const NewPasswordMobileScreen(
      {Key? key,
      required this.changePasswordButtonWidget,
      required this.confirmPasswordWidget,
      required this.newPasswordWidget,
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
          title: CustomText(
            text: StringConfig.text.newPassword,
            weight: FontWeight.bold,
            size: SizeConfig.mediumTextSize,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Pallet.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kIsWeb
                ? Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.verticalHeightScaled * 3,
                      ),
                      CustomText(
                        text: StringConfig.text.setNewPassword,
                        weight: FontWeight.bold,
                        size: SizeConfig.mediumTextSize,
                      ),
                      SizedBox(
                        height: SizeConfig.verticalHeightScaled * 2,
                      ),
                      CustomText(
                        text: StringConfig.text.typeNewPassword,
                        color: Pallet.blackNeutral,
                      ),
                      SizedBox(
                        height: SizeConfig.verticalHeightScaled * 2,
                      ),
                    ],
                  )
                : SizedBox(
                    height: 0,
                  ),
            newPasswordWidget,
            confirmPasswordWidget,
            SizedBox(
              height: SizeConfig.verticalHeightScaled,
            ),
            changePasswordButtonWidget,
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
