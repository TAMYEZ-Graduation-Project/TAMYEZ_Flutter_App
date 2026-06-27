import '../constants/app_enums.dart'
    show UserRoleEnum, CareerAssessmentStatusEnum;
import '../entities/auth_token.dart';
import '../entities/career_entity.dart';
import '../entities/login_session_entity.dart';
import '../entities/user_entity.dart' show UserEntity, CareerPathEntity;
import '../extensions/career_assessment_status_enum_value.dart';
import '../extensions/user_role_enum_value.dart' show UserRoleEnumValue;
import '../network/models/login_session_dto.dart';
import '../network/models/user_dto.dart' show UserDto, CareerPathDto;
import 'base_career_mapper.dart';

extension LoginSessionDtoMapper on LoginSessionDto {
  LoginSessionEntity toEntity() {
    return LoginSessionEntity(
      token: AuthToken(
        value: accessToken ?? '',
        role: user?.role?.userRoleEnum ?? UserRoleEnum.user,
      ),
      notificationsEnabled: notificationsEnabled ?? false,
      user: user?.toEntity() ?? const UserEntity(),
    );
  }
}

extension UserDtoMapper on UserDto {
  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      fullName: fullName ?? '',
      email: email ?? '',
      phoneNumber: phoneNumber ?? '',
      gender: gender ?? '',
      role: role ?? '',
      assessmentStatus:
          assessmentStatus?.careerAssessmentStatusEnum ??
          CareerAssessmentStatusEnum.notStarted,
      careerPath: careerPath?.toEntity() ?? const CareerPathEntity(),
      profilePicture: profilePicture ?? '',
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      confirmedAt: confirmedAt ?? '',
      v: v ?? 0,
    );
  }
}

extension CareerPathDtoMapper on CareerPathDto {
  CareerPathEntity toEntity() {
    return CareerPathEntity(
      id: id ?? '',
      selectedAt: selectedAt ?? '',
      career: career?.toEntity() ?? const CareerEntity(),
    );
  }
}
