import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_otp_large_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_otp_medium_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/reset_password_otp_mobile_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class ResetPasswordOtpScreen extends StatefulWidget {
  const ResetPasswordOtpScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordOtpScreenState createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen> {
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    super.dispose();
    errorController.close();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: ResetPasswordOtpLargeScreen(
        key: Key("large_screen"),
        verifyButtonWidget: verifyButtonWidget,
        otpWidget: otpWidget,
        onSignInClicked: onSignInClicked,
      ),
      mediumScreen: ResetPasswordOtpMediumScreen(
        key: Key("medium_screen"),
        verifyButtonWidget: verifyButtonWidget,
        otpWidget: otpWidget,
        onSignInClicked: onSignInClicked,
      ),
      smallScreen: ResetPasswordOtpMobileScreen(
        key: Key("mobile_screen"),
        verifyButtonWidget: verifyButtonWidget,
        otpWidget: otpWidget,
        onSignInClicked: onSignInClicked,
      ),
    );
  }

  VoidCallback? onSignInClicked() {
    Get.offAllNamed(OnboardingModule.loginScreen.name);
  }

  Widget get verifyButtonWidget => Container(
        width: SizeConfig.screenWidth,
        child: CustomButton(
          key: Key("verify"),
          label: StringConfig.text.verify,
          onPressed: () {
            Get.offNamed(OnboardingModule.newPasswordScreen.name);
          },
        ),
      );

  Widget get otpWidget => Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: TextStyle(
            color: Pallet.black,
            fontWeight: FontWeight.bold,
          ),
          textStyle: TextStyle(
            color: Pallet.black,
          ),
          length: 4,
          obscureText: false,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          // validator: (v) {},
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            inactiveColor: Pallet.greyBorderColor,
            borderRadius: BorderRadius.circular(8),
            inactiveFillColor: Pallet.white, //Colors.grey.withOpacity(0.3),
            selectedFillColor: Pallet.white,
            selectedColor: Theme.of(context).primaryColor,
            activeColor: Pallet.primary,
            fieldHeight: 60,
            fieldWidth: 60,
            activeFillColor: Pallet.white,
          ),
          cursorColor: Colors.black,
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.white10,
          enableActiveFill: true,
          // errorAnimationController: errorController,
          controller: textEditingController,
          keyboardType: TextInputType.number,
          // boxShadows: [
          //   BoxShadow(
          //     offset: Offset(0, 1),
          //     color: Colors.black12,
          //     blurRadius: 10,
          //   )
          // ],
          onCompleted: (v) async {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      );
}
