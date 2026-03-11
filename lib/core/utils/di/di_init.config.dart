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

import '../../api/callers/dio/dio_service.dart' as _i388;
import '../../api/error/api_error_handler.dart' as _i1036;
import '../../layers/db/contracts/email_repository.dart' as _i506;
import '../../layers/db/implementation/email_repository_imp.dart' as _i696;
import '../../layers/db/initializer/db_initializer.dart' as _i480;
import '../../layers/localization/initializer/locale_initializer.dart' as _i907;
import '../../layers/localization/l10n/generated/app_localizations.dart'
    as _i530;
import '../../layers/localization/l10n/manager/localization_manager.dart'
    as _i225;
import '../../layers/localization/l10n/register/app_localization_register.dart'
    as _i1049;
import '../../layers/storage/contracts/storage_service_contract.dart' as _i99;
import '../../layers/storage/implementation/flutter_secure_storage_service_imp.dart'
    as _i404;
import '../../layers/storage/initializer/storage_initializer.dart' as _i310;
import '../../layers/theme/initializer/theme_initializer.dart' as _i819;
import '../../layers/theme/manager/theme_manager.dart' as _i412;
import '../../validation/validation_functions.dart' as _i696;
import '../awesome_notification/awesome_notification_service.dart' as _i332;
import '../firebase/messaging/firebase_cloud_messaging_service.dart' as _i983;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dbInitializer = _$DbInitializer();
    final dioService = _$DioService();
    final storagesInitializer = _$StoragesInitializer();
    final localeInitializer = _$LocaleInitializer();
    final themeInitializer = _$ThemeInitializer();
    final appLocalizationRegister = _$AppLocalizationRegister();
    await gh.factoryAsync<_i214.Isar>(
      () => dbInitializer.initIsar(),
      preResolve: true,
    );
    gh.lazySingleton<_i332.AwesomeNotificationService>(
      () => _i332.AwesomeNotificationService(),
    );
    gh.lazySingleton<_i361.Dio>(() => dioService.getInstance());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
    );
    gh.factory<_i506.EmailRepository>(
      () => _i696.EmailRepositoryImp(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i983.FirebaseCloudMessagingService>(
      () => _i983.FirebaseCloudMessagingService(
        gh<_i332.AwesomeNotificationService>(),
      ),
    );
    gh.lazySingleton<_i99.StorageService>(
      () => _i404.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()),
      instanceName: 'secureStorage',
    );
    await gh.factoryAsync<String>(
      () => localeInitializer.initCurrentLocal(
        gh<_i99.StorageService>(instanceName: 'secureStorage'),
      ),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    await gh.factoryAsync<_i819.InitialTheme>(
      () => themeInitializer.getInitCurrentTheme(
        gh<_i99.StorageService>(instanceName: 'secureStorage'),
      ),
      instanceName: 'InitialCurrentTheme',
      preResolve: true,
    );
    await gh.factoryAsync<_i530.AppLocalizations>(
      () => appLocalizationRegister.register(
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
      preResolve: true,
    );
    gh.singleton<_i225.LocalizationManager>(
      () => _i225.LocalizationManager(
        gh<_i99.StorageService>(instanceName: 'secureStorage'),
        gh<String>(instanceName: 'initCurrentLocal'),
      ),
    );
    gh.singleton<_i412.ThemeManager>(
      () => _i412.ThemeManager(
        gh<_i99.StorageService>(instanceName: 'secureStorage'),
        gh<_i819.InitialTheme>(instanceName: 'InitialCurrentTheme'),
      ),
    );
    gh.lazySingleton<_i1036.ApiErrorHandler>(
      () => _i1036.ApiErrorHandler(gh<_i530.AppLocalizations>()),
    );
    gh.lazySingleton<_i696.ValidateFunctions>(
      () => _i696.ValidateFunctions(gh<_i530.AppLocalizations>()),
    );
    return this;
  }
}

class _$DbInitializer extends _i480.DbInitializer {}

class _$DioService extends _i388.DioService {}

class _$StoragesInitializer extends _i310.StoragesInitializer {}

class _$LocaleInitializer extends _i907.LocaleInitializer {}

class _$ThemeInitializer extends _i819.ThemeInitializer {}

class _$AppLocalizationRegister extends _i1049.AppLocalizationRegister {}
