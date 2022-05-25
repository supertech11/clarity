import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';

class CircularImageWithName extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double? radius;
  final double? padding;
  final Color? backgroundColor;
  const CircularImageWithName(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.radius,
      this.backgroundColor,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 18,
      backgroundColor: backgroundColor ?? Pallet.primaryDark,
      child: Center(
        child: CustomText(
          text:
              "${UtilFunctions.getFirstCharacter(firstName).toUpperCase()}${UtilFunctions.getFirstCharacter(lastName).toUpperCase()}",
          color: Pallet.white,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
