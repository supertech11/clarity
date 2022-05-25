import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complete_profile/widgets/complete_profile_large_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complete_profile/widgets/complete_profile_medium_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complete_profile/widgets/complete_profile_mobile_screen.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: CompleteProfileLargeScreen(
        key: Key("large_screen"),
        firstnameWidget: firstnameWidget,
        lastnameWidget: lastnameWidget,
        onUploadImageClicked: () {},
        dobWidget: dobWidget,
        imageAvatarWidget: imageAvatarWidget,
        onSignInClicked: onSignInClicked,
        finishButtonWidget: finishButtonWidget,
      ),
      mediumScreen: CompleteProfileMediumScreen(
        key: Key("medium_screen"),
        firstnameWidget: firstnameWidget,
        lastnameWidget: lastnameWidget,
        onUploadImageClicked: () {},
        dobWidget: dobWidget,
        imageAvatarWidget: imageAvatarWidget,
        onSignInClicked: onSignInClicked,
        finishButtonWidget: finishButtonWidget,
      ),
      smallScreen: CompleteProfileMobileScreen(
        key: Key("mobile_screen"),
        firstnameWidget: firstnameWidget,
        lastnameWidget: lastnameWidget,
        onUploadImageClicked: () {},
        dobWidget: dobWidget,
        imageAvatarWidget: imageAvatarWidget,
        onSignInClicked: onSignInClicked,
        finishButtonWidget: finishButtonWidget,
      ),
    );
  }

  VoidCallback? onSignInClicked() {
    Get.offAllNamed(OnboardingModule.loginScreen.name);
  }

  Widget get imageAvatarWidget => CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xffF5F5F5),
        child: Image.asset(
          AppImageAssets.user_placeholder,
          width: 20,
        ),
      );
  Widget get firstnameWidget => CustomTextFormField(
        key: Key("firstname"),
        labelText: StringConfig.text.firstName,
        hintText: StringConfig.text.typeSomething,
      );

  Widget get lastnameWidget => CustomTextFormField(
        key: Key("lastname"),
        labelText: StringConfig.text.lastName,
        hintText: StringConfig.text.typeSomething,
      );
  Widget get dobWidget => CustomTextFormField(
        key: Key("dob"),
        labelText: StringConfig.text.dob,
        hintText: StringConfig.text.typeSomething,
      );
  Widget get finishButtonWidget => Container(
        width: SizeConfig.screenWidth,
        child: CustomButton(
          key: Key("finish"),
          label: StringConfig.text.finish,
          onPressed: () {
            Get.offAllNamed(OnboardingModule.loginScreen.name);
          },
        ),
      );
}
