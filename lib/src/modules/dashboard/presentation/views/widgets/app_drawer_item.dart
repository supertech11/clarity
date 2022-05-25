import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:get/get.dart';

class AppDrawerItem extends StatelessWidget {
  final String? label;
  final String? routeName;
  final String? iconUrl;
  final VoidCallback? onTap;
  AppDrawerItem(
      {this.label, this.iconUrl, this.onTap, required this.routeName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuController menuController = Get.find();
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
            left: 0, right: SizeConfig.screenWidth * 0.34, bottom: 5),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: menuController.isActive(routeName!)
              ? Pallet.primaryDark
              : menuController.isHovering(routeName!)
                  ? Pallet.primaryDark.withOpacity(0.4)
                  : Colors.transparent,
        ),
        child: InkWell(
          onHover: (value) {
            value
                ? menuController.onHover(routeName!)
                : menuController.onHover("not hovering");
          },
          onTap: onTap,
          child: ListTile(
            leading: Image.asset(
              "$iconUrl",
              key: Key("icon_url"),
              width: 25,
              height: 25,
              color: Pallet.white,
            ),
            minLeadingWidth: 20,
            title: CustomText(
              key: Key("label"),
              text: "$label",
              color: Pallet.white,
            ),
          ),
        ),
      ),
    );
  }
}
