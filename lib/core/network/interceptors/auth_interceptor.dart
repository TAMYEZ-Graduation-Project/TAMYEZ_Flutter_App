import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../auth_providers/auth_provider.dart' show AuthProvider;
import '../../auth_providers/user_provider.dart' show UserProvider;
import '../../entities/auth_status.dart' show AuthStatus;
import '../../layers/storage/constants/storage_constants.dart';
import '../../layers/storage/contracts/storage_service_contract.dart';
import '../dio/dio_constants.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final UserProvider userProvider;
  final AuthProvider authProvider;
  final StorageService storageService;

  AuthInterceptor(
    this.userProvider,
    @Named(StorageConstants.secureStorage) this.storageService,
    this.authProvider,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_requiresAuth(options)) {
      if (userProvider.token != null) {
        options.headers[DioHeaders.authorization] = userProvider.token
            ?.toHeaderValue();
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
    userProvider.clear();
    await storageService.deleteValue(StorageConstants.accessToken);
    authProvider.setAuthStatus(AuthStatus.tokenExpired, notify: true);
    ();
  }
}
