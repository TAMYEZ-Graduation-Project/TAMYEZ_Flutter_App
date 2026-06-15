import '../../../../../core/network/models/login_session_dto.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveLoginSession({LoginSessionDto? body});

  Future<void> clearLoginSession();

  Future<LoginSessionDto> getLoginSession();
}
