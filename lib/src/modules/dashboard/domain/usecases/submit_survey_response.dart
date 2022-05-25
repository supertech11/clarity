import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/core/usecases/usecase.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';

import '../../../../core/error/failure.dart';

class SubmitSurveyResponse with UseCases<Either<Failure, void>, String> {
  final SurveyRepository repository;

  SubmitSurveyResponse(this.repository);

  @override
  Future<Either<Failure, void>?>? call(
    dynamic surveyResponse,
  ) async {
    return await repository.submitSurveyResponse(surveyResponse);
  }
}
