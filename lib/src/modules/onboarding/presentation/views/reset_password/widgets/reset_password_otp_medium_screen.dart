import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_otp_web_right_content.dart';

class ResetPasswordOtpMediumScreen extends StatelessWidget {
  final Widget otpWidget, verifyButtonWidget;
  final VoidCallback onSignInClicked;
  const ResetPasswordOtpMediumScreen(
      {Key? key,
      required this.otpWidget,
      required this.verifyButtonWidget,
      required this.onSignInClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallet.white,
        child: Row(
          children: [
            Expanded(
                child: ResetPasswordOtpWebRightContent(
              onSignInClicked: onSignInClicked,
              otpWidget: otpWidget,
              verifyButtonWidget: verifyButtonWidget,
            )),
          ],
        ),
      ),
    );
  }
}
