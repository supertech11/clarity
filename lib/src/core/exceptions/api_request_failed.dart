import 'package:get/get_connect/http/src/response/response.dart';

class ApiRequestFailed implements Exception {
  final Response response;

  const ApiRequestFailed(this.response);
}
