import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

class NotificationSettingsItem extends StatelessWidget {
  final String title, subtitle;
  const NotificationSettingsItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: CustomText(
            key: Key("title"),
            text: title,
            weight: FontWeight.w500,
            size: 14,
          ),
          contentPadding: EdgeInsets.zero,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Switch(
                value: false,
                onChanged: (value) {},
                key: Key("switch"),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomText(
              key: Key("subtitle"),
              text: subtitle,
              size: 14,
              color: Color(0xff898989),
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
