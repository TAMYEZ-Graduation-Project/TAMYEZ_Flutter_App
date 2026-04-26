import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../auth/auth_provider.dart';
import '../../auth/auth_status.dart' show AuthStatus;
import '../../layers/storage/constants/storage_constants.dart';
import '../../layers/storage/contracts/storage_service_contract.dart';
import '../dio/dio_constants.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final StorageService storageService;
  final AuthProvider authProvider;

  AuthInterceptor(
    @Named(StorageConstants.secureStorage) this.storageService,
    this.authProvider,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_requiresAuth(options)) {
      final token = await storageService.getString(
        StorageConstants.accessToken,
      );

      if (token != null) {
        options.headers[DioHeaders.authorization] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_isUnauthorized(err)) {
      _handleUnauthorized();
    }

    handler.next(err);
  }

  bool _requiresAuth(RequestOptions options) {
    return options.extra[DioKeys.requiresAuth] == true;
  }

  bool _isUnauthorized(DioException err) {
    return err.response?.statusCode == 401;
  }

  Future<void> _handleUnauthorized() async {
    await storageService.deleteValue(StorageConstants.accessToken);
    authProvider.setAuthStatus(AuthStatus.tokenExpired, notify: true);
    ();
  }
}
