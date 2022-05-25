import 'package:flutter/material.dart';

class AppAlertDialog {
  static void showCustomDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierColor: Color.fromARGB(0XFF, 0X00, 0X58, 0X7A).withOpacity(0.7),
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                key: Key("loader"),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                height: MediaQuery.of(context).size.height * 0.07,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  message == "" ? "" : message,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showWhiteOverlayDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.white,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Center(
            key: Key("loader"),
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
