import 'dart:io';

import 'package:dio/dio.dart';

import '../../mappers/base_profile_mapper.dart';
import '../../utils/functions/safe_print.dart';
import '../constants/backend_error_codes.dart';
import '../exceptions/app_exceptions.dart';
import '../failures/app_failures.dart';
import '../models/api_error_model.dart';
import '../models/fail_enable_notification_cause_model.dart';

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

          case LoginBadResponseException():
            return const LoginBadResponseFailure();

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
    safePrint(error.type);
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
        final errorModel = ApiErrorModel.fromJson(
          error.response?.data as Map<String, dynamic>,
        ).error;
        if (error.response?.statusCode == 409 &&
            errorModel?.code == BackendErrorCodes.versionConflict) {
          return const VersionConflictFailure();
        }
        if (error.response?.statusCode == 400 &&
            errorModel?.code == BackendErrorCodes.invalidInput &&
            (errorModel?.message?.toLowerCase().contains(
                  'two enabled push devices,',
                ) ??
                false)) {
          final devices = FailEnableNotificationCauseModel.fromJson(
            error.response?.data as Map<String, dynamic>,
          ).cause?.map((e) => e.toEntity()).toList();
          if (devices == null) {
            return const UnknownFailure();
          }
          return ExceededTwoEnabledNotificationDevicesFailure(devices);
        }
        return ServerFailure(
          statusCode: error.response?.statusCode,
          serverMessage: errorModel?.message,
        );

      case DioExceptionType.unknown:
        return const UnknownFailure();
    }
  }
}
