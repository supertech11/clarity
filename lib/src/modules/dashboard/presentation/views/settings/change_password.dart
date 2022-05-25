import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: SizeConfig.verticalHeightScaled / 2,
                    ),
                    CustomTextFormField(
                      key: Key("currentpassword"),
                      labelText: "Current Password",
                      hintText: "****",
                      obscureText: true,
                    ),
                    CustomTextFormField(
                      key: Key("newpassword"),
                      labelText: "New Password",
                      hintText: "****",
                      obscureText: true,
                    ),
                    CustomTextFormField(
                      key: Key("oldpassword"),
                      labelText: "Old Password",
                      hintText: "****",
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: CustomButton(
                key: Key("changepassword"),
                label: "Change Password",
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
