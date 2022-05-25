import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/widgets/login_web_left_content.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/widgets/register_web_right_content.dart';

class RegisterLargeScreen extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signUpButtonWidget;
  final Widget signUpGoogleButtonWidget;
  final VoidCallback onSignInClicked;
  const RegisterLargeScreen({
    Key? key,
    required this.emailWidget,
    required this.passwordWidget,
    required this.signUpButtonWidget,
    required this.onSignInClicked,
    required this.signUpGoogleButtonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallet.white,
        child: Row(
          children: [
            Expanded(
              child: LoginWebLeftContent(),
            ),
            Expanded(
                child: RegisterWebRightContent(
                    emailWidget: emailWidget,
                    passwordWidget: passwordWidget,
                    signUpButtonWidget: signUpButtonWidget,
                    onSignInClicked: onSignInClicked,
                    signUpGoogleButtonWidget: signUpGoogleButtonWidget)),
          ],
        ),
      ),
    );
  }
}
