import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/circular_avatar_with_name.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';

class DrawerProfileTitleWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final bool isHorizontal;
  const DrawerProfileTitleWidget(
      {Key? key,
      required this.firstName,
      required this.lastName,
      this.isHorizontal = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                CircleAvatar(
                  key: Key("user_placeholder_horizontal"),
                  radius: 36.5,
                  backgroundColor: Color(0xffF5F5F5),
                  child: Image.asset(
                    AppImageAssets.user_placeholder,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularImageWithName(
                key: Key("user_placeholder_vertical"),
                radius: 36.5,
                firstName: UtilFunctions.getNameInitials(
                  firstName,
                  0,
                ),
                lastName: UtilFunctions.getNameInitials(
                  lastName,
                  1,
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                key: Key("name"),
                text:
                    "${UtilFunctions.capitalizeFirst(firstName)} ${UtilFunctions.capitalizeFirst(lastName)}",
                color: Pallet.white,
                weight: FontWeight.bold,
                size: 20,
              ),
            ],
          );
  }
}
