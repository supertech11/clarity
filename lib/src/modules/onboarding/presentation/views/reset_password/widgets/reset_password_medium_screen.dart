import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_web_right_content.dart';

class ResetPasswordMediumScreen extends StatelessWidget {
  final Widget emailWidget, sendCodeButtonWidget;
  final VoidCallback onSignInClicked;
  const ResetPasswordMediumScreen({
    Key? key,
    required this.emailWidget,
    required this.sendCodeButtonWidget,
    required this.onSignInClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallet.white,
        child: Row(
          children: [
            Expanded(
                child: ResetPasswordWebRightContent(
              emailWidget: emailWidget,
              onSignInClicked: onSignInClicked,
              sendCodeButtonWidget: sendCodeButtonWidget,
            )),
          ],
        ),
      ),
    );
  }
}
