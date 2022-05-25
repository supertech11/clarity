import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_large_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_medium_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_mobile_screen.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      key: Key("large_screen"),
      largeScreen: ResetPasswordLargeScreen(
        sendCodeButtonWidget: sendCodeButtonWidget,
        emailWidget: emailWidget,
        onSignInClicked: onSignInClicked,
      ),
      mediumScreen: ResetPasswordMediumScreen(
        key: Key("medium_screen"),
        sendCodeButtonWidget: sendCodeButtonWidget,
        emailWidget: emailWidget,
        onSignInClicked: onSignInClicked,
      ),
      smallScreen: ResetPasswordMobileScreen(
        key: Key("mobile_screen"),
        sendCodeButtonWidget: sendCodeButtonWidget,
        emailWidget: emailWidget,
        onSignInClicked: onSignInClicked,
      ),
    );
  }

  Widget get emailWidget => CustomTextFormField(
        key: Key("email"),
        labelText: StringConfig.text.emailOrPhoneNo,
        hintText: StringConfig.text.typeSomething,
      );

  Widget get sendCodeButtonWidget => Container(
        width: SizeConfig.screenWidth,
        child: CustomButton(
          key: Key("sendcode"),
          label: StringConfig.text.sendCode,
          onPressed: () {
            Get.toNamed(OnboardingModule.resetPasswordOtpScreen.name);
          },
        ),
      );
  VoidCallback? onSignInClicked() {
    Get.offNamed(OnboardingModule.loginScreen.name);
  }
}
