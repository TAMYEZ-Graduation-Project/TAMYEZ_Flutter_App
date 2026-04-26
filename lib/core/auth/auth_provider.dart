import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:injectable/injectable.dart';

import 'auth_status.dart' show AuthStatus;

@lazySingleton
class AuthProvider extends ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.unauthenticated;

  AuthStatus get authStatus => _authStatus;

  void setAuthStatus(AuthStatus status, {bool notify = false}) {
    if (authStatus == status) return;
    _authStatus = status;
    if (notify) notifyListeners();
  }
}
