import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/core/utils/appalertdialog.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/survey_model.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/survey_controller.dart';

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RenderSurvey extends StatefulWidget {
  RenderSurvey({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RenderSurveyState createState() => _RenderSurveyState();
}

class _RenderSurveyState extends State<RenderSurvey> {
  WebViewController? _webViewController;
  String filePath = 'assets/html/saffron_nlm.html';
  bool isLoading = false;
  SurveyController surveyController = Get.find();
  SurveyModel? survey;
  DashboardNavigationController navigationController = Get.find();
  MenuController menuController = Get.find();
  double opacity = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, SurveyModel>;
    survey = args["survey"];
    return Scaffold(
      body: Container(
        color: Pallet.bgWhite,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  key: Key("logo"),
                  child: clarityLogoText(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        key: Key("back_button"),
                        child: Icon(
                          Icons.arrow_back,
                          color: Pallet.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(
                        text: "Survey",
                        key: Key("title"),
                        weight: FontWeight.bold,
                        size: 18,
                        // color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Opacity(
                    opacity: opacity,
                    child: WebView(
                      initialUrl: '',
                      key: Key("webview"),
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (val) async {
                        var uri = Uri.dataFromString(val);
                        print("host : " + uri.data.toString());
                        if (uri.data!.contentText
                            .toString()
                            .startsWith("https://www.codexworld.com")) {
                          await clearResponse();
                        }
                      },
                      onPageStarted: (val) async {
                        // print(val);
                        var uri = Uri.dataFromString(val);
                        print("host : " + uri.data.toString());
                        print("tobi1");
                        if (uri.data!.contentText
                            .toString()
                            .startsWith("https://www.codexworld.com")) {
                          print("tobi2");
                          setState(() {
                            opacity = 0;
                          });
                          AppAlertDialog.showCustomDialog(
                              context, "Saving Response");
                          //converts string to a uri

                          // var logger = Logger();

                          try {
                            Map<String, String> params = uri
                                .queryParameters; // query parameters automatically populated
                            var param1 = params['acc'];
                            param1 = Uri.decodeComponent(param1!);
                            var retValue = param1.replaceAll("\\", '');

                            Map valueMap = json.decode(retValue);
                            valueMap["questionnaire"] =
                                "Questionnaire/${survey!.questionnaire!}";
                            valueMap["source"] = {
                              "reference": "Patient/${survey!.user!}"
                            };
                            print("tobi4");
                            valueMap["identifier"] = {
                              "use": "official",
                              "value": "${survey!.id!}"
                            };
                            print("tobi5");

                            dynamic data = {
                              "questionnaire": survey!.id!.toString(),
                              "response": valueMap,
                            };
                            dynamic convertedValue = json.encode(data);
                            print("tobi");
                            print("$convertedValue");
                            await surveyController.submitSurveyResponse(
                                surveyId: survey!.id!.toString(),
                                surveyResponse: convertedValue);
                            // Get.offNamedUntil(DashboardModule.dashboardScreen.name,
                            //     (route) => false);
                            Get.back(closeOverlays: true);
                            Get.back();
                            menuController.activeItem.value =
                                RouteConstants.surveyPageRoute;
                            navigationController
                                .navigateTo(RouteConstants.surveyPageRoute);
                            UtilFunctions.displaySuccessBox("Success",
                                "Survey response recorded successfully");
                          } catch (err) {
                            Get.offNamedUntil(
                                DashboardModule.dashboardScreen.name,
                                (route) => false);
                            UtilFunctions.displayErrorBox(err.toString());
                          }
                        }
                      },
                      onWebViewCreated:
                          (WebViewController webViewController) async {
                        _webViewController = webViewController;
                        setState(() {
                          isLoading = true;
                          print(isLoading);
                        });
                        await _loadHtmlFromAsset(survey!.questionnaire!);
                        setState(() {
                          isLoading = false;
                          print(isLoading);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            isLoading
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  _loadHtmlFromAsset(String surveyId) async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    dynamic survey = await surveyController.fetchSingleSurvey(surveyId);
    String sample = json.encode(survey);
    fileHtmlContents = fileHtmlContents.replaceFirst("codecdec", '''$sample''');
    await _webViewController!.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
    await Future.delayed(Duration(seconds: 5));
  }

  Future<void>? clearResponse() async {
    await _webViewController!
        .evaluateJavascript("window.document.body.innerText");
    await _webViewController!
        .evaluateJavascript("window.document.body.innerText = ''");
  }
}
