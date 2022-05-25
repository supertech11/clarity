import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_response_card.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_response_top_bar.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

class DisplaySurveyResponseScreen extends StatefulWidget {
  DisplaySurveyResponseScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DisplaySurveyResponseScreenState createState() =>
      _DisplaySurveyResponseScreenState();
}

class _DisplaySurveyResponseScreenState
    extends State<DisplaySurveyResponseScreen> {
  SurveyModel? survey;
  SurveyController surveyController = Get.find();
  LoginController loginController = Get.find();
  bool isInit = true;

  late Timer t;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInit) {
      t = Timer(Duration.zero, () async {
        final args = ModalRoute.of(context)!.settings.arguments
            as Map<String, SurveyModel>;
        survey = args["survey"];
        try {
          await surveyController.fetchSurveyResponse(survey!.id.toString());
        } catch (err) {}

        setState(() {
          isInit = false;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (t.isActive) {
      t.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: Container(
        color: Pallet.bgWhite,
        child: surveyController.isLoadingSingleSurvey.value
            ? Center(
                child: CircularProgressIndicator(
                  key: Key("loader"),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SurveyResponseTopBar(
                        key: Key("tob_bar"),
                        survey: survey,
                        loginController: loginController,
                        surveyController: surveyController),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        key: Key("response_view"),
                        itemBuilder: (ctx, index) {
                          return SurveyResponseCard(
                            item: surveyController
                                .surveyResponse!.answers![index],
                          );
                        },
                        itemCount:
                            surveyController.surveyResponse!.answers!.length,
                      ),
                    )
                  ],
                ),
              ),
      )),
    );
  }
}
