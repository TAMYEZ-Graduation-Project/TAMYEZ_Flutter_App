import 'package:injectable/injectable.dart';

import '../../../../../core/network/models/simple_api_response.dart';
import '../../models/gmail_login_request.dart';
import '../../models/login_request.dart';
import '../../models/login_response.dart';
import '../../models/reset_password_request.dart';
import '../../models/sign_up_request.dart';
import '../../models/sign_up_response.dart';
import '../../models/user_email_request.dart';
import '../../models/verify_code_request.dart';
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
  Future<SimpleApiResponse> resendEmailVerification({
    required UserEmailRequest request,
  }) {
    return _authApiClient.resendEmailVerification(request);
  }

  @override
  Future<LoginResponse> login({required LoginRequest request}) {
    return _authApiClient.login(request);
  }

  @override
  Future<LoginResponse> gmailLogin({required GmailLoginRequest request}) {
    return _authApiClient.gmailLogin(request);
  }

  @override
  Future<SimpleApiResponse> forgetPassword({
    required UserEmailRequest request,
  }) {
    return _authApiClient.forgetPassword(request);
  }

  @override
  Future<SimpleApiResponse> resetPassword({
    required ResetPasswordRequest request,
  }) {
    return _authApiClient.resetPassword(request);
  }

  @override
  Future<SimpleApiResponse> verifyCode({required VerifyCodeRequest request}) {
    return _authApiClient.verifyCode(request);
  }
}
