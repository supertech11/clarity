import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/new_password_large_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/new_password_medium_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/new_password_mobile_screen.dart';

import 'package:get/get.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        largeScreen: NewPasswordLargeScreen(
          key: Key("large_screen"),
          changePasswordButtonWidget: changePasswordButtonWidget,
          confirmPasswordWidget: confirmPasswordWidget,
          newPasswordWidget: newPasswordWidget,
          onSignInClicked: onSignInClicked,
        ),
        mediumScreen: NewPasswordMediumScreen(
          key: Key("medium_screen"),
          changePasswordButtonWidget: changePasswordButtonWidget,
          confirmPasswordWidget: confirmPasswordWidget,
          newPasswordWidget: newPasswordWidget,
          onSignInClicked: onSignInClicked,
        ),
        smallScreen: NewPasswordMobileScreen(
          key: Key("mobile_screen"),
          changePasswordButtonWidget: changePasswordButtonWidget,
          confirmPasswordWidget: confirmPasswordWidget,
          newPasswordWidget: newPasswordWidget,
          onSignInClicked: onSignInClicked,
        ));
  }

  VoidCallback? onSignInClicked() {
    Get.offAllNamed(OnboardingModule.loginScreen.name);
  }

  Widget get newPasswordWidget => CustomTextFormField(
        key: Key("newpassword"),
        labelText: StringConfig.text.newPassword,
        hintText: StringConfig.text.typeSomething,
      );

  Widget get confirmPasswordWidget => CustomTextFormField(
        key: Key("confirmpassword"),
        labelText: StringConfig.text.confirmPassword,
        hintText: StringConfig.text.typeSomething,
      );

  Widget get changePasswordButtonWidget => Container(
        width: SizeConfig.screenWidth,
        child: CustomButton(
          key: Key("changepassword"),
          label: StringConfig.text.changePassword,
          onPressed: () {
            Get.offAllNamed(OnboardingModule.loginScreen.name);
          },
        ),
      );
}
