import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/notification.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/profile.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/security.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/settings/widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.bgWhite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            children: [
              CustomText(
                key: Key("page_title"),
                text: StringConfig.text.settings,
                weight: FontWeight.bold,
                size: 24,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.verticalHeightScaled / 2,
          ),
          CircleAvatar(
            key: Key("profile_pic"),
            radius: 30,
            backgroundImage: AssetImage(AppImageAssets.sample_user),
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          CustomText(
            key: Key("profile_name"),
            text: "Johnny Drille",
            weight: FontWeight.bold,
            size: 16,
          ),
          SizedBox(
            height: 20,
          ),
          SettingsItem(
            key: Key("general_info_item"),
            icon: Icon(Icons.person_outline),
            onTap: () {
              Get.to(ProfileScreen());
            },
            title: "General information",
          ),
          SettingsItem(
            key: Key("security_item"),
            icon: Icon(Icons.lock_outline),
            onTap: () {
              Get.to(SecurityScreen());
            },
            title: "Security",
          ),
          SettingsItem(
            key: Key("notification_item"),
            icon: Icon(Icons.notifications_active_outlined),
            onTap: () {
              Get.to(NotificationSettingsScreen());
            },
            title: "Notification",
          )
        ],
      ),
    );
  }
}
