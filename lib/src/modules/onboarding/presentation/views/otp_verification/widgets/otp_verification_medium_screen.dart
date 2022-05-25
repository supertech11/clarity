import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/otp_verification/widgets/otp_verification_web_right_content.dart';

class OtpVerificationMediumScreen extends StatelessWidget {
  final Widget otpWidget;
  final Widget submitOtpButtonWidget;
  final VoidCallback onSignInClicked;
  const OtpVerificationMediumScreen({
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
                child: OtpVerificationWebRightContent(
                    otpWidget: otpWidget,
                    onSignInClicked: onSignInClicked,
                    submitOtpButtonWidget: submitOtpButtonWidget))
          ],
        ),
      ),
    );
  }
}
