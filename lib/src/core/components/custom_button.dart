import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

class CustomButton extends StatelessWidget {
  final Key key;
  final bool isLoading;
  final String label;
  final Color labelColor, buttonColor;
  final double radius, height;
  final VoidCallback? onPressed;

  CustomButton(
      {required this.label,
      required this.key,
      this.labelColor = Colors.white,
      this.buttonColor = Pallet.primary,
      this.radius = 8,
      this.height = 50,
      this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    key: Key("loader"),
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white),
                  ),
                )
              : CustomText(
                  text: label,
                  color: labelColor,
                )),
    );
  }
}
