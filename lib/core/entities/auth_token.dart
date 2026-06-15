import 'package:equatable/equatable.dart';

import '../constants/app_enums.dart' show UserRoleEnum;

class AuthToken extends Equatable {
  final String value;
  final UserRoleEnum role;

  const AuthToken({required this.value, required this.role});

  String toHeaderValue() {
    switch (role) {
      case UserRoleEnum.admin:
        return 'Admin $value';
      case UserRoleEnum.user:
        return 'Bearer $value';
      case UserRoleEnum.guest:
        return '';
      case UserRoleEnum.superAdmin:
        return 'SuperAdmin $value';
    }
  }

  @override
  List<Object?> get props => [value, role];
}
