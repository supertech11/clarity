import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/search_survey_widget.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_table.dart';

class SurveyLargeScreen extends StatelessWidget {
  const SurveyLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          CustomText(
            text: StringConfig.text.survey,
            weight: FontWeight.bold,
            size: 24,
          ),
          SizedBox(
            height: SizeConfig.verticalHeightScaled / 2,
          ),
          SearchSurveyWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20),
              children: [SurveyTable()],
            ),
          )
        ],
      ),
    );
  }
}
