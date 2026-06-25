abstract class ProfileApiEndpoints {
  static const String getUserProfile = 'user';
  static const String editUserProfile = 'user';
  static const String uploadProfilePicture = 'user/profile-picture';
  static const String changePassword = 'user/change-password';
}

abstract class ProfileApiParams {
  static const String attachment = 'attachment';
  static const String version = 'v';
}
