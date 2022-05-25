import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/usecases/fetch_single_survey.dart';

class MockSurveyRepository extends Mock implements SurveyRepository {}

void main() {
  late FetchSingleSurvey usecase;
  late MockSurveyRepository mockSurveyRepository;

  setUp(() {
    mockSurveyRepository = MockSurveyRepository();
    usecase = FetchSingleSurvey(mockSurveyRepository);
  });

  final surveyId = "1";
  final sampleSurvey =
      Survey(id: 1, attempted: true, seen: true, questionnaire: "1", user: "1");

  test(
    'should get a single survey from the repository when called with a valid survey id',
    () async {
      when(mockSurveyRepository.fetchSingleSurvey(surveyId))
          .thenAnswer((_) async => Right(sampleSurvey));
      final result = await usecase(surveyId);
      expect(result, Right(sampleSurvey));
      // Verify that the method has been called on the Repository
      verify(mockSurveyRepository.fetchSingleSurvey(surveyId));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockSurveyRepository);
    },
  );
}
