import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../failures/app_failures.dart';

@lazySingleton
class ExceptionHandling {
  Failure mapExceptionsToFailures(Object error) {
    switch (error) {
      case Exception _:
        switch (error) {
          case SocketException():
            return const NoInternetFailure();

          case HttpException():
            return const ServerFailure();

          case FormatException():
            return const ParsingFailure();

          case DioException():
            return _mapDioToFailure(error);

          default:
            return const UnknownFailure();
        }
      default:
        return const UnknownFailure();
    }
  }

  Failure _mapDioToFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ConnectionTimeoutFailure();

      case DioExceptionType.sendTimeout:
        return const SendTimeoutFailure();

      case DioExceptionType.receiveTimeout:
        return const ReceiveTimeoutFailure();

      case DioExceptionType.connectionError:
        return const NoInternetFailure();

      case DioExceptionType.badCertificate:
        return const BadCertificateFailure();

      case DioExceptionType.cancel:
        return const RequestCancelledFailure();

      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 401) {
          return const UnauthorizedFailure();
        }
        if (error.response?.statusCode == 400) {
          return const BadRequestFailure();
        }
        return ServerFailure(statusCode: error.response?.statusCode);

      case DioExceptionType.unknown:
        return const UnknownFailure();
    }
  }
}
