import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/new_password_web_left_content.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/widgets/new_password_web_right_content.dart';

class NewPasswordLargeScreen extends StatelessWidget {
  final Widget newPasswordWidget,
      confirmPasswordWidget,
      changePasswordButtonWidget;
  final VoidCallback onSignInClicked;
  const NewPasswordLargeScreen(
      {Key? key,
      required this.changePasswordButtonWidget,
      required this.confirmPasswordWidget,
      required this.newPasswordWidget,
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
              child: NewPasswordWebLeftContent(),
            ),
            Expanded(
                child: NewPasswordWebRightContent(
              changePasswordButtonWidget: changePasswordButtonWidget,
              confirmPasswordWidget: confirmPasswordWidget,
              newPasswordWidget: newPasswordWidget,
              onSignInClicked: onSignInClicked,
            )),
          ],
        ),
      ),
    );
  }
}
