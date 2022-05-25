import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complete_profile/widgets/complete_profile_web_right_content.dart';

class CompleteProfileMediumScreen extends StatelessWidget {
  final Widget firstnameWidget;
  final Widget lastnameWidget;
  final Widget dobWidget;
  final Widget finishButtonWidget;
  final Widget imageAvatarWidget;
  final VoidCallback onUploadImageClicked;
  final VoidCallback onSignInClicked;
  const CompleteProfileMediumScreen({
    Key? key,
    required this.firstnameWidget,
    required this.lastnameWidget,
    required this.onUploadImageClicked,
    required this.dobWidget,
    required this.imageAvatarWidget,
    required this.onSignInClicked,
    required this.finishButtonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallet.white,
        child: Row(
          children: [
            Expanded(
              child: CompleteProfileWebRightContent(
                  firstnameWidget: firstnameWidget,
                  lastnameWidget: lastnameWidget,
                  onUploadImageClicked: onUploadImageClicked,
                  dobWidget: dobWidget,
                  imageAvatarWidget: imageAvatarWidget,
                  onSignInClicked: onSignInClicked,
                  finishButtonWidget: finishButtonWidget),
            )
          ],
        ),
      ),
    );
  }
}
