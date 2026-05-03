import 'dart:io' show Platform;
import 'dart:ui' show Brightness;

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:injectable/injectable.dart' show lazySingleton, Named;

import '../../firebase_options.dart' show DefaultFirebaseOptions;
import '../auth/auth_provider.dart';
import '../auth/domain/entities/auth_status.dart';
import '../auth/domain/service/session_storage_service.dart';
import '../auth/user_provider.dart';
import '../functions/has_google_services.dart' show hasGoogleServices;
import '../layers/localization/enums/languages_enum.dart'
    show LanguagesEnum, LanguagesEnumExtension;
import '../layers/localization/l10n/manager/localization_manager.dart';
import '../layers/storage/constants/storage_constants.dart';
import '../layers/storage/contracts/storage_service_contract.dart';
import '../layers/theme/extensions/brightness_enum_extension.dart';
import '../layers/theme/manager/theme_manager.dart';
import '../utils/awesome_notification/awesome_notification_service.dart'
    show AwesomeNotificationService;
import '../utils/firebase/messaging/firebase_cloud_messaging_service.dart'
    show FirebaseCloudMessagingService;

@lazySingleton
class AppInitializer {
  final StorageService _storageService;
  final SessionStorageService _sessionStorage;
  final LocalizationManager _localizationManager;
  final ThemeManager _themeManager;

  final UserProvider _userProvider;

  final AuthProvider _authProvider;
  final AwesomeNotificationService _awesomeNotificationService;
  final FirebaseCloudMessagingService _firebaseCloudMessagingService;

  const AppInitializer(
    @Named(StorageConstants.secureStorage) this._storageService,
    this._sessionStorage,
    this._localizationManager,
    this._themeManager,
    this._userProvider,
    this._authProvider,
    this._awesomeNotificationService,
    this._firebaseCloudMessagingService,
  );

  /// Essential Initialization (BEFORE runApp)
  Future<void> initializeEssential() async {
    final session = await _sessionStorage.restoreSession();

    if (session != null) {
      _userProvider.setSession(user: session.user, token: session.token);
      _authProvider.setAuthStatus(AuthStatus.authenticated);
    } else {
      _userProvider.clear();
      _authProvider.setAuthStatus(AuthStatus.unauthenticated);
    }
  }

  /// Light Background Tasks (after runApp)
  Future<void> initializeLight() async {
    final savedTheme = await _storageService.getString(
      StorageConstants.themeKey,
    );
    _themeManager.setInitTheme(
      savedTheme != null
          ? BrightnessEnumExtension.getBrightnessValue(savedTheme)
          : Brightness.light,
    );

    final savedLocale = await _storageService.getString(
      StorageConstants.localeKey,
    );
    _localizationManager.setInitLocal(
      savedLocale ?? LanguagesEnum.en.getLanguageCode(),
    );
  }

  /// Heavy Background Tasks (after first frame)
  Future<void> initializeHeavy() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (Platform.isAndroid && (await hasGoogleServices())) {
      await _awesomeNotificationService.initInstance;
      await _firebaseCloudMessagingService.initNotifications();
    }
  }
}
