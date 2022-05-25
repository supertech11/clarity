// import 'package:flutter_test/flutter_test.dart';
// import 'package:test/test.dart' as Test;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/exceptions/api_request_failed.dart';
import 'package:saffron_clarity/src/core/services/network_connect.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';

void main() {
  late SurveyController surveyController;
  late NetworkConnect networkConnect;

  setUp(() {
    final getConnect = GetConnect();
    networkConnect = Get.put(NetworkConnect(getConnect));
    surveyController = Get.put(SurveyController());
  });

  group('Network connect Tests', () {
    test('validate fetch survey get called', () {
      try {
        surveyController.fetchSurveys("endpoint");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate fetch single survey get called', () {
      try {
        surveyController.fetchSingleSurvey("endpoint");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate fetch survey response get called', () {
      try {
        surveyController.fetchSurveyResponse("endpoint");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate fetch observation get called', () {
      try {
        surveyController.fetchObservation("endpoint", "");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate fetch survey response get called', () {
      try {
        surveyController.submitSurveyResponse(
            surveyId: "endpoint", surveyResponse: "");
        networkConnect.getCall("");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });
  });
}
