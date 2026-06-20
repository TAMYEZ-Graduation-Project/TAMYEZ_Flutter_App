import '../constants/app_enums.dart';

extension UserRoleEnumValue on String {
  UserRoleEnum get userRoleEnum {
    switch (this) {
      case 'User':
        return UserRoleEnum.user;
      case 'Admin':
        return UserRoleEnum.admin;
      case 'SuperAdmin':
        return UserRoleEnum.superAdmin;
      case 'Guest':
        return UserRoleEnum.guest;
      default:
        return UserRoleEnum.user;
    }
  }
}
