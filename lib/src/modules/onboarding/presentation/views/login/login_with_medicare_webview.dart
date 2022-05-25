import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/components/clarity_logo_text.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/core/utils/appalertdialog.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';
import 'package:saffron_clarity/src/modules/dashboard/dashboard_module.dart';

import 'package:flutter/foundation.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWithMedicareWebview extends StatefulWidget {
  LoginWithMedicareWebview({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginWithMedicareWebviewState createState() =>
      _LoginWithMedicareWebviewState();
}

class _LoginWithMedicareWebviewState extends State<LoginWithMedicareWebview> {
  late WebViewController _webViewController;
  bool isLoading = true;

  LoginController loginController = Get.find();

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(StringConfig.text.continueWithMedicare)),
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
                Container(
                  key: Key("clarityLogoText"),
                  padding: const EdgeInsets.only(left: 20.0),
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
                        key: Key("back"),
                        child: Icon(
                          Icons.arrow_back,
                          color: Pallet.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(
                        key: Key("title"),
                        text: StringConfig.text.continueWithMedicare,
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
                  child: WebView(
                    initialUrl: 'http://dev.saffronlabs.io/auth/mymedicare',
                    key: Key("webview"),
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (val) async {
                      var uri = Uri.dataFromString(val);

                      if (uri.data!.contentText.toString().startsWith(
                          "https://dev.saffronlabs.io/auth/mymedicare?code")) {
                        try {
                          dynamic response = await readResponse();
                          await loginController
                              .validateLoginWithMedicare(response);
                          Get.offAllNamed(DashboardModule.dashboardScreen.name);
                        } catch (error) {
                          Get.offNamedUntil(OnboardingModule.loginScreen.name,
                              (route) => false);
                          UtilFunctions.displayErrorBox(error.toString());
                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                      Get.back(closeOverlays: true);
                    },
                    onPageStarted: (val) async {
                      AppAlertDialog.showWhiteOverlayDialog(context);
                      setState(() {
                        isLoading = true;
                      });
                    },
                    onWebViewCreated:
                        (WebViewController webViewController) async {
                      _webViewController = webViewController;
                    },
                  ),
                ),
              ],
            ),
            isLoading
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    key: Key("loader"),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>>? readResponse() async {
    dynamic value = await _webViewController
        .evaluateJavascript("window.document.body.innerText");
    await _webViewController
        .evaluateJavascript("window.document.body.innerText = ''");
    await Future.delayed(Duration(seconds: 2));
    dynamic content = jsonDecode(value);
    Map<String, dynamic> extractedJson = jsonDecode(content);
    return extractedJson;
  }
}
