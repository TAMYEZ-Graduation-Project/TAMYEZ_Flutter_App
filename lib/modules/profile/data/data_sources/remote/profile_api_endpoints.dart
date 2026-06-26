abstract class ProfileApiEndpoints {
  static const String getUserProfile = 'user';
  static const String editUserProfile = 'user';
  static const String uploadProfilePicture = 'user/profile-picture';
  static const String changePassword = 'user/change-password';
  static const String logout = 'user/logout';
  static const String deleteAccount = 'user/delete';

  static const String enableNotifications = 'firebase/enable-notifications';
  static const String refreshFcmToken = 'firebase/refresh-fcm-token';
  static const String disableNotifications = 'firebase/disable-notifications';
}

abstract class ProfileApiParams {
  static const String attachment = 'attachment';
  static const String version = 'v';
}
