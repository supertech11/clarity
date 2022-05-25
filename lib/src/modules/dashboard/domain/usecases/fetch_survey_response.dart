import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/core/usecases/usecase.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';

import '../../../../core/error/failure.dart';

class FetchSurveyResponse with UseCases<Either<Failure, dynamic>, String> {
  final SurveyRepository repository;

  FetchSurveyResponse(this.repository);

  @override
  Future<Either<Failure, dynamic>?>? call(
    String identifier,
  ) async {
    return await repository.fetchSurveyResponse(identifier);
  }
}
