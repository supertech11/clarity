import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';

import '../../../../core/error/failure.dart';

abstract class SurveyRepository {
  Future<Either<Failure, List<Survey>>>? fetchSurveys(String userId);
  Future<Either<Failure, Survey>>? fetchSingleSurvey(String surveyId);
  Future<Either<Failure, dynamic>> fetchSurveyResponse(String identifier);
  Future<Either<Failure, void>> submitSurveyResponse(dynamic surveyResponse);
}
