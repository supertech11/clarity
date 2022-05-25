import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/exceptions/api_request_failed.dart';
import 'package:saffron_clarity/src/core/services/network_connect.dart';

import 'package:saffron_clarity/src/modules/dashboard/data/models/item_answer.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/questionnaire_response.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:fhir/r4.dart' as fhir;

class SurveyController extends GetxController {
  NetworkConnect client = Get.find();
  List<SurveyModel> userSurveys = [];
  final isLoadingSurveys = true.obs;
  final isLoadingSingleSurvey = true.obs;
  final isLoadingObservation = false.obs;
  QuestionnaireResponse? surveyResponse;
  List<fhir.Observation>? surveyObservations = [];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchSurveys(String userId) async {
    isLoadingSurveys.value = true;
    userSurveys.clear();
    try {
      dynamic response = await client.getCall("/user-questionnaire/$userId");

      List<dynamic> extractedSurveys = response["data"];
      extractedSurveys.forEach((s) {
        print(s);
        SurveyModel newSurvey = SurveyModel.fromJson(s);

        userSurveys.add(newSurvey);
      });
      isLoadingSurveys.value = false;
    } on ApiRequestFailed catch (_) {
      rethrow;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> fetchSingleSurvey(String surveyId) async {
    isLoadingSingleSurvey.value = true;
    try {
      dynamic response = await client.getCall("/questionnaire/$surveyId");
      var resData = jsonDecode(response.toString());

      isLoadingSingleSurvey.value = false;
      return resData["data"];
    } on ApiRequestFailed catch (_) {
      rethrow;
    } catch (error) {
      throw error;
    }
  }

  // Future<void> fetchSurveyResponse(
  //     String patientId, String questionnaireId) async {
  //   isLoadingSingleSurvey.value = true;
  //   try {
  //     surveyResponse = null;
  //     Map<String, dynamic> decodedToken = {};
  //     // dynamic response = await networkUtils.dioGetRequest(
  //     //     "http://165.227.86.45:9080/fhir/QuestionnaireResponse?identifier=$identifier",
  //     //     Options(contentType: "application/json"),
  //     //     includeBaseurl: false);
  //     // dynamic response = await networkUtils.dioGetRequest(
  //     //     "http://165.227.86.45:9080/fhir/QuestionnaireResponse?patient=$patientId&questionnaire=$questionnaireId",
  //     //     Options(contentType: "application/json"),
  //     //     includeBaseurl: false);
  //     dynamic response = await networkUtils.dioGetRequest(
  //         "http://165.227.86.45:9080/fhir/QuestionnaireResponse?identifier=$patientId",
  //         Options(contentType: "application/json"),
  //         includeBaseurl: false);

  //     var resData = jsonDecode(response.toString());
  //     print(response.toString());

  //     if (response.statusCode != 200) {
  //       throw HttpException(resData["message"]);
  //     }

  //     isLoadingSingleSurvey.value = false;

  //     fhir.Bundle bd = fhir.Bundle.fromJson(resData["data"]);
  //     if (bd.entry == null || bd.entry!.isEmpty) {
  //       throw "No record found";
  //     } else {
  //       print(bd.entry!.last.toString());
  //       Map data = bd.entry!.last.toJson();
  //       print("kola" + data["resource"]["item"]![0].toString());

  //       List<dynamic> extractedAnswers = [];
  //       List<dynamic> extractedContent;
  //       List<ItemAnswer> answers = [];
  //       dynamic extractedTitle = "";
  //       // resData["data"]["entry"][0]["resource"]["item"]![0]["text"];
  //       if (data["resource"]["item"]![0]["item"] != null) {
  //         if (data["resource"]["item"]![0]["item"]![0]["item"] != null) {
  //           extractedContent = data["resource"]["item"]![0]["item"]!;
  //           extractedContent.forEach((element) {
  //             extractedAnswers.add(element["item"]);
  //           });
  //         } else {
  //           extractedContent = data["resource"]["item"]!;
  //           extractedContent.forEach((element) {
  //             extractedAnswers.add(element["item"]);
  //           });
  //         }
  //       } else {
  //         extractedContent = data["resource"]["item"]!;
  //         extractedContent.forEach((element) {
  //           extractedAnswers.add(element);
  //         });
  //       }

  //       print("got1");
  //       extractedAnswers.forEach((p) {
  //         print(p);
  //         ItemAnswer answer = ItemAnswer.fromJson(p);

  //         answers.add(answer);
  //       });
  //       print("got2");
  //       surveyResponse = QuestionnaireResponse(
  //           answers: answers,
  //           title: extractedTitle,
  //           id: data["resource"]["id"]);
  //       print("got3");
  //     }

  //     // FhirBundle fhirQRBundle = FhirBundle.fromJson(resData);
  //     // print("bolu" + fhirQRBundle.data!.entry![0].toString());
  //     // if (fhirQRBundle.data == null ||
  //     //     fhirQRBundle.data!.entry == null ||
  //     //     fhirQRBundle.data!.entry!.isEmpty) {
  //     //   throw "No record found";
  //     // } else {
  //     //   print(fhirQRBundle.data!.entry!.last.toString());
  //     //   Map data = fhirQRBundle.data!.entry!.last.toJson();
  //     //   print("kola" + data["resource"]["item"]![0].toString());

  //     //   List<dynamic> extractedAnswers = [];
  //     //   List<dynamic> extractedContent;
  //     //   List<ItemAnswer> answers = [];
  //     //   dynamic extractedTitle = "";
  //     //   // resData["data"]["entry"][0]["resource"]["item"]![0]["text"];
  //     //   if (data["resource"]["item"]![0]["item"] != null) {
  //     //     if (data["resource"]["item"]![0]["item"]![0]["item"] != null) {
  //     //       extractedContent = data["resource"]["item"]![0]["item"]!;
  //     //       extractedContent.forEach((element) {
  //     //         extractedAnswers.add(element["item"]);
  //     //       });
  //     //     } else {
  //     //       extractedContent = data["resource"]["item"]!;
  //     //       extractedContent.forEach((element) {
  //     //         extractedAnswers.add(element["item"]);
  //     //       });
  //     //     }
  //     //   } else {
  //     //     extractedContent = data["resource"]["item"]!;
  //     //     extractedContent.forEach((element) {
  //     //       extractedAnswers.add(element);
  //     //     });
  //     //   }

  //     //   print("got1");
  //     //   extractedAnswers.forEach((p) {
  //     //     print(p);
  //     //     ItemAnswer answer = ItemAnswer.fromJson(p);

  //     //     answers.add(answer);
  //     //   });
  //     //   print("got2");
  //     //   surveyResponse = QuestionnaireResponse(
  //     //       answers: answers,
  //     //       title: extractedTitle,
  //     //       id: data["resource"]["id"]);
  //     //   print("got3");
  //     //}
  //   } on DioError catch (error) {
  //     var resData;
  //     try {
  //       resData = jsonDecode(error.response.toString());
  //       throw HttpException(resData["message"]);
  //     } on HttpException catch (error) {
  //       throw (error);
  //     } catch (error) {
  //       print(error);
  //       throw ("An error occured, try again later");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  Future<void> fetchSurveyResponse(String identifier) async {
    isLoadingSingleSurvey.value = true;
    try {
      surveyResponse = null;

      dynamic response = await client
          .getCall("/fhir/QuestionnaireResponse?identifier=$identifier");

      isLoadingSingleSurvey.value = false;

      List<dynamic> extractedAnswers = [];
      List<dynamic> extractedContent;
      List<ItemAnswer> answers = [];
      dynamic extractedTitle =
          response["data"]["entry"][0]["resource"]["item"]![0]["text"];
      if (response["data"]["entry"][0]["resource"]["item"]![0]["item"] !=
          null) {
        if (response["data"]["entry"][0]["resource"]["item"]![0]["item"]![0]
                ["item"] !=
            null) {
          extractedContent =
              response["data"]["entry"][0]["resource"]["item"]![0]["item"]!;

          extractedContent.forEach((element) {
            extractedAnswers.addAll(element["item"]);
          });
        } else {
          extractedContent = response["data"]["entry"][0]["resource"]["item"]!;
          extractedContent.forEach((element) {
            extractedAnswers.addAll(element["item"]);
          });
        }
      } else {
        extractedContent = response["data"]["entry"];
        extractedContent.forEach((element) {
          extractedAnswers.addAll(element["resource"]["item"]);
        });
      }

      extractedAnswers.forEach((p) {
        print(p);
        ItemAnswer answer = ItemAnswer.fromJson(p);

        answers.add(answer);
      });
      surveyResponse =
          QuestionnaireResponse(answers: answers, title: extractedTitle);
    } on ApiRequestFailed catch (_) {
      rethrow;
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchObservation(String patientId, qrId) async {
    isLoadingObservation.value = true;
    try {
      surveyObservations = [];

      dynamic response = await client.getCall(
          "/fhir/Observation?patient=af0278c6-fafa-47c3-99aa-df693da905e0&derived-from=QuestionnaireResponse/b96295c1-77c1-460e-9e41-c61bdcf0a664");
      // dynamic response = await networkUtils.dioGetRequest(
      //     "http://165.227.86.45:9080/fhir/Observation?patient=$patientId&derived-from=QuestionnaireResponse/$qrId",
      //     Options(contentType: "application/json"),
      //     includeBaseurl: false);

      isLoadingSingleSurvey.value = false;

      fhir.Bundle bundle = fhir.Bundle.fromJson(response["data"]);
      if (bundle.entry == null || bundle.entry!.isEmpty) {
        throw "No observation found";
      } else {
        bundle.entry!.forEach((element) {
          fhir.Observation observation =
              fhir.Observation.fromJson(element.resource!.toJson());
          surveyObservations!.add(observation);
          // FhirObservation fhirObservation =
          //     FhirObservation.fromJson(element.toJson());
          // surveyObservations!.add(fhirObservation);
        });
        print(surveyObservations!.length);
      }

      // FhirBundle fhirObBundle = FhirBundle.fromJson(resData);

      // if (fhirObBundle.data == null ||
      //     fhirObBundle.data!.entry == null ||
      //     fhirObBundle.data!.entry!.isEmpty) {
      //   throw "No observation found";
      // } else {
      //   fhirObBundle.data!.entry!.forEach((element) {
      //     FhirObservation fhirObservation =
      //         FhirObservation.fromJson(element.toJson());
      //     surveyObservations!.add(fhirObservation);
      //   });
      //   print(surveyObservations!.length);
      // }
      isLoadingObservation.value = false;
    } on ApiRequestFailed catch (_) {
      rethrow;
    } catch (error) {
      throw error;
    }
  }

  Future<void> submitSurveyResponse(
      {String? surveyId, dynamic surveyResponse}) async {
    // var data = {
    //   "questionnaire": surveyId,
    //   "response": surveyResponse,
    // };
    debugPrint(surveyResponse.toString(), wrapWidth: 1024);
    try {
      await client.getCall(
        "/questionnaire-response",
      );
    } on ApiRequestFailed catch (_) {
      rethrow;
    } catch (error) {
      throw error;
    }
  }

  // Future<void> getSurveys(String userId) async {
  //   isLoadingSurveys.value = true;
  //   userSurveys.clear();

  //   final result = await fetchSurveys("30");
  //   result!.fold((l) {
  //      print(l.toString());
  //   }, (r) async {
  //     profilePicture.value = r;
  //     await cache.saveUserProfilePictureUrl(r.avatarUrl);
  //   });

  //   try {
  //     Map<String, dynamic> decodedToken = {};
  //     dynamic response = await networkUtils.dioGetRequest(
  //         "http://165.227.86.45:9080/user-questionnaire/$userId",
  //         Options(contentType: "application/json"),
  //         includeBaseurl: false);
  //     var resData = jsonDecode(response.toString());
  //     print(response.toString());

  //     if (response.statusCode != 200) {
  //       throw HttpException(resData["message"]);
  //     }

  //     List<dynamic> extractedSurveys = resData["data"];
  //     extractedSurveys.forEach((s) {
  //       print(s);
  //       SurveyModel newSurvey = SurveyModel.fromJson(s);
  //       userSurveys.add(newSurvey);
  //     });
  //     isLoadingSurveys.value = false;
  //   } on DioError catch (error) {
  //     var resData;
  //     try {
  //       resData = jsonDecode(error.response.toString());
  //       throw HttpException(resData["message"]);
  //     } on HttpException catch (error) {
  //       throw (error);
  //     } catch (error) {
  //       print(error);
  //       throw ("An error occured, try again later");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  // Future<dynamic> getSingleSurvey(String surveyId) async {
  //   isLoadingSingleSurvey.value = true;
  //   try {
  //     Map<String, dynamic> decodedToken = {};
  //     dynamic response = await networkUtils.dioGetRequest(
  //         "http://165.227.86.45:9080/questionnaire/$surveyId",
  //         Options(contentType: "application/json"),
  //         includeBaseurl: false);
  //     var resData = jsonDecode(response.toString());
  //     print(response.toString());

  //     if (response.statusCode != 200) {
  //       throw HttpException(resData["message"]);
  //     }

  //     isLoadingSingleSurvey.value = false;
  //     return resData["data"];
  //   } on DioError catch (error) {
  //     var resData;
  //     try {
  //       resData = jsonDecode(error.response.toString());
  //       throw HttpException(resData["message"]);
  //     } on HttpException catch (error) {
  //       throw (error);
  //     } catch (error) {
  //       print(error);
  //       throw ("An error occured, try again later");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  // Future<void> getSurveyResponse(String identifier) async {
  //   isLoadingSingleSurvey.value = true;
  //   try {
  //     surveyResponse = null;
  //     Map<String, dynamic> decodedToken = {};
  //     dynamic response = await networkUtils.dioGetRequest(
  //         "http://165.227.86.45:9080/fhir/QuestionnaireResponse?identifier=$identifier",
  //         Options(contentType: "application/json"),
  //         includeBaseurl: false);
  //     var resData = jsonDecode(response.toString());
  //     print(response.toString());

  //     if (response.statusCode != 200) {
  //       throw HttpException(resData["message"]);
  //     }

  //     isLoadingSingleSurvey.value = false;
  //     surveyResponse = resData["data"]["entry"][0];
  //   } on DioError catch (error) {
  //     var resData;
  //     try {
  //       resData = jsonDecode(error.response.toString());
  //       throw HttpException(resData["message"]);
  //     } on HttpException catch (error) {
  //       throw (error);
  //     } catch (error) {
  //       print(error);
  //       throw ("An error occured, try again later");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  // Future<void> postSurveyResponse(
  //     {String? surveyId, dynamic surveyResponse}) async {
  //   // var data = {
  //   //   "questionnaire": surveyId,
  //   //   "response": surveyResponse,
  //   // };
  //   debugPrint(surveyResponse.toString(), wrapWidth: 1024);
  //   try {
  //     dynamic response = await networkUtils.dioPostRequest(
  //         "http://165.227.86.45:9080/questionnaire-response",
  //         surveyResponse,
  //         Options(contentType: "application/json"),
  //         includeBaseurl: false);
  //     var resData = jsonDecode(response.toString());
  //     print(response.toString());

  //     if (response.statusCode != 201) {
  //       throw HttpException(resData["message"]);
  //     }
  //   } on DioError catch (error) {
  //     var resData;
  //     try {
  //       resData = jsonDecode(error.response.toString());
  //       throw HttpException(resData["message"]);
  //     } on HttpException catch (error) {
  //       throw (error);
  //     } catch (error) {
  //       print(error);
  //       throw ("An error occured, try again later");
  //     }
  //   } catch (error) {
  //     throw (error);
  //   }
  // }
}
