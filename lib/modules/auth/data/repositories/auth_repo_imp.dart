import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions/app_exceptions.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/layers/storage/constants/storage_constants.dart'
    show StorageConstants;
import '../../../../core/layers/storage/contracts/storage_service_contract.dart';
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
  final StorageService _storageService;

  const AuthRepoImp(
    this._authRemoteDataSource,
    this._socialAuthService,
    @Named(StorageConstants.secureStorage) this._storageService,
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
        if (response.body?.user == null || response.body?.accessToken == null) {
          throw const LoginBadResponseException();
        }
        await Future.wait([
          _storageService.setString(
            StorageConstants.userKey,
            jsonEncode(response.body!.user!.toJson()),
          ),
          _storageService.setString(
            StorageConstants.accessToken,
            jsonEncode(response.body!.accessToken),
          ),
        ]);
      }
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

  @override
  Future<bool> isThereLoginSession() async {
    final List<String?> savedValues = await Future.wait([
      _storageService.getString(StorageConstants.userKey),
      _storageService.getString(StorageConstants.accessToken),
    ]);

    return savedValues[0] != null && savedValues[1] != null;
  }
}
