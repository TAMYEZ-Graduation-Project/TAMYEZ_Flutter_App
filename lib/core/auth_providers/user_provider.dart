import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart' show lazySingleton;

import '../entities/auth_token.dart' show AuthToken;
import '../entities/user_entity.dart';

@lazySingleton
class UserProvider extends ChangeNotifier {
  UserEntity? _user;
  AuthToken? _token;

  UserEntity? get user => _user;

  AuthToken? get token => _token;

  void setSession({required UserEntity user, required AuthToken token}) {
    _user = user;
    _token = token;
    notifyListeners();
  }

  void setUser({required UserEntity user}) {
    _user = user;
    notifyListeners();
  }

  void clear() {
    _user = null;
    _token = null;
    notifyListeners();
  }
}
