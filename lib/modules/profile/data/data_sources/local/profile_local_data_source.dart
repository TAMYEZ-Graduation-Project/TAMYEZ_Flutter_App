import '../../../../../core/network/models/user_dto.dart';

abstract interface class ProfileLocalDataSource {
  Future<UserDto?> getSavedUserProfile();

  Future<void> saveUserProfile({required UserDto newUser});

  Future<void> saveNotificationsEnabled({required bool notificationsEnabled});

  Future<void> clear();
}
