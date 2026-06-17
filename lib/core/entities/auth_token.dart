import 'package:equatable/equatable.dart';

import '../constants/app_enums.dart' show UserRoleEnum, TokenBearerKeysEnum;

class AuthToken extends Equatable {
  final String value;
  final UserRoleEnum role;

  const AuthToken({required this.value, required this.role});

  String toHeaderValue() {
    switch (role) {
      case UserRoleEnum.user:
        return '${TokenBearerKeysEnum.bearerUser.strValue} $value';
      case UserRoleEnum.admin:
        return '${TokenBearerKeysEnum.bearerSystem.strValue} $value';
      case UserRoleEnum.superAdmin:
        return '${TokenBearerKeysEnum.bearerSuperSystem.strValue} $value';
      case UserRoleEnum.guest:
        return '';
    }
  }

  @override
  List<Object?> get props => [value, role];
}
