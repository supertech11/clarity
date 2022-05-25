import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';

class SurveyAnswerWidget extends StatelessWidget {
  final String? answer;
  SurveyAnswerWidget({
    Key? key,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          CircleAvatar(
            key: Key("bullet"),
            radius: 5,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomText(
              text: "$answer",
              key: Key("answer"),
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
