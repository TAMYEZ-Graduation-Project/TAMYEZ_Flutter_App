// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;

import '../../modules/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i376;
import '../../modules/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i405;
import '../../modules/auth/data/data_sources/remote/auth_api_client.dart'
    as _i362;
import '../../modules/auth/data/data_sources/remote/auth_di_module.dart'
    as _i301;
import '../../modules/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i911;
import '../../modules/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i5;
import '../../modules/auth/data/data_sources/remote/social_auth_service.dart'
    as _i622;
import '../../modules/auth/data/data_sources/remote/social_auth_service_imp.dart'
    as _i301;
import '../../modules/auth/data/repositories/auth_repo_imp.dart' as _i23;
import '../../modules/auth/domain/repositories/auth_repository.dart' as _i779;
import '../../modules/auth/domain/use_case/forget_password_use_case.dart'
    as _i347;
import '../../modules/auth/domain/use_case/get_login_session_use_case.dart'
    as _i152;
import '../../modules/auth/domain/use_case/gmail_login_use_case.dart' as _i280;
import '../../modules/auth/domain/use_case/gmail_sign_up_use_case.dart'
    as _i123;
import '../../modules/auth/domain/use_case/login_use_case.dart' as _i46;
import '../../modules/auth/domain/use_case/resend_email_verification_use_case.dart'
    as _i439;
import '../../modules/auth/domain/use_case/reset_password_use_case.dart'
    as _i807;
import '../../modules/auth/domain/use_case/sign_up_use_case.dart' as _i246;
import '../../modules/auth/domain/use_case/verify_code_use_case.dart' as _i5;
import '../../modules/auth/ui/screens/forget_password/view_model/forget_password_view_model.dart'
    as _i202;
import '../../modules/auth/ui/screens/login/view_model/login_view_model.dart'
    as _i1050;
import '../../modules/auth/ui/screens/resend_verification/view_model/resend_verification_email_view_model.dart'
    as _i222;
import '../../modules/auth/ui/screens/sign_up/view_model/sign_up_view_model.dart'
    as _i967;
import '../../modules/career_assessment/data/data_sources/remote/career_assessment_api_client.dart'
    as _i787;
import '../../modules/career_assessment/data/data_sources/remote/career_assessment_remote_data_source.dart'
    as _i250;
import '../../modules/career_assessment/data/data_sources/remote/career_assessment_remote_data_source_imp.dart'
    as _i787;
import '../../modules/career_assessment/data/repositories/career_assessment_repo_imp.dart'
    as _i456;
import '../../modules/career_assessment/domain/repositories/career_assessment_repo.dart'
    as _i201;
import '../../modules/career_assessment/domain/use_cases/check_career_assessment_answers_use_case.dart'
    as _i610;
import '../../modules/career_assessment/domain/use_cases/choose_suggested_career_use_case.dart'
    as _i80;
import '../../modules/career_assessment/domain/use_cases/get_career_assessment_questions.dart'
    as _i508;
import '../../modules/career_assessment/ui/screens/career_assessment/view_model/career_assessment_view_model.dart'
    as _i365;
import '../../modules/career_assessment/ui/screens/top_career_matches/view_model/top_career_matches_view_model.dart'
    as _i455;
import '../auth_providers/auth_provider.dart' as _i842;
import '../auth_providers/user_provider.dart' as _i9;
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
import '../presentation/utils/awesome_notification/awesome_notification_service.dart'
    as _i230;
import '../presentation/utils/firebase/messaging/firebase_cloud_messaging_service.dart'
    as _i510;
import '../presentation/utils/firebase/messaging/firebase_messaging_module.dart'
    as _i829;
