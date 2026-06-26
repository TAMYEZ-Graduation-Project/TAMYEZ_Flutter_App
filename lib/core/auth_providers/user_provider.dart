import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart' show lazySingleton;

import '../entities/auth_token.dart' show AuthToken;
import '../entities/user_entity.dart';

@lazySingleton
class UserProvider extends ChangeNotifier {
  UserEntity? _user;
  bool _notificationsEnabled = false;
  AuthToken? _token;

  UserEntity? get user => _user;

  AuthToken? get token => _token;

  bool get notificationsEnabled => _notificationsEnabled;

  void setSession({
    required UserEntity user,
    required bool notificationsEnabled,
    required AuthToken token,
  }) {
    _user = user;
    _notificationsEnabled = notificationsEnabled;
    _token = token;
    notifyListeners();
  }

  void setUser({required UserEntity user}) {
    _user = user;
    notifyListeners();
  }

  void setNotificationsEnabled({required bool notificationsEnabled}) {
    _notificationsEnabled = notificationsEnabled;
    notifyListeners();
  }

  void clear() {
    _user = null;
    _notificationsEnabled = true;
    _token = null;
    notifyListeners();
  }
}
