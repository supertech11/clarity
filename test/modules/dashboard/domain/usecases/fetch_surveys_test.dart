import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/respositories/survey_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/modules/dashboard/domain/usecases/fetch_surveys.dart';

class MockSurveyRepository extends Mock implements SurveyRepository {}

void main() {
  late FetchSurveys usecase;
  late MockSurveyRepository mockSurveyRepository;

  setUp(() {
    mockSurveyRepository = MockSurveyRepository();
    usecase = FetchSurveys(mockSurveyRepository);
  });

  final userId = "1";
  final sampleSurvey =
      Survey(id: 1, attempted: true, seen: true, questionnaire: "1", user: "1");
  final surveys = [sampleSurvey];

  test(
    'should get a list of surveys from the repository when called with a valid user id',
    () async {
      when(mockSurveyRepository.fetchSurveys(userId))
          .thenAnswer((_) async => Right(surveys));
      final result = await usecase(userId);
      expect(result, Right(surveys));
      // Verify that the method has been called on the Repository
      verify(mockSurveyRepository.fetchSurveys(userId));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockSurveyRepository);
    },
  );
}
