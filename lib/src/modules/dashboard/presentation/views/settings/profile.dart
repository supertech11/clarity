import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                          text: "Edit Profile",
                          key: Key("page_title"),
                          weight: FontWeight.bold,
                          size: 24,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.verticalHeightScaled / 2,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppImageAssets.sample_user),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "Johnny Drille",
                      key: Key("fullname"),
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      key: Key("firstname"),
                      labelText: "First name",
                      hintText: StringConfig.text.typeSomething,
                      initialValue: "Jim",
                    ),
                    CustomTextFormField(
                      key: Key("lastname"),
                      labelText: "Last name",
                      hintText: StringConfig.text.typeSomething,
                      initialValue: "Halpert",
                    ),
                    CustomTextFormField(
                      key: Key("dob"),
                      labelText: "Date of birth",
                      hintText: StringConfig.text.typeSomething,
                      initialValue: "1 Oct 1960",
                    ),
                    CustomTextFormField(
                      key: Key("email"),
                      labelText: "Email",
                      hintText: StringConfig.text.typeSomething,
                      initialValue: "halpert@gmail.com",
                    ),
                    CustomTextFormField(
                      key: Key("phone"),
                      labelText: "Phone number",
                      hintText: StringConfig.text.typeSomething,
                      initialValue: "0900990099",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: CustomButton(
                key: Key("save"),
                label: "Save",
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
