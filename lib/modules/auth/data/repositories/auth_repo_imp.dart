import 'package:injectable/injectable.dart';

import '../../../../core/execution/operation_result.dart';
import '../../../../core/utils/functions/repo_result_handler.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/entities/sign_up_params.dart';
import '../../domain/entities/sign_up_response_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../data_sources/remote/social_auth_service.dart';
import '../mappers/auth_mapper.dart';
import '../models/gmail_login_request.dart';

@Injectable(as: AuthRepository)
class AuthRepoImp implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final SocialAuthService _socialAuthService;

  const AuthRepoImp(this._authRemoteDataSource, this._socialAuthService);

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
      return response.toEntity();
    });
  }

  @override
  Future<OperationResult<LoginResponseEntity>> login({
    required LoginParams params,
  }) {
    return repoResultHandler(() async {
      final response = await _authRemoteDataSource.login(
        request: params.toModel(),
      );
      return response.toEntity();
    });
  }

  @override
  Future<OperationResult<LoginResponseEntity>> gmailLogin() {
    return repoResultHandler(() async {
      final String token = await _socialAuthService.getGoogleIdToken();
      final response = await _authRemoteDataSource.gmailLogin(
        request: GmailLoginRequest(idToken: token),
      );
      return response.toEntity();
    });
  }
}
