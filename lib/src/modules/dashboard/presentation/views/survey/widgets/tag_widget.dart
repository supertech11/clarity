import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

class TagWidget extends StatelessWidget {
  final Color color;
  final String text;
  const TagWidget({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 60,
      padding: EdgeInsets.all(5),
      height: 28,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.3),
      ),
      child: CustomText(
        text: text,
        color: color,
      ),
    );
  }
}
