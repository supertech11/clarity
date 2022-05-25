import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

class ObservationValueWidget extends StatelessWidget {
  final String title, value;
  const ObservationValueWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            color: Pallet.blackNeutral,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: value,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
