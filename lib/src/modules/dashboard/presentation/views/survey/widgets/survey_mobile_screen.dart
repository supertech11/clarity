import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/empty_state_widget.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_mobile_card.dart';
import 'package:get/get.dart';

class SurveyMobileScreen extends StatelessWidget {
  final bool isLoading;
  final List<SurveyModel> surveys;
  final SurveyController surveyController = Get.find();
  SurveyMobileScreen({
    Key? key,
    this.isLoading = true,
    required this.surveys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.bgWhite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          CustomText(
            text: "Surveys", //StringConfig.text.survey,
            weight: FontWeight.bold,
            size: 16,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextFormField(
                  key: Key("search"),
                  hintText: "Search",
                  icon: Icon(
                    Icons.search,
                    color: Pallet.blackNeutral,
                  ),
                ),
              ),
              Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.only(left: 15, bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Pallet.primaryDark),
                  child: Center(child: Image.asset(AppImageAssets.filter)))
            ],
          ),
          Expanded(
              child: Obx(
            () => surveyController.isLoadingSurveys.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : surveys.isEmpty
                    ? EmptyStateWidget()
                    : ListView.builder(
                        itemBuilder: (ctx, index) {
                          return SurveyMobileCard(
                            survey: surveys[index],
                            onSurveyCardTap: () {
                              if (surveys[index].attempted!) {
                                Get.toNamed(
                                    DashboardModule
                                        .displaysurveyresponseScreen.name,
                                    arguments: {"survey": surveys[index]});
                              } else {
                                Get.toNamed(
                                    DashboardModule.rendersurveyScreen.name,
                                    arguments: {"survey": surveys[index]});
                              }
                            },
                          );
                        },
                        itemCount: surveys.length,
                        padding: EdgeInsets.only(top: 20),
                      ),
          ))
        ],
      ),
    );
  }
}
