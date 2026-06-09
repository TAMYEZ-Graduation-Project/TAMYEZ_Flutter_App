import '../../models/gmail_login_request.dart';
import '../../models/login_request.dart' show LoginRequest;
import '../../models/login_response.dart';
import '../../models/sign_up_request.dart';
import '../../models/sign_up_response.dart';

abstract interface class AuthRemoteDataSource {
  Future<SignUpResponse> signUp({required SignUpRequest request});

  Future<LoginResponse> gmailSignUp({required GmailLoginRequest request});

  Future<LoginResponse> login({required LoginRequest request});

  Future<LoginResponse> gmailLogin({required GmailLoginRequest request});
}
