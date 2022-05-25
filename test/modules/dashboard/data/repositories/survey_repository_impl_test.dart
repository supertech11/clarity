import 'package:get/get_connect.dart';
import 'package:saffron_clarity/src/core/error/api_request_failure.dart';
import 'package:saffron_clarity/src/core/exceptions/api_request_failed.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/datasources/survey_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:dartz/dartz.dart';

import 'package:saffron_clarity/src/modules/dashboard/data/repositories/survey_repository_impl.dart';

class MockRemoteDataSource extends Mock implements SurveyRemoteDataSource {}

void main() {
  late SurveyRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();

    repository = SurveyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  final surveyId = "1";
  final sampleSurveyModel = SurveyModel(
      id: 1, attempted: true, seen: true, questionnaire: "1", user: "1");
  final sampleSurvey = sampleSurveyModel;
  final errorResponse = Response(statusCode: 400);

  test(
    'should return remote data when the call to fetch single survey is successful',
    () async {
      // arrange
      when(mockRemoteDataSource.fetchSingleSurvey(surveyId))
          .thenAnswer((_) async => sampleSurveyModel);
      // act
      final result = await repository.fetchSingleSurvey(surveyId);
      // assert
      verify(mockRemoteDataSource.fetchSingleSurvey(surveyId));
      expect(result, equals(Right(sampleSurvey)));
    },
  );

  test(
    'should return api request failure when the call to fetch single survey is unsuccessful',
    () async {
      // arrange
      when(mockRemoteDataSource.fetchSingleSurvey(surveyId))
          .thenThrow(ApiRequestFailed(errorResponse));
      // act
      final result = await repository.fetchSingleSurvey(surveyId);
      // assert
      verify(mockRemoteDataSource.fetchSingleSurvey(surveyId));
      expect(result, equals(Left(ApiRequestFailure(errorResponse))));
    },
  );
}
