import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  SettingsItem(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          onTap: onTap,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffEDEAFA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: icon),
          ),
          title: CustomText(
            text: title,
            weight: FontWeight.w500,
            size: 14,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
    );
  }
}
