import 'package:dio/dio.dart' show Dio;
import 'package:injectable/injectable.dart' show module, lazySingleton, Named;

import '../api_config/main_api_config.dart';
import 'dio_constants.dart' show DioNames;
import 'dio_factory.dart';

@module
abstract class NetworkModule {
  @Named(DioNames.mainDio)
  @lazySingleton
  Dio createMainDio(DioFactory factory, MainApiConfig apiConfig) {
    return factory.create(apiConfig);
  }
}
