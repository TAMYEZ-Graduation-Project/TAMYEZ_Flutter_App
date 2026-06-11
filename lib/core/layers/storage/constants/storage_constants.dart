abstract class StorageConstants {
  // storage options
  static const String secureStorage = 'secureStorage';
  static const String localeKey = 'AppLocal';
  static const String themeKey = 'AppTheme';

  static const String userKey = 'user';
  static const String accessToken = 'accessToken';
  static const String sessionKey = 'SessionKey';

  static String errorStoringMessage(String error) {
    return 'Error Storing Value: $error';
  }

  static String errorReadingMessage(String error) {
    return 'Error Reading Value: $error';
  }

  static String errorDeletingMessage(String error) {
    return 'Error Deleting Value: $error';
  }
}
