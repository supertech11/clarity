import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImageAssets.empty_data,
            width: 235,
            key: Key("illustrator"),
          ),
          SizedBox(
            height: 18,
          ),
          CustomText(
            text: "Uh-oh!",
            weight: FontWeight.bold,
            key: Key("title"),
          ),
          SizedBox(
            height: 18,
          ),
          CustomText(
            text: "We don’t seem to have any data to \ndispay here.",
            isCentered: true,
            key: Key("subtitle"),
          )
        ],
      ),
    );
  }
}
