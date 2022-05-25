import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_outline_button.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/widgets/idp_login_mobile_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/widgets/login_large_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/widgets/login_medium_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        largeScreen: LoginLargeScreen(
          key: Key("large_screen"),
          emailWidget: emailWidget,
          onForgotPasswordClicked: onForgotPasswordClicked,
          onSignUpClicked: onSignUpClicked,
          passwordWidget: passwordWidget,
          signInButtonWidget: signInButtonWidget,
          signInGoogleButtonWidget: signInGoogleButtonWidget,
        ),
        mediumScreen: LoginMediumScreen(
          key: Key("medium_screen"),
          emailWidget: emailWidget,
          onForgotPasswordClicked: onForgotPasswordClicked,
          onSignUpClicked: onSignUpClicked,
          passwordWidget: passwordWidget,
          signInButtonWidget: signInButtonWidget,
          signInGoogleButtonWidget: signInGoogleButtonWidget,
        ),
        smallScreen: IdpLoginMobileScreen(
          key: Key("mobile_screen"),
          emailWidget: emailWidget,
          onForgotPasswordClicked: onForgotPasswordClicked,
          onSignUpClicked: onSignUpClicked,
          passwordWidget: passwordWidget,
          signInButtonWidget: signInButtonWidget,
          signInGoogleButtonWidget: signInMedicareButtonWidget,
        )
        // LoginMobileScreen(
        //   emailWidget: emailWidget,
        //   onForgotPasswordClicked: onForgotPasswordClicked,
        //   onSignUpClicked: onSignUpClicked,
        //   passwordWidget: passwordWidget,
        //   signInButtonWidget: signInButtonWidget,
        //   signInGoogleButtonWidget: signInGoogleButtonWidget,
        // ),
        );
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
  Widget get signInButtonWidget => Container(
        width: SizeConfig.screenWidth,
        child: CustomButton(
          key: Key("signin"),
          label: StringConfig.text.signIn,
          onPressed: () {
            Get.toNamed(DashboardModule.dashboardScreen.name);
          },
        ),
      );
  Widget get signInGoogleButtonWidget => CustomOutlineButton(
        label: StringConfig.text.signInUsingGoogle,
        isCenteredContent: true,
        key: Key("withGoogle"),
        onPressed: () {
          Get.toNamed(DashboardModule.dashboardScreen.name);
        },
        prefixIcon: Image.asset(AppImageAssets.google),
      );
  Widget get signInMedicareButtonWidget => CustomOutlineButton(
        label: StringConfig.text.continueWithMedicare,
        isCenteredContent: true,
        key: Key("withMedicare"),
        onPressed: () {
          loginController.loginWithMedicareClicked();
        },
        prefixIcon: Image.asset(AppImageAssets.medicare_logo),
      );
  VoidCallback? onSignUpClicked() {
    Get.toNamed(OnboardingModule.registerScreen.name);
  }

  VoidCallback? onForgotPasswordClicked() {
    Get.toNamed(OnboardingModule.resetPasswordScreen.name);
  }
}
