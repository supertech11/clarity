import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';

class CustomOutlineButton extends StatelessWidget {
  final Key key;
  final bool isLoading, isCenteredContent;
  final String label;
  final Color labelColor, buttonColor;
  final double radius, height;
  final Widget prefixIcon, suffixIcon;

  final VoidCallback? onPressed;

  CustomOutlineButton(
      {required this.label,
      required this.key,
      this.labelColor = Pallet.black,
      this.buttonColor = Pallet.white,
      this.radius = 8,
      this.height = 50,
      this.isCenteredContent = false,
      this.prefixIcon = const SizedBox(
        width: 5,
      ),
      this.suffixIcon = const SizedBox(
        width: 5,
      ),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
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
              : isCenteredContent
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: prefixIcon,
                          constraints:
                              BoxConstraints(maxWidth: 25, minHeight: 25),
                        ),
                        SizedBox(width: 20),
                        CustomText(
                          text: label,
                          color: labelColor,
                          weight: FontWeight.w500,
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: isCenteredContent
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            child: prefixIcon,
                            constraints:
                                BoxConstraints(maxWidth: 25, minHeight: 25),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: CustomText(
                              text: label,
                              color: labelColor,
                              weight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    )),
    );
  }
}
