import '../entities/session_entity.dart';

abstract interface class SessionStorageService {
  Future<void> saveSession(SessionEntity session);

  Future<SessionEntity?> restoreSession();

  Future<void> clearSession();
}
