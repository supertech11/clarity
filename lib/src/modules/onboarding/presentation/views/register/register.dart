import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_outline_button.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/widgets/register_large_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/widgets/register_medium_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/widgets/register_mobile_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: RegisterLargeScreen(
        key: Key("large_screen"),
        emailWidget: emailWidget,
        passwordWidget: passwordWidget,
        signUpButtonWidget: signUpButtonWidget,
        onSignInClicked: onSignInClicked,
        signUpGoogleButtonWidget: signUpGoogleButtonWidget,
      ),
      mediumScreen: RegisterMediumScreen(
        key: Key("medium_screen"),
        emailWidget: emailWidget,
        passwordWidget: passwordWidget,
        signUpButtonWidget: signUpButtonWidget,
        onSignInClicked: onSignInClicked,
        signUpGoogleButtonWidget: signUpGoogleButtonWidget,
      ),
      smallScreen: RegisterMobileScreen(
        key: Key("mobile_screen"),
        emailWidget: emailWidget,
        passwordWidget: passwordWidget,
        signUpButtonWidget: signUpButtonWidget,
        onSignInClicked: onSignInClicked,
        signUpGoogleButtonWidget: signUpGoogleButtonWidget,
      ),
    );
  }

  VoidCallback? onSignInClicked() {
    Get.offNamed(OnboardingModule.loginScreen.name);
  }

  Widget get emailWidget => CustomTextFormField(
        key: Key("email"),
        labelText: StringConfig.text.emailOrPhoneNo,
        hintText: StringConfig.text.typeSomething,
      );
  Widget get passwordWidget => CustomTextFormField(
        key: Key("password"),
        labelText: StringConfig.text.password,
        hintText: StringConfig.text.typeSomething,
      );
  Widget get signUpButtonWidget => Container(
        width: SizeConfig.screenWidth,
        child: CustomButton(
          key: Key("signin"),
          label: StringConfig.text.signUp,
          onPressed: () {
            Get.toNamed(OnboardingModule.otpVerificationScreen.name);
          },
        ),
      );
  Widget get signUpGoogleButtonWidget => CustomOutlineButton(
        label: StringConfig.text.signUpUsingGoogle,
        isCenteredContent: true,
        key: Key("withGoogle"),
        onPressed: () {
          Get.toNamed(OnboardingModule.otpVerificationScreen.name);
        },
        prefixIcon: Image.asset(AppImageAssets.google),
      );
}
