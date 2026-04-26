// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;

import '../auth/auth_provider.dart' as _i658;
import '../layers/db/contracts/email_repository.dart' as _i150;
import '../layers/db/implementation/email_repository_imp.dart' as _i948;
import '../layers/db/initializer/db_initializer.dart' as _i1006;
import '../layers/localization/initializer/locale_initializer.dart' as _i806;
import '../layers/localization/l10n/generated/app_localizations.dart' as _i58;
import '../layers/localization/l10n/manager/localization_manager.dart' as _i362;
import '../layers/localization/l10n/register/app_localization_register.dart'
    as _i555;
import '../layers/storage/contracts/storage_service_contract.dart' as _i1003;
import '../layers/storage/implementation/flutter_secure_storage_service_imp.dart'
    as _i856;
import '../layers/storage/initializer/storage_initializer.dart' as _i272;
import '../layers/theme/initializer/theme_initializer.dart' as _i990;
import '../layers/theme/manager/theme_manager.dart' as _i701;
import '../network/api_config/main_api_config.dart' as _i732;
import '../network/dio/dio_factory.dart' as _i638;
import '../network/dio/network_module.dart' as _i426;
import '../network/error/api_error_handler.dart' as _i576;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../utils/awesome_notification/awesome_notification_service.dart'
    as _i243;
import '../utils/firebase/messaging/firebase_cloud_messaging_service.dart'
    as _i760;
import '../validation/validation_functions.dart' as _i166;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dbInitializer = _$DbInitializer();
    final storagesInitializer = _$StoragesInitializer();
    final networkModule = _$NetworkModule();
    final localeInitializer = _$LocaleInitializer();
    final themeInitializer = _$ThemeInitializer();
    final appLocalizationRegister = _$AppLocalizationRegister();
    gh.factory<_i638.DioFactory>(() => _i638.DioFactory());
    await gh.factoryAsync<_i214.Isar>(
      () => dbInitializer.initIsar(),
      preResolve: true,
    );
    gh.factory<_i732.MainApiConfig>(() => _i732.MainApiConfig());
    gh.lazySingleton<_i243.AwesomeNotificationService>(
      () => _i243.AwesomeNotificationService(),
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
    );
    gh.lazySingleton<_i658.AuthProvider>(() => _i658.AuthProvider());
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.createMainDio(
        gh<_i638.DioFactory>(),
        gh<_i732.MainApiConfig>(),
      ),
      instanceName: 'mainDio',
    );
    gh.factory<_i150.EmailRepository>(
      () => _i948.EmailRepositoryImp(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i760.FirebaseCloudMessagingService>(
      () => _i760.FirebaseCloudMessagingService(
        gh<_i243.AwesomeNotificationService>(),
      ),
    );
    gh.lazySingleton<_i1003.StorageService>(
      () => _i856.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()),
      instanceName: 'secureStorage',
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i658.AuthProvider>(),
      ),
    );
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    await gh.factoryAsync<_i990.InitialTheme>(
      () => themeInitializer.getInitCurrentTheme(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
      instanceName: 'InitialCurrentTheme',
      preResolve: true,
    );
    await gh.factoryAsync<_i58.AppLocalizations>(
      () => appLocalizationRegister.register(
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
      preResolve: true,
    );
    gh.singleton<_i362.LocalizationManager>(
      () => _i362.LocalizationManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
    );
    gh.singleton<_i701.ThemeManager>(
      () => _i701.ThemeManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i990.InitialTheme>(instanceName: 'InitialCurrentTheme'),
      ),
    );
    gh.lazySingleton<_i576.ApiErrorHandler>(
      () => _i576.ApiErrorHandler(gh<_i58.AppLocalizations>()),
    );
    gh.lazySingleton<_i166.ValidateFunctions>(
      () => _i166.ValidateFunctions(gh<_i58.AppLocalizations>()),
    );
    return this;
  }
}

class _$DbInitializer extends _i1006.DbInitializer {}

class _$StoragesInitializer extends _i272.StoragesInitializer {}

class _$NetworkModule extends _i426.NetworkModule {}

class _$LocaleInitializer extends _i806.LocaleInitializer {}

class _$ThemeInitializer extends _i990.ThemeInitializer {}

class _$AppLocalizationRegister extends _i555.AppLocalizationRegister {}
