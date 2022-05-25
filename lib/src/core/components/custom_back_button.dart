import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: Key("back"),
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
      color: Pallet.black,
    );
  }
}
