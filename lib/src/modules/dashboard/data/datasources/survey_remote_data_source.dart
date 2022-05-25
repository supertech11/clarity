import 'package:saffron_clarity/src/core/services/network_connect.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';

abstract class SurveyRemoteDataSource {
  Future<SurveyModel>? fetchSingleSurvey(String surveyId);
  Future<List<SurveyModel>>? fetchSurveys(String userId);
  Future<dynamic> fetchSurveyResponse(String identifier);
  Future<void> submitSurveyResponse(dynamic surveyResponse);
}

class SurveyRemoteDataSourceImpl implements SurveyRemoteDataSource {
  final NetworkConnect client;

  SurveyRemoteDataSourceImpl({required this.client});

  @override
  Future<SurveyModel>? fetchSingleSurvey(String surveyId) async {
    final response = await client.getCall(
      '/questionnaire/$surveyId',
    );
    print(response);
    return SurveyModel.fromJson(response!);
  }

  @override
  Future<dynamic> fetchSurveyResponse(String identifier) async {
    final response = await client.getCall(
      '/fhir/QuestionnaireResponse?identifier=$identifier',
    );
    print(response);
    return response;
  }

  @override
  Future<List<SurveyModel>>? fetchSurveys(String userId) async {
    final response = await client.getCall(
      '/user-questionnaire/$userId',
    );
    print(response);
    List<SurveyModel> userSurveys = [];
    List<dynamic> extractedSurveys = response!["data"];
    extractedSurveys.forEach((s) {
      print(s);
      SurveyModel newSurvey = SurveyModel.fromJson(s);
      userSurveys.add(newSurvey);
    });
    return userSurveys;
  }

  @override
  Future<void> submitSurveyResponse(surveyResponse) async {
    final response =
        await client.postCall('/questionnaire-response', body: surveyResponse);
    print(response);
  }
}
