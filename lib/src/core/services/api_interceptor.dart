import 'package:dartz/dartz.dart';
import 'package:saffron_clarity/src/core/error/api_request_failure.dart';
import 'package:saffron_clarity/src/core/exceptions/api_request_failed.dart';

Future<Either<ApiRequestFailure, R>> apiInterceptor<R>(
    Future<R>? Function() func) async {
  try {
    final res = await func();
    return Right(res!);
  } on ApiRequestFailed catch (e) {
    return Left(ApiRequestFailure(e.response));
  }
}
