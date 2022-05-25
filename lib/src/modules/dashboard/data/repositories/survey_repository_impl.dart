import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/core/error/api_request_failure.dart';
import 'package:saffron_clarity/src/core/services/api_interceptor.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/datasources/survey_remote_data_source.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';

class SurveyRepositoryImpl implements SurveyRepository {
  final SurveyRemoteDataSource remoteDataSource;

  SurveyRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<ApiRequestFailure, Survey>>? fetchSingleSurvey(
      String surveyId) async {
    return apiInterceptor(
      () => remoteDataSource.fetchSingleSurvey(surveyId),
    );
  }

  @override
  Future<Either<ApiRequestFailure, dynamic>> fetchSurveyResponse(
      String identifier) {
    return apiInterceptor(
      () => remoteDataSource.fetchSurveyResponse(identifier),
    );
  }

  @override
  Future<Either<ApiRequestFailure, List<Survey>>> fetchSurveys(String userId) {
    return apiInterceptor(
      () => remoteDataSource.fetchSurveys(userId),
    );
  }

  @override
  Future<Either<ApiRequestFailure, void>> submitSurveyResponse(surveyResponse) {
    return apiInterceptor(
      () => remoteDataSource.submitSurveyResponse(surveyResponse),
    );
  }
}
