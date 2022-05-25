import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

class DashedPaddedText extends StatelessWidget {
  final String text;
  const DashedPaddedText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          key: Key("left_dash"),
          width: 40,
          height: 1,
          color: Pallet.greyBorderColor,
          margin: EdgeInsets.all(10),
        ),
        CustomText(text: text),
        Container(
          key: Key("right_dash"),
          width: 40,
          height: 1,
          color: Pallet.greyBorderColor,
          margin: EdgeInsets.all(10),
        ),
      ],
    );
  }
}
