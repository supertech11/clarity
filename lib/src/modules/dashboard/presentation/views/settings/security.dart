import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/change_password.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mobileAppBar(
        appBar: AppBar(
          backgroundColor: Pallet.bgWhite,
          elevation: 0,
          leading: CustomBackButton(
            key: Key("back_button"),
          ),
          titleSpacing: 0,
          centerTitle: false,
          title: clarityLogoText(),
        ),
      ),
      body: Container(
        color: Pallet.bgWhite,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomText(
                  key: Key("page_title"),
                  text: "Security",
                  weight: FontWeight.bold,
                  size: 24,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: CustomButton(
                key: Key("change_password"),
                label: "Change Password",
                onPressed: () {
                  Get.to(ChangePasswordScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
