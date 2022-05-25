import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/circular_avatar_with_name.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';

class SurveyMobileCard extends StatelessWidget {
  final SurveyModel survey;
  final VoidCallback? onSurveyCardTap;
  const SurveyMobileCard(
      {Key? key, required this.survey, required this.onSurveyCardTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSurveyCardTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          color: Pallet.white,
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: survey.title ?? '',
                  key: Key("title"),
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircularImageWithName(
                          key: Key("practitioner_picture"),
                          radius: 16,
                          firstName: UtilFunctions.getNameInitials(
                            survey.practitioner ?? "",
                            0,
                          ),
                          lastName: UtilFunctions.getNameInitials(
                            survey.practitioner ?? "",
                            1,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: survey.practitioner ?? '',
                          key: Key("practitioner_name"),
                          color: Pallet
                              .blackNeutral, //Color(0xff666666), // Pallet.blackNeutral,
                        ),
                      ],
                    ),
                    Image.asset(
                      survey.attempted!
                          ? AppImageAssets.survey_accept_icon
                          : AppImageAssets.survey_open_icon,
                      width: 33,
                      height: 30,
                      key: Key("indicator_icon"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      key: Key("noOfQuestions"),
                      text: "${survey.numberOfQuestionnaire} question(s)",
                      color: Pallet.blackNeutral,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      key: Key("question_indicator"),
                      radius: 3,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      key: Key("created_at"),
                      text: UtilFunctions.parseDate(survey.createdAt),
                      //"${survey.created_at != null ? survey.created_at!.substring(0, 10) : ''}",
                      color: Pallet.blackNeutral,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
