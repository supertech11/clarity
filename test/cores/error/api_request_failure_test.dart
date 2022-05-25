// import 'package:flutter_test/flutter_test.dart';
// import 'package:test/test.dart' as Test;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:saffron_clarity/src/core/error/api_request_failure.dart';
import 'package:saffron_clarity/src/core/error/failure.dart';

void main() {
  setUp(() {});

  group('ApiRequestFailure Tests', () {
    test('Validate ApiRequestFailure is an instance of Failure', () {
      ApiRequestFailure apiRequestFailure = ApiRequestFailure(Response());
      expect(apiRequestFailure, isA<Failure>());
    });
    test('Validate ApiRequestFailure return message gotten from api', () {
      ApiRequestFailure apiRequestFailure = ApiRequestFailure(Response(body: {
        "message": "message",
      }, statusCode: 200));
      expect(apiRequestFailure.message, "message");
      expect(apiRequestFailure.code, 200);
    });

    test(
        'Validate ApiRequestFailure return 500 if statuscode is unknown and empty string if msg is absent',
        () {
      ApiRequestFailure apiRequestFailure = ApiRequestFailure(Response());
      expect(apiRequestFailure.message, "");
      expect(apiRequestFailure.code, 500);
    });
  });
}
