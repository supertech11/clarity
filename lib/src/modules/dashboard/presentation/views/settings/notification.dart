import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_back_button.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/mobile_app_bar.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/widgets/notification_settings_item.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

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
                scrollDirection: Axis.vertical,
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
                          text: "Notifications Settings",
                          weight: FontWeight.bold,
                          size: 24,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    NotificationSettingsItem(
                      title: "In-app notifications",
                      subtitle:
                          "Receive notifications when transactions happens in your account ",
                    ),
                    NotificationSettingsItem(
                      title: "Email notifications",
                      subtitle:
                          "Receive app updates, alerts of requests and transaction notices in your email account",
                    ),
                    NotificationSettingsItem(
                      title: "Device",
                      subtitle:
                          "Receive app updates, alerts of requests and transaction notices in your email account",
                    ),
                    NotificationSettingsItem(
                      title: "Text message",
                      subtitle:
                          "Receive app updates, alerts of requests and transaction notices in your email account",
                    )
                  ],
                ),
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
