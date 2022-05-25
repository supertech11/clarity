import 'package:get/get_connect/http/src/response/response.dart';

import 'failure.dart';

class ApiRequestFailure extends Failure {
  final Response response;

  ApiRequestFailure(this.response);

  String get message {
    return _extractErrorMessage();
  }

  int get code {
    try {
      final c = response.body['code'] ?? response.statusCode;
      return c;
    } catch (e) {
      print('_Error extracting code from response: ${response.body}');
      return 500;
    }
  }

  String _extractErrorMessage() {
    dynamic msg;
    if (response.body is Map) {
      msg = response.body['message'] ?? "";
    } else {
      msg = '';
    }

    return msg;
  }
}
