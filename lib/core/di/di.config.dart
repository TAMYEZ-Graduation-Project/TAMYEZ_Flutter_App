// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;

import '../auth/auth_provider.dart' as _i658;
import '../auth/data/service/session_service_imp.dart' as _i352;
import '../auth/domain/service/session_storage_service.dart' as _i640;
import '../auth/user_provider.dart' as _i1;
import '../bootstrap/app_initializer.dart' as _i4;
import '../layers/db/contracts/email_repository.dart' as _i150;
import '../layers/db/implementation/email_repository_imp.dart' as _i948;
import '../layers/db/initializer/db_initializer.dart' as _i1006;
import '../layers/localization/l10n/generated/app_localizations.dart' as _i58;
import '../layers/localization/l10n/manager/localization_manager.dart' as _i362;
import '../layers/localization/l10n/register/app_localization_register.dart'
    as _i555;
import '../layers/storage/contracts/storage_service_contract.dart' as _i1003;
import '../layers/storage/implementation/flutter_secure_storage_service_imp.dart'
    as _i856;
import '../layers/storage/initializer/storage_initializer.dart' as _i272;
import '../layers/theme/manager/theme_manager.dart' as _i701;
import '../network/api_config/main_api_config.dart' as _i732;
import '../network/dio/dio_factory.dart' as _i638;
import '../network/dio/network_module.dart' as _i426;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../presentation/error/failure_message_mapper.dart' as _i1019;
import '../presentation/utils/awesome_notification/awesome_notification_service.dart'
    as _i230;
import '../presentation/utils/firebase/messaging/firebase_cloud_messaging_service.dart'
    as _i510;
import '../presentation/utils/firebase/messaging/firebase_messaging_module.dart'
    as _i829;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appLocalizationRegister = _$AppLocalizationRegister();
    final dbInitializer = _$DbInitializer();
    final firebaseMessagingModule = _$FirebaseMessagingModule();
    final storagesInitializer = _$StoragesInitializer();
    final networkModule = _$NetworkModule();
    gh.factory<_i732.MainApiConfig>(() => _i732.MainApiConfig());
    gh.factory<_i638.DioFactory>(() => _i638.DioFactory());
    await gh.factoryAsync<_i58.AppLocalizations>(
      () => appLocalizationRegister.register(),
      preResolve: true,
    );
    await gh.factoryAsync<_i214.Isar>(
      () => dbInitializer.initIsar(),
      preResolve: true,
    );
    gh.lazySingleton<_i1.UserProvider>(() => _i1.UserProvider());
    gh.lazySingleton<_i658.AuthProvider>(() => _i658.AuthProvider());
    gh.lazySingleton<_i1019.FailureHandling>(() => _i1019.FailureHandling());
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => firebaseMessagingModule.create(),
    );
    gh.lazySingleton<_i230.AwesomeNotificationService>(
      () => _i230.AwesomeNotificationService(),
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
    );
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
    gh.lazySingleton<_i510.FirebaseCloudMessagingService>(
      () => _i510.FirebaseCloudMessagingService(
        gh<_i230.AwesomeNotificationService>(),
        gh<_i892.FirebaseMessaging>(),
      ),
    );
    gh.lazySingleton<_i1003.StorageService>(
      () => _i856.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()),
      instanceName: 'secureStorage',
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(
        gh<_i1.UserProvider>(),
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i658.AuthProvider>(),
      ),
    );
    gh.lazySingleton<_i640.SessionStorageService>(
      () => _i352.SessionStorageServiceImp(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.singleton<_i701.ThemeManager>(
      () => _i701.ThemeManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.singleton<_i362.LocalizationManager>(
      () => _i362.LocalizationManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.lazySingleton<_i4.AppInitializer>(
      () => _i4.AppInitializer(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i640.SessionStorageService>(),
        gh<_i362.LocalizationManager>(),
        gh<_i701.ThemeManager>(),
        gh<_i1.UserProvider>(),
        gh<_i658.AuthProvider>(),
        gh<_i230.AwesomeNotificationService>(),
        gh<_i510.FirebaseCloudMessagingService>(),
      ),
    );
    return this;
  }
}

class _$AppLocalizationRegister extends _i555.AppLocalizationRegister {}

class _$DbInitializer extends _i1006.DbInitializer {}

class _$FirebaseMessagingModule extends _i829.FirebaseMessagingModule {}

class _$StoragesInitializer extends _i272.StoragesInitializer {}

class _$NetworkModule extends _i426.NetworkModule {}
