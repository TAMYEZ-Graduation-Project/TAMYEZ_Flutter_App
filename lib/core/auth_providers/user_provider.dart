import 'package:injectable/injectable.dart' show lazySingleton;

import '../entities/auth_token.dart' show AuthToken;
import '../entities/user_entity.dart';

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
