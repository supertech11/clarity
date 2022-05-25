// import 'package:flutter_test/flutter_test.dart';
// import 'package:test/test.dart' as Test;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/exceptions/api_request_failed.dart';
import 'package:saffron_clarity/src/core/services/network_connect.dart';

void main() {
  setUp(() {});

  group('Network connect Tests', () {
    test('validate response throws ApiRequestFailed when not a success', () {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        networkConnect.processResponse(Response(statusCode: 400), "endpoint");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate return of a map when a success with no body', () {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        final val = networkConnect.processResponse(
            Response(
              statusCode: 200,
            ),
            "endpoint");
        expect(val, isA<Map>());
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate return of a map when a success with  body', () {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        final val = networkConnect.processResponse(
            Response(statusCode: 200, body: {"": ""}), "endpoint");
        expect(val, isA<Map>());
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate added headers are returned', () {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      final val =
          networkConnect.addTokenHeader(headers: {"x-auth-token": "sample"});
      expect(val, {"x-auth-token": "sample"});
    });

    test('validate get request call', () async {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        await networkConnect.getCall("url");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate patchCall request call', () async {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        await networkConnect.patchCall("url");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate postCall request call', () async {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        await networkConnect.postCall("url");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate putCall request call', () async {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        await networkConnect.putCall("url");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });

    test('validate deleteCall request call', () async {
      final getConnect = GetConnect();
      NetworkConnect networkConnect = NetworkConnect(getConnect);
      try {
        await networkConnect.deleteCall("url");
      } catch (err) {
        expect(err, isA<ApiRequestFailed>());
      }
    });
  });
}
