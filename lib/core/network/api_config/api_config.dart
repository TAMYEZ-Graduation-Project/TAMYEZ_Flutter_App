import 'package:dio/dio.dart';

abstract interface class ApiConfig {
  String get baseUrl;

  Duration get timeout;

  List<Interceptor> get interceptors;
}
