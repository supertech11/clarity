import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/widgets/login_web_right_content.dart';

class LoginMediumScreen extends StatelessWidget {
  final Widget emailWidget;
  final Widget passwordWidget;
  final Widget signInButtonWidget;
  final Widget signInGoogleButtonWidget;
  final VoidCallback onForgotPasswordClicked;
  final VoidCallback onSignUpClicked;
  const LoginMediumScreen({
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
      body: Container(
        color: Pallet.white,
        child: Row(
          children: [
            Expanded(
              child: LoginWebRightContent(
                emailWidget: emailWidget,
                onForgotPasswordClicked: onForgotPasswordClicked,
                onSignUpClicked: onSignUpClicked,
                passwordWidget: passwordWidget,
                signInButtonWidget: signInButtonWidget,
                signInGoogleButtonWidget: signInGoogleButtonWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
