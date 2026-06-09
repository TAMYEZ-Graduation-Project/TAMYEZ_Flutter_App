import 'package:injectable/injectable.dart';

import '../../models/gmail_login_request.dart';
import '../../models/login_request.dart';
import '../../models/login_response.dart';
import '../../models/sign_up_request.dart';
import '../../models/sign_up_response.dart';
import 'auth_api_client.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final AuthApiClient _authApiClient;

  const AuthRemoteDataSourceImp(this._authApiClient);

  @override
  Future<SignUpResponse> signUp({required SignUpRequest request}) {
    return _authApiClient.signUp(request);
  }

  @override
  Future<LoginResponse> gmailSignUp({
    required GmailLoginRequest request,
  }) async {
    return _authApiClient.gmailSignUp(request);
  }

  @override
  Future<LoginResponse> login({required LoginRequest request}) {
    return _authApiClient.login(request);
  }

  @override
  Future<LoginResponse> gmailLogin({required GmailLoginRequest request}) {
    return _authApiClient.gmailLogin(request);
  }
}
