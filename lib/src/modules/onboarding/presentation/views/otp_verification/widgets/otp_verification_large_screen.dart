import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/otp_verification/widgets/otp_verification_web_left_content.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/otp_verification/widgets/otp_verification_web_right_content.dart';

class OtpVerificationLargeScreen extends StatelessWidget {
  final Widget otpWidget;
  final Widget submitOtpButtonWidget;
  final VoidCallback onSignInClicked;
  const OtpVerificationLargeScreen({
    Key? key,
    required this.otpWidget,
    required this.onSignInClicked,
    required this.submitOtpButtonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallet.white,
        child: Row(
          children: [
            Expanded(
              child: OtpVerificationWebLeftContent(),
            ),
            Expanded(
                child: OtpVerificationWebRightContent(
                    otpWidget: otpWidget,
                    onSignInClicked: onSignInClicked,
                    submitOtpButtonWidget: submitOtpButtonWidget)),
          ],
        ),
      ),
    );
  }
}
