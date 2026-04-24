import 'package:ansicolor/ansicolor.dart' show AnsiPen;
import 'package:dio/dio.dart' show Dio, BaseOptions;
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart'
    show TalkerDioLogger;
import 'package:talker_dio_logger/talker_dio_logger_settings.dart'
    show TalkerDioLoggerSettings;

import '../api_config/api_config.dart';
import 'dio_constants.dart' show DioHeaders, DioContentType;

@injectable
class DioFactory {
  Dio create(ApiConfig apiConfig) {
    return Dio(
        BaseOptions(
          baseUrl: apiConfig.baseUrl,
          connectTimeout: apiConfig.timeout,
          receiveTimeout: apiConfig.timeout,
          headers: {
            DioHeaders.contentType: DioContentType.json,
            DioHeaders.accept: DioContentType.json,
          },
        ),
      )
      ..interceptors.addAll([
        TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
            printResponseHeaders: true,
            printRequestHeaders: true,
            printResponseTime: true,
            printResponseRedirects: true,
            // Blue http requests logs in console
            requestPen: AnsiPen()..white(),
            // Green http responses logs in console
            responsePen: AnsiPen()..green(),
            // Error http logs in console
            errorPen: AnsiPen()..red(),
          ),
        ),
        ...apiConfig.interceptors,
      ]);
  }
}
