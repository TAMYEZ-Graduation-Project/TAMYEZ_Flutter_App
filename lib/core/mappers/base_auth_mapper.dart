import '../constants/app_enums.dart' show UserRoleEnum;
import '../entities/auth_token.dart';
import '../entities/login_session_entity.dart';
import '../entities/user_entity.dart' show UserEntity;
import '../extensions/user_role_enum_value.dart' show UserRoleEnumValue;
import '../network/models/login_session_dto.dart';
import '../network/models/user_dto.dart' show UserDto;

extension LoginSessionDtoMapper on LoginSessionDto {
  LoginSessionEntity toEntity() {
    return LoginSessionEntity(
      token: AuthToken(
        value: accessToken ?? '',
        role: user?.role?.userRoleEnum ?? UserRoleEnum.user,
      ),
      user: user?.toEntity() ?? const UserEntity(),
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
      v: v,
    );
  }
}
