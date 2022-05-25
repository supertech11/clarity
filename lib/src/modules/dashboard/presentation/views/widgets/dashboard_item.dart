import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image, icon;
  final Color bgColor;
  final Color titleColor;
  DashboardItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.bgColor,
    required this.titleColor,
    required this.image,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            height: 45,
            width: 45,
            key: Key("icon"),
          ),
          SizedBox(
            height: 150,
          ),
          CustomText(
            text: title,
            key: Key("title"),
            size: SizeConfig.mediumTextSize,
            color: titleColor,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            key: Key("subtitle"),
            text: subTitle,
            color: titleColor,
          ),
        ],
      ),
    );
  }
}
