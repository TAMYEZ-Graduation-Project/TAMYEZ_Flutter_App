import 'dart:io' show Platform;
import 'dart:ui' show Brightness;

import 'package:injectable/injectable.dart' show lazySingleton, Named;

import '../auth_providers/auth_provider.dart' show AuthProvider;
import '../auth_providers/user_provider.dart' show UserProvider;
import '../entities/auth_status.dart' show AuthStatus;
import '../entities/login_session_entity.dart';
import '../extensions/languages_enum_value.dart';
import '../layers/localization/enums/languages_enum.dart' show LanguagesEnum;
import '../layers/localization/l10n/manager/localization_manager.dart';
import '../layers/storage/constants/storage_constants.dart';
import '../layers/storage/contracts/storage_service_contract.dart';
import '../layers/theme/extensions/brightness_enum_extension.dart';
import '../layers/theme/manager/theme_manager.dart';
import '../presentation/utils/awesome_notification/awesome_notification_service.dart'
    show AwesomeNotificationService;
import '../presentation/utils/firebase/messaging/firebase_cloud_messaging_service.dart'
    show FirebaseCloudMessagingService;
import '../utils/functions/has_google_services.dart';

@lazySingleton
class AppInitializer {
  final StorageService _storageService;
  final LocalizationManager _localizationManager;
  final ThemeManager _themeManager;
  final UserProvider _userProvider;
  final AuthProvider _authProvider;
  final AwesomeNotificationService _awesomeNotificationService;
  final FirebaseCloudMessagingService _firebaseCloudMessagingService;

  const AppInitializer(
    @Named(StorageConstants.secureStorage) this._storageService,
    this._localizationManager,
    this._themeManager,
    this._userProvider,
    this._authProvider,
    this._awesomeNotificationService,
    this._firebaseCloudMessagingService,
  );

  /// Essential Initialization (BEFORE runApp)
  // Future<void> initializeEssential() async {
  //
  // }

  /// Light Background Tasks (after runApp)
  Future<void> initializeLight() async {
    final [savedLocale, savedTheme] = await Future.wait([
      _storageService.getString(StorageConstants.localeKey),
      _storageService.getString(StorageConstants.themeKey),
    ]);
    _themeManager.setInitTheme(
      savedTheme != null
          ? BrightnessEnumExtension.getBrightnessValue(savedTheme)
          : Brightness.light,
    );
    _localizationManager.setInitLocal(
      savedLocale?.toLanguagesEnum ?? LanguagesEnum.en,
    );
  }

  /// Heavy Background Tasks (after first frame)
  Future<void> initializeHeavy() async {
    if (Platform.isAndroid && (await hasGoogleServices())) {
      await _awesomeNotificationService.initInstance;
      await _firebaseCloudMessagingService.initNotifications();
    }
  }

  void initAuthAndUserProvider({
    required LoginSessionEntity session,
    bool remembered = true,
  }) {
    _userProvider.setSession(
      user: session.user,
      notificationsEnabled: session.notificationsEnabled,
      token: session.token,
    );
    _authProvider.setAuthStatus(
      remembered
          ? AuthStatus.rememberedAuthenticated
          : AuthStatus.unrememberedAuthenticated,
    );
  }

  void clearAuthAndUserProvider() {
    _userProvider.clear();
    _authProvider.setAuthStatus(AuthStatus.unauthenticated);
  }
}
