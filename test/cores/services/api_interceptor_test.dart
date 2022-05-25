// import 'package:flutter_test/flutter_test.dart';
// import 'package:test/test.dart' as Test;
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/error/api_request_failure.dart';
import 'package:saffron_clarity/src/core/services/api_interceptor.dart';

void main() {
  Future<String> f1() {
    return Future.value("success");
  }

  setUp(() {});

  group('API Interceptor Tests', () {
    test(
        'Validate the interceptor return actual result when function executed successfully',
        () async {
      final a = await apiInterceptor(() => f1());
      a.fold((l) {}, (r) {
        expect(r, isA<String>());
        expect(r, "success");
      });
    });

    test(
        'Validate the interceptor return ApiRequestFailure whenever ApiRequestFailed is thrown',
        () async {
      final a = await apiInterceptor(() => f1());
      a.fold((l) {
        expect(l, isA<ApiRequestFailure>());
      }, (r) {});
    });
  });
}
