import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';

import 'package:flutter/foundation.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_response_card.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_top_bar.dart';

class DisplaySurveyObservationScreen extends StatefulWidget {
  DisplaySurveyObservationScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DisplaySurveyObservationScreenState createState() =>
      _DisplaySurveyObservationScreenState();
}

class _DisplaySurveyObservationScreenState
    extends State<DisplaySurveyObservationScreen> {
  SurveyModel? survey;
  SurveyController surveyController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text(
              'Survey Observations',
              key: Key("page_title"),
            ),
            leading: IconButton(
              key: Key("back_button"),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            child: surveyController.isLoadingSingleSurvey.value
                ? Center(
                    key: Key("loader"),
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ObservationTopBar(
                                  key: Key("top_bar"),
                                  surveyController: surveyController),
                              Expanded(
                                child: ListView.builder(
                                  key: Key("responses"),
                                  itemBuilder: (ctx, index) {
                                    return ObservationResponseCard(
                                      observation: surveyController
                                          .surveyObservations![index],
                                    );
                                  },
                                  itemCount: surveyController
                                      .surveyObservations!.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          )),
    );
  }
}
