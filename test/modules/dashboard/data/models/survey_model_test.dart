import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final surveyModel = SurveyModel(
      id: 21,
      attempted: true,
      seen: true,
      questionnaire: "6",
      user: "30",
      createdAt: "08-08-08",
      numberOfQuestionnaire: 8,
      title: "AHC",
      practitioner: "tosin");

  test(
    'should be a subclass of Survey entity',
    () async {
      // assert
      expect(surveyModel, isA<Survey>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('survey.json'));
        print(jsonMap);
        // act
        final result = SurveyModel.fromJson(jsonMap);
        // assert
        expect(result, surveyModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = surveyModel.toJson();
        // assert
        final expectedMap = {
          "id": 21,
          "user": "30",
          "questionnaire": "6",
          "seen": true,
          "attempted": true,
          'created_at': '08-08-08',
          'number_of_questionnaire': 8,
          'title': 'AHC',
          'practitioner': 'tosin'
        };
        expect(result, expectedMap);
      },
    );
  });
}
