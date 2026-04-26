import 'package:dio/dio.dart' show Interceptor;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../di/di.dart' show getIt;
import '../interceptors/auth_interceptor.dart';
import 'api_config.dart';

@injectable
class MainApiConfig implements ApiConfig {
  @override
  String get baseUrl => dotenv.get('BASE_URL');

  @override
  List<Interceptor> get interceptors => [getIt.get<AuthInterceptor>()];

  @override
  Duration get timeout => const Duration(seconds: 15);
}
