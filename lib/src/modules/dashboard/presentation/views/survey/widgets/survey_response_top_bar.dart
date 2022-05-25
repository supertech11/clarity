import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';
import 'package:get/get.dart';

class SurveyResponseTopBar extends StatelessWidget {
  const SurveyResponseTopBar({
    Key? key,
    required this.survey,
    required this.loginController,
    required this.surveyController,
  }) : super(key: key);

  final SurveyModel? survey;
  final LoginController loginController;
  final SurveyController surveyController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Container(key: Key("logo"), child: clarityLogoText()),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              key: Key("back_button"),
              child: Icon(
                Icons.arrow_back,
                color: Pallet.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            CustomText(
              key: Key("page_title"),
              text: "Survey Response",
              weight: FontWeight.bold,
              size: 18,
              // color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CustomText(
              key: Key("survey_title"),
              text: "Survey Title : ",
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomText(
                text: survey!.title ?? '',
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CustomText(
              key: Key("patient_info"),
              text: "Patient :",
              color: Pallet.blackNeutral,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: CustomText(
                text:
                    "${loginController.firstName} ${loginController.lastName}",
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CustomText(
              key: Key("questions_info"),
              text: "No of questions :",
              color: Pallet.blackNeutral,
            ),
            SizedBox(
              width: 5,
            ),
            CustomText(
              text:
                  "${surveyController.surveyResponse != null ? surveyController.surveyResponse!.answers!.length : ''}",
              weight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
