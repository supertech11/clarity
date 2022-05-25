import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:saffron_clarity/src/core/exceptions/api_request_failed.dart';
import 'package:saffron_clarity/src/core/resources/string/config_strings.dart';

class NetworkConnect {
  GetConnect getConnect;
  NetworkConnect(this.getConnect) {
    getConnect.httpClient.timeout = const Duration(minutes: 5);
    getConnect.httpClient.baseUrl = ConfigString.BASE_URL;
    _setupLogger();
    getConnect.httpClient.addRequestModifier((Request request) async {
      // Set the header
      request.headers["Content-Type"] = "application/json";
      return request;
    });
  }

  Future<Map<String, dynamic>>? getCall(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    final res =
        await getConnect.get(url, headers: addTokenHeader(), query: query);

    return processResponse(res, url);
  }

  Future<Map<String, dynamic>>? patchCall(String url,
      {Map<String, dynamic>? body}) async {
    final res = await getConnect.patch(url, body, headers: addTokenHeader());

    return processResponse(res, url);
  }

  Future<Map<String, dynamic>> putCall(String url,
      {Map<String, dynamic>? body}) async {
    final res = await getConnect.put(url, body, headers: addTokenHeader());

    return processResponse(res, url);
  }

  Future<Map<String, dynamic>> postCall(String url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? query,
      Function(Map<String, dynamic>)? errorCallback}) async {
    final res = await getConnect.post(url, body,
        query: query, headers: addTokenHeader());

    return processResponse(res, url);
  }

  Future<Map<String, dynamic>> deleteCall(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    final res =
        await getConnect.delete(url, query: query, headers: addTokenHeader());

    return processResponse(res, url);
  }

  Map<String, String> addTokenHeader({
    Map<String, String> headers = const {},
  }) {
    return {
      ...headers,
      // "x-auth-token": _getAuthToken(url),
    };
  }

  Map<String, dynamic> processResponse(Response res, String endpoint) {
    if (!res.isOk) {
      debugPrint('-failed: $endpoint');
      debugPrint(res.bodyString);
      throw ApiRequestFailed(res);
    }

    if (res.body is Map) {
      return res.body;
    }

    return {"response": "invalid json body"};
  }

  void _setupLogger() {
    if (!kDebugMode) return;
    getConnect.httpClient.addRequestModifier((Request request) {
      // print("url::${request.url}");
      // print("headers::${request.headers}");
      return request;
    });
  }
}
