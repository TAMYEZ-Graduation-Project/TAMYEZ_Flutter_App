import 'package:dio/dio.dart' show Dio, BaseOptions;
import 'package:injectable/injectable.dart';

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
        ...apiConfig.interceptors,
      ]);
  }
}
