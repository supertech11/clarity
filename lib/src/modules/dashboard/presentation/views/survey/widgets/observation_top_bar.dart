import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';

class ObservationTopBar extends StatelessWidget {
  const ObservationTopBar({
    Key? key,
    required this.surveyController,
  }) : super(key: key);

  final SurveyController surveyController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: "Observation Details",
          key: Key("observation_details"),
          weight: FontWeight.bold,
          size: 24,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            CustomText(
              text: "Total Observations : ",
              key: Key("total"),
            ),
            SizedBox(
              width: 10,
            ),
            CustomText(
              text:
                  "${surveyController.surveyObservations!.length} Observations",
              weight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          key: Key("divider"),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
