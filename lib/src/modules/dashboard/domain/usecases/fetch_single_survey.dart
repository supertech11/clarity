import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/core/usecases/usecase.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';

import '../../../../core/error/failure.dart';

class FetchSingleSurvey with UseCases<Either<Failure, Survey>, String> {
  final SurveyRepository repository;

  FetchSingleSurvey(this.repository);

  @override
  Future<Either<Failure, Survey>?>? call(
    String surveyId,
  ) async {
    return await repository.fetchSingleSurvey(surveyId);
  }
}