import '../utils/counter/count_down_utility.dart' as _i497;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dbInitializer = _$DbInitializer();
    final appLocalizationRegister = _$AppLocalizationRegister();
    final storagesInitializer = _$StoragesInitializer();
    final firebaseMessagingModule = _$FirebaseMessagingModule();
    final authDiModule = _$AuthDiModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i214.Isar>(
      () => dbInitializer.initIsar(),
      preResolve: true,
    );
    await gh.factoryAsync<_i58.AppLocalizations>(
      () => appLocalizationRegister.register(),
      preResolve: true,
    );
    gh.factory<_i732.MainApiConfig>(() => _i732.MainApiConfig());
    gh.factory<_i638.DioFactory>(() => _i638.DioFactory());
    gh.factory<_i497.CountDownUtility>(() => _i497.CountDownUtility());
    gh.lazySingleton<_i842.AuthProvider>(() => _i842.AuthProvider());
    gh.lazySingleton<_i9.UserProvider>(() => _i9.UserProvider());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
    );
    gh.lazySingleton<_i230.AwesomeNotificationService>(
      () => _i230.AwesomeNotificationService(),
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => firebaseMessagingModule.create(),
    );
    gh.lazySingleton<_i116.GoogleSignIn>(() => authDiModule.googleSignIn());
    gh.factory<_i622.SocialAuthService>(
      () => _i301.SocialAuthServiceImp(gh<_i116.GoogleSignIn>()),
    );
    gh.lazySingleton<_i1003.StorageService>(
      () => _i856.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()),
      instanceName: 'secureStorage',
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.createMainDio(
        gh<_i638.DioFactory>(),
        gh<_i732.MainApiConfig>(),
      ),
      instanceName: 'mainDio',
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(
        gh<_i9.UserProvider>(),
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i842.AuthProvider>(),
      ),
    );
    gh.lazySingleton<_i362.AuthApiClient>(
      () => _i362.AuthApiClient(gh<_i361.Dio>(instanceName: 'mainDio')),
    );
    gh.lazySingleton<_i787.CareerAssessmentApiClient>(
      () => _i787.CareerAssessmentApiClient(
        gh<_i361.Dio>(instanceName: 'mainDio'),
      ),
    );
    gh.factory<_i911.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImp(gh<_i362.AuthApiClient>()),
    );
    gh.factory<_i150.EmailRepository>(
      () => _i948.EmailRepositoryImp(gh<_i214.Isar>()),
    );
    gh.factory<_i376.AuthLocalDataSource>(
      () => _i405.AuthLocalDataSourceImp(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.singleton<_i362.LocalizationManager>(
      () => _i362.LocalizationManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.singleton<_i701.ThemeManager>(
      () => _i701.ThemeManager(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.factory<_i250.CareerAssessmentRemoteDataSource>(
      () => _i787.CareerAssessmentRemoteDataSourceImp(
        gh<_i787.CareerAssessmentApiClient>(),
      ),
    );
    gh.lazySingleton<_i510.FirebaseCloudMessagingService>(
      () => _i510.FirebaseCloudMessagingService(
        gh<_i230.AwesomeNotificationService>(),
        gh<_i892.FirebaseMessaging>(),
      ),
    );
    gh.factory<_i779.AuthRepository>(
      () => _i23.AuthRepoImp(
        gh<_i911.AuthRemoteDataSource>(),
        gh<_i622.SocialAuthService>(),
        gh<_i376.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i201.CareerAssessmentRepo>(
      () => _i456.CareerAssessmentRepoImp(
        gh<_i250.CareerAssessmentRemoteDataSource>(),
      ),
    );
    gh.factory<_i347.ForgetPasswordUseCase>(
      () => _i347.ForgetPasswordUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i152.GetLoginSessionUseCase>(
      () => _i152.GetLoginSessionUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i280.GmailLoginUseCase>(
      () => _i280.GmailLoginUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i123.GmailSignUpUseCase>(
      () => _i123.GmailSignUpUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i46.LoginUseCase>(
      () => _i46.LoginUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i439.ResendEmailVerificationUseCase>(
      () => _i439.ResendEmailVerificationUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i807.ResetPasswordUseCase>(
      () => _i807.ResetPasswordUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i246.SignUpUseCase>(
      () => _i246.SignUpUseCase(gh<_i779.AuthRepository>()),
    );
    gh.factory<_i5.VerifyCodeUseCase>(
      () => _i5.VerifyCodeUseCase(gh<_i779.AuthRepository>()),
    );
    gh.lazySingleton<_i4.AppInitializer>(
      () => _i4.AppInitializer(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i362.LocalizationManager>(),
        gh<_i701.ThemeManager>(),
        gh<_i9.UserProvider>(),
        gh<_i842.AuthProvider>(),
        gh<_i230.AwesomeNotificationService>(),
        gh<_i510.FirebaseCloudMessagingService>(),
      ),
    );
    gh.factory<_i610.CheckCareerAssessmentAnswersUseCase>(
      () => _i610.CheckCareerAssessmentAnswersUseCase(
        gh<_i201.CareerAssessmentRepo>(),
      ),
    );
    gh.factory<_i80.ChooseSuggestedCareerUseCase>(
      () => _i80.ChooseSuggestedCareerUseCase(gh<_i201.CareerAssessmentRepo>()),
    );
    gh.factory<_i508.GetCareerAssessmentQuestionsUseCase>(
      () => _i508.GetCareerAssessmentQuestionsUseCase(
        gh<_i201.CareerAssessmentRepo>(),
      ),
    );
    gh.factory<_i202.ForgetPasswordViewModel>(
      () => _i202.ForgetPasswordViewModel(
        gh<_i347.ForgetPasswordUseCase>(),
        gh<_i5.VerifyCodeUseCase>(),
        gh<_i807.ResetPasswordUseCase>(),
        gh<_i497.CountDownUtility>(),
      ),
    );
    gh.factory<_i967.SignUpViewModel>(
      () => _i967.SignUpViewModel(
        gh<_i246.SignUpUseCase>(),
        gh<_i123.GmailSignUpUseCase>(),
      ),
    );
    gh.factory<_i455.TopCareerMatchesViewModel>(
      () => _i455.TopCareerMatchesViewModel(
        gh<_i80.ChooseSuggestedCareerUseCase>(),
      ),
    );
    gh.factory<_i1050.LoginViewModel>(
      () => _i1050.LoginViewModel(
        gh<_i46.LoginUseCase>(),
        gh<_i280.GmailLoginUseCase>(),
      ),
    );
    gh.factory<_i222.ResendVerificationEmailViewModel>(
      () => _i222.ResendVerificationEmailViewModel(
        gh<_i439.ResendEmailVerificationUseCase>(),
      ),
    );
    gh.factory<_i365.CareerAssessmentViewModel>(
      () => _i365.CareerAssessmentViewModel(
        gh<_i508.GetCareerAssessmentQuestionsUseCase>(),
        gh<_i610.CheckCareerAssessmentAnswersUseCase>(),
      ),
    );
    return this;
  }
}

class _$DbInitializer extends _i1006.DbInitializer {}

class _$AppLocalizationRegister extends _i555.AppLocalizationRegister {}

class _$StoragesInitializer extends _i272.StoragesInitializer {}

class _$FirebaseMessagingModule extends _i829.FirebaseMessagingModule {}

class _$AuthDiModule extends _i301.AuthDiModule {}

class _$NetworkModule extends _i426.NetworkModule {}
