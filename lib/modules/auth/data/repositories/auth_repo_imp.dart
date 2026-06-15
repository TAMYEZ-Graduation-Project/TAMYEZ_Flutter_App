import 'package:injectable/injectable.dart';

import '../../../../core/entities/login_session_entity.dart';
import '../../../../core/error/exceptions/app_exceptions.dart'
    show LoginBadResponseException;
import '../../../../core/execution/operation_result.dart';
import '../../../../core/mappers/base_auth_mapper.dart'
    show LoginSessionDtoMapper;
import '../../../../core/network/models/login_session_dto.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/entities/reset_password_params.dart';
import '../../domain/entities/sign_up_params.dart';
import '../../domain/entities/sign_up_response_entity.dart';
import '../../domain/entities/user_email_params.dart';
import '../../domain/entities/verify_code_params.dart';
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

  bool _isLoginSessionValid(LoginSessionDto? session) {
    if (session?.user == null || session?.accessToken == null) {
      throw const LoginBadResponseException();
    }
    return true;
  }

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
      if (_isLoginSessionValid(response.body)) {
        await _authLocalDataSource.saveLoginSession(body: response.body);
      }
      return response.toEntity();
    });
  }

  @override
  Future<OperationResult<bool>> resendEmailVerification({
    required UserEmailParams params,
  }) {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.resendEmailVerification(
        request: params.toModel(),
      );
      return response.success ?? true;
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
      if (rememberMe && _isLoginSessionValid(response.body)) {
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
      if (rememberMe && _isLoginSessionValid(response.body)) {
        await _authLocalDataSource.saveLoginSession(body: response.body);
      }
      return response.toEntity();
    });
  }

  @override
  Future<LoginSessionEntity?> getLoginSession() async {
    final session = await _authLocalDataSource.getLoginSession();

    if (session.accessToken != null || session.user != null) return null;
    return session.toEntity();
  }

  @override
  Future<OperationResult<bool>> forgetPassword({
    required UserEmailParams params,
  }) {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.forgetPassword(
        request: params.toModel(),
      );
      return response.success ?? true;
    });
  }

  @override
  Future<OperationResult<bool>> verifyCode({required VerifyCodeParams params}) {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.verifyCode(
        request: params.toModel(),
      );
      return response.success ?? true;
    });
  }

  @override
  Future<OperationResult<bool>> resetPassword({
    required ResetPasswordParams params,
  }) {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.resetPassword(
        request: params.toModel(),
      );
      return response.success ?? true;
    });
  }
}
