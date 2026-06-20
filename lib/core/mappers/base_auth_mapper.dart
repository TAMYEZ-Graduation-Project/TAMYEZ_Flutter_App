import '../constants/app_enums.dart' show UserRoleEnum;
import '../entities/auth_token.dart';
import '../entities/login_session_entity.dart';
import '../entities/user_entity.dart' show UserEntity;
import '../extensions/user_role_enum_value.dart' show UserRoleEnumValue;
import '../network/models/login_session_dto.dart';
import '../network/models/user_dto.dart' show UserDto;
import 'base_career_mapper.dart';

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
      careerPath: careerPath?.toEntity(),
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      confirmedAt: confirmedAt?.toIso8601String(),
      v: v,
    );
  }
}
