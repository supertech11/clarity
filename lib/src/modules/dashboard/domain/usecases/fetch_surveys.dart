import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/core/usecases/usecase.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';

import '../../../../core/error/failure.dart';

class FetchSurveys with UseCases<Either<Failure, List<Survey>>, String> {
  final SurveyRepository repository;

  FetchSurveys(this.repository);

  @override
  Future<Either<Failure, List<Survey>>?>? call(
    String userId,
  ) async {
    return await repository.fetchSurveys(userId);
  }
}
