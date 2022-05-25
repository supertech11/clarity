import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';


class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () =>
            exit(0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: sizeConfig.verticalSpace * 5,
                      // ),
                      // Container(
                      //   // height: sizeConfig.height / 1.6,
                      //   width: sizeConfig.width / 1.3,
                      //   child: Image.asset(
                      //     "assets/images/no_connection.png",
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      SizedBox(
                        height: SizeConfig.verticalHeightScaled,
                      ),
                      Container(
                        child: Text(
                          "Network Error!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff0D3F67)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.verticalHeightScaled,
                      ),
                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          "No connection available, please check your internet connection and try again.",
                          style: TextStyle(
                            color: Color(0xff0D3F67),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomButton(
                              key: Key("close"),
                              label: "Close app",
                              buttonColor: Theme.of(context).primaryColor,
                              onPressed: () => SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.verticalHeightScaled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}