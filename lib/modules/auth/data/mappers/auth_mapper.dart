import '../../domain/entities/gmail_login_params.dart' show GmailLoginParams;
import '../../domain/entities/login_params.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/entities/sign_up_params.dart';
import '../../domain/entities/sign_up_response_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../models/gmail_login_request.dart' show GmailLoginRequest;
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/sign_up_request.dart';
import '../models/sign_up_response.dart';

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
      accessToken: body?.accessToken,
      user: body?.user?.toEntity(),
    );
  }
}

extension UserDtoMapper on UserDto {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      gender: gender,
      role: role,
      assessmentStatus: assessmentStatus,
      createdAt: createdAt,
      updatedAt: updatedAt,
      confirmedAt: confirmedAt,
    );
  }
}

extension SignUpResponseMapper on SignUpResponse {
  SignUpResponseEntity toEntity() {
    return SignUpResponseEntity(success: success, message: message);
  }
}
