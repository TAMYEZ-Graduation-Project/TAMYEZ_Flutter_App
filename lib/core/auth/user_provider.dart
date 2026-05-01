import 'package:injectable/injectable.dart' show lazySingleton;

import 'user_entity.dart';

@lazySingleton
class UserProvider {
  UserEntity? _user;
  AuthToken? _token;

  UserEntity? get user => _user;

  AuthToken? get token => _token;

  void setSession({required UserEntity user, required AuthToken token}) {
    _user = user;
    _token = token;
  }

  void clear() {
    _user = null;
    _token = null;
  }
}

enum UserRole { user, admin, superAdmin, guest }

class AuthToken {
  final String value;
  final UserRole role;

  AuthToken({required this.value, required this.role});

  String toHeaderValue() {
    switch (role) {
      case UserRole.admin:
        return 'Admin $value';
      case UserRole.user:
        return 'Bearer $value';
      case UserRole.guest:
        return '';
      case UserRole.superAdmin:
        return 'SuperAdmin $value';
    }
  }
}
