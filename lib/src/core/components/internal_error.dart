import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';

class InternalErrorScreen extends StatefulWidget {
  @override
  _InternalErrorScreenState createState() => _InternalErrorScreenState();
}

class _InternalErrorScreenState extends State<InternalErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () => exit(0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConfig.verticalHeightScaled,
                      ),
                      Container(
                        child: Text(
                          "Uh-oh!",
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
                          "It seems our server is down, please try again in a few moments. We will be back in no time.",
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
                            // height: 50,
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
