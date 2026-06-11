import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../../../core/utils/functions/safe_print.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/entities/sign_up_params.dart';
import '../../domain/entities/sign_up_response_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local/auth_local_data_source.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../data_sources/remote/social_auth_service.dart';
import '../mappers/auth_mapper.dart';
import '../models/gmail_login_request.dart';

@Injectable(as: AuthRepository)
class AuthRepoImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final SocialAuthService _socialAuthService;

  final AuthLocalDataSource _authLocalDataSource;

  const AuthRepoImp(
    this._authRemoteDataSource,
    this._socialAuthService,
    this._authLocalDataSource,
  );

  @override
  Future<OperationResult<SignUpResponseEntity>> signUp({
    required SignUpParams params,
  }) async {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.signUp(
        request: params.toModel(),
      );
      return response.toEntity();
    });
  }

  @override
  Future<OperationResult<LoginResponseEntity>> gmailSignUp() async {
    return repoResultHandler(() async {
      final String token = await _socialAuthService.getGoogleIdToken();
      final response = await _authRemoteDataSource.gmailSignUp(
        request: GmailLoginRequest(idToken: token),
      );
      await _authLocalDataSource.saveLoginSession(body: response.body);
      return response.toEntity();
    });
  }

  @override
  Future<OperationResult<LoginResponseEntity>> login({
    required LoginParams params,
    required bool rememberMe,
  }) {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.login(
        request: params.toModel(),
      );
      if (rememberMe) {
        safePrint('Saving login session');
        await _authLocalDataSource.saveLoginSession(body: response.body);
      }
      return response.toEntity();
    });
  }

  @override
  Future<OperationResult<LoginResponseEntity>> gmailLogin({
    required bool rememberMe,
  }) {
    return repoResultHandler(() async {
      final String token = await _socialAuthService.getGoogleIdToken();
      final response = await _authRemoteDataSource.gmailLogin(
        request: GmailLoginRequest(idToken: token),
      );
      if (rememberMe) {
        await _authLocalDataSource.saveLoginSession(body: response.body);
      }
      return response.toEntity();
    });
  }

  @override
  Future<bool> isThereLoginSession() {
    return _authLocalDataSource.isThereLoginSession();
  }
}
