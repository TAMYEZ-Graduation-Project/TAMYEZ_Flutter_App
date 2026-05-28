import 'dart:io';

import 'package:dio/dio.dart';

import '../exceptions/app_exceptions.dart';
import '../failures/app_failures.dart';
import '../models/api_error_model.dart';

abstract class ExceptionHandling {
  static Failure mapExceptionsToFailures(Object error) {
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

          case CacheException():
            return const CacheFailure();

          case GoogleLoginException():
            return const GoogleLoginFailure();

          case PlatformException():
            switch (error) {
              case GoogleLoginNotSupportedException():
                return const GoogleLoginNotSupportedFailure();
            }

          default:
            return const UnknownFailure();
        }
      default:
        return const UnknownFailure();
    }
  }

  static Failure _mapDioToFailure(DioException error) {
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
        return ServerFailure(
          statusCode: error.response?.statusCode,
          serverMessage: ApiErrorModel.fromJson(
            error.response as Map<String, dynamic>,
          ).error,
        );

      case DioExceptionType.unknown:
        return const UnknownFailure();
    }
  }
}
