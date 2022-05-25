import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UtilFunctions {
  static void displayErrorBox(String message) {
    Get.snackbar('Error!', '${message.toString()}',
        barBlur: 0,
        dismissDirection: SnackDismissDirection.VERTICAL,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        overlayBlur: 0,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(seconds: 3));
    print(message.toString() + "hhh");
  }

  static void displaySuccessBox(String heading, String message) {
    Get.snackbar('${heading.toString()}', '${message.toString()}',
        barBlur: 0,
        dismissDirection: SnackDismissDirection.VERTICAL,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        overlayBlur: 0,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(seconds: 3));
  }

  static String capitalizeFirst(String? input) {
    if (input == null || input.isEmpty == true) {
      return "";
    }
    return input.substring(0, 1).toUpperCase() +
        input.substring(1).toLowerCase();
  }

  static String pluralizeMessage(int itemCount, String msg) {
    String suffix = "";
    if (itemCount > 1) {
      suffix = "s";
    }
    return "$msg$suffix";
  }

  static String parseDate(String? date) {
    if (date == null) {
      return "";
    }

    try {
      var formatter = DateFormat("dd MMM yyyy");
      return formatter.format(DateTime.parse(date));
    } catch (err) {
      return "Invalid date format";
    }
  }

  static String getNameInitials(String name, index) {
    var data = name.split(" ");
    if (data.isEmpty) {
      return "";
    } else if (data.length == 1) {
      return data[0];
    } else {
      return data[index];
    }
  }

  static String getFirstCharacter(String? value) {
    if (value?.isNotEmpty == true) {
      return value?.substring(0, 1) ?? "";
    }
    return "";
  }
}
