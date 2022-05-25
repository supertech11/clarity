
import 'package:saffron_clarity/src/core/utils/util_functions.dart';

class FieldValidator {
  static String? validateFieldNotEmpty(value, message) {
    if (value.isEmpty) {
      return "$message";
    }
  }

  static String? validateEmail(value, message) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.toString().trim());
    if (!emailValid) {
      return "$message"; //Enter valid email
    }
    return null;
  }

  static String? validatePassword(value, message) {
    RegExp regExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&-.+=()%]).{6,}$');
    if (!regExp.hasMatch(value)) {
      UtilFunctions.displayErrorBox("$message");
      return "$message";
    }

    return null;
  }

  static String? validateValueIsEqual(value1, value2, message) {
    if (value1 != value2) {
      return "$message";
    }
  }
}
