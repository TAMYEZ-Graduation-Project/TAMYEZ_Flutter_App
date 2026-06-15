import '../../../../core/mappers/base_auth_mapper.dart';
import '../../domain/entities/gmail_login_params.dart' show GmailLoginParams;
import '../../domain/entities/login_params.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/entities/reset_password_params.dart'
    show ResetPasswordParams;
import '../../domain/entities/sign_up_params.dart';
import '../../domain/entities/sign_up_response_entity.dart';
import '../../domain/entities/user_email_params.dart' show UserEmailParams;
import '../../domain/entities/verify_code_params.dart' show VerifyCodeParams;
import '../models/gmail_login_request.dart' show GmailLoginRequest;
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/reset_password_request.dart' show ResetPasswordRequest;
import '../models/sign_up_request.dart';
import '../models/sign_up_response.dart';
import '../models/user_email_request.dart' show UserEmailRequest;
import '../models/verify_code_request.dart' show VerifyCodeRequest;

extension LoginRequestMapper on LoginParams {
  LoginRequest toModel() {
    return LoginRequest(
      email: email,
      password: password,
      deviceId: deviceId,
      fcmToken: fcmToken,
    );
  }
}

extension SignUpRequestMapper on SignUpParams {
  SignUpRequest toModel() {
    return SignUpRequest(
      fullName: fullName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      gender: gender,
      phoneNumber: phoneNumber,
    );
  }
}

extension GmailLoginRequestMapper on GmailLoginParams {
  GmailLoginRequest toModel() {
    return GmailLoginRequest(
      deviceId: deviceId,
      fcmToken: fcmToken,
      idToken: idToken,
    );
  }
}

extension LoginResponseMapper on LoginResponse {
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      success: success,
      message: message,
      body: body!.toEntity(),
    );
  }
}

extension SignUpResponseMapper on SignUpResponse {
  SignUpResponseEntity toEntity() {
    return SignUpResponseEntity(success: success, message: message);
  }
}

extension UserEmailRequestMapper on UserEmailParams {
  UserEmailRequest toModel() {
    return UserEmailRequest(email: email);
  }
}

extension VerifyCodeRequestMapper on VerifyCodeParams {
  VerifyCodeRequest toModel() {
    return VerifyCodeRequest(email: email, otp: otp);
  }
}

extension ResetPasswordRequestMapper on ResetPasswordParams {
  ResetPasswordRequest toModel() {
    return ResetPasswordRequest(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
