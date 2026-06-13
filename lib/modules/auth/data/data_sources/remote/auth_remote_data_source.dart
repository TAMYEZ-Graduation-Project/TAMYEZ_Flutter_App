import '../../../../../core/network/models/simple_api_response.dart'
    show SimpleApiResponse;
import '../../models/gmail_login_request.dart';
import '../../models/login_request.dart' show LoginRequest;
import '../../models/login_response.dart';
import '../../models/reset_password_request.dart' show ResetPasswordRequest;
import '../../models/sign_up_request.dart';
import '../../models/sign_up_response.dart';
import '../../models/user_email_request.dart' show UserEmailRequest;
import '../../models/verify_code_request.dart' show VerifyCodeRequest;

abstract interface class AuthRemoteDataSource {
  Future<SignUpResponse> signUp({required SignUpRequest request});

  Future<LoginResponse> gmailSignUp({required GmailLoginRequest request});

  Future<SimpleApiResponse> resendEmailVerification({
    required UserEmailRequest request,
  });
  Future<LoginResponse> login({required LoginRequest request});

  Future<LoginResponse> gmailLogin({required GmailLoginRequest request});

  Future<SimpleApiResponse> forgetPassword({required UserEmailRequest request});

  Future<SimpleApiResponse> verifyCode({required VerifyCodeRequest request});

  Future<SimpleApiResponse> resetPassword({
    required ResetPasswordRequest request,
  });
}
