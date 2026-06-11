import '../../models/login_response.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveLoginSession({LoginBodyDto? body});

  Future<void> clearLoginSession();

  Future<bool> isThereLoginSession();
}
