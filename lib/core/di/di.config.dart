// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:uuid/uuid.dart' as _i706;

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
import '../../modules/career_assessment/domain/use_cases/get_career_details_use_case.dart'
    as _i206;
import '../../modules/career_assessment/ui/screens/career_assessment/view_model/career_assessment_view_model.dart'
    as _i365;
import '../../modules/career_assessment/ui/screens/career_details/view_model/career_details_screen_view_model.dart'
    as _i582;
import '../../modules/career_assessment/ui/screens/top_career_matches/view_model/top_career_matches_view_model.dart'
    as _i455;
import '../../modules/profile/data/data_sources/local/profile_local_data_source.dart'
    as _i72;
import '../../modules/profile/data/data_sources/local/profile_local_data_source_imp.dart'
    as _i844;
import '../../modules/profile/data/data_sources/remote/profile_api_client.dart'
    as _i872;
import '../../modules/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i929;
import '../../modules/profile/data/data_sources/remote/profile_remote_data_source_imp.dart'
    as _i442;
import '../../modules/profile/data/repositories/profile_repository_imp.dart'
    as _i795;
import '../../modules/profile/domain/repositories/profile_repository.dart'
    as _i496;
import '../../modules/profile/domain/use_cases/change_password_use_case.dart'
    as _i516;
import '../../modules/profile/domain/use_cases/delete_account_use_case.dart'
    as _i648;
import '../../modules/profile/domain/use_cases/disable_notifications_use_case.dart'
    as _i11;
import '../../modules/profile/domain/use_cases/edit_user_profile_use_case.dart'
    as _i570;
import '../../modules/profile/domain/use_cases/enable_notifications_use_case.dart'
    as _i389;
import '../../modules/profile/domain/use_cases/get_user_profile_use_case.dart'
    as _i18;
import '../../modules/profile/domain/use_cases/logout_use_case.dart' as _i128;
import '../../modules/profile/domain/use_cases/refresh_fcm_token_use_case.dart'
    as _i967;
import '../../modules/profile/domain/use_cases/sync_profile_use_case.dart'
    as _i117;
import '../../modules/profile/domain/use_cases/upload_profile_picture_use_case.dart'
    as _i404;
import '../../modules/profile/ui/screens/change_password/change_password_view_model/change_password_view_model.dart'
    as _i916;
import '../../modules/profile/ui/screens/edit_profile/view_model/edit_profile_view_model.dart'
    as _i219;
import '../../modules/profile/ui/screens/profile/view_model/profile_view_model.dart'
    as _i88;
import '../../modules/quiz/data/data_sources/local/saved_quiz_local_data_source.dart'
    as _i190;
import '../../modules/quiz/data/data_sources/local/saved_quiz_local_data_source_imp.dart'
    as _i936;
import '../../modules/quiz/data/data_sources/local/saved_quizzes_pagination_local_data_source.dart'
    as _i929;
import '../../modules/quiz/data/data_sources/local/saved_quizzes_pagination_local_data_source_imp.dart'
    as _i269;
import '../../modules/quiz/data/data_sources/remote/quiz_api_client.dart'
    as _i692;
import '../../modules/quiz/data/data_sources/remote/quiz_remote_data_source.dart'
    as _i249;
import '../../modules/quiz/data/data_sources/remote/quiz_remote_data_source_imp.dart'
    as _i365;
import '../../modules/quiz/data/local_models/saved_quiz_local.dart' as _i242;
import '../../modules/quiz/data/local_models/saved_quizzes_pagination_local.dart'
    as _i568;
import '../../modules/quiz/data/repositories/quiz_repository_imp.dart' as _i882;
import '../../modules/quiz/domain/repositories/quiz_repository.dart' as _i139;
import '../../modules/quiz/domain/use_cases/check_quiz_answers_use_case.dart'
    as _i419;
import '../../modules/quiz/domain/use_cases/get_quiz_questions_use_case.dart'
    as _i383;
import '../../modules/quiz/domain/use_cases/get_saved_quiz_use_case.dart'
    as _i502;
import '../../modules/quiz/domain/use_cases/get_saved_quizzes_use_case.dart'
    as _i638;
import '../../modules/quiz/ui/screens/quiz/view_model/quiz_view_model.dart'
    as _i426;
import '../../modules/quiz/ui/screens/saved_quiz/view_model/saved_quiz_view_model.dart'
    as _i1056;
import '../../modules/quiz/ui/screens/saved_quizzes/view_model/saved_quizzes_view_model.dart'
    as _i95;
import '../../modules/roadmap/data/data_sources/local/career_local_data_source.dart'
    as _i169;
import '../../modules/roadmap/data/data_sources/local/career_local_data_source_imp.dart'
    as _i196;
import '../../modules/roadmap/data/data_sources/local/roadmap_local_data_source.dart'
    as _i908;
import '../../modules/roadmap/data/data_sources/local/roadmap_local_data_source_imp.dart'
    as _i513;
import '../../modules/roadmap/data/data_sources/remote/roadmap_api_client.dart'
    as _i935;
import '../../modules/roadmap/data/data_sources/remote/roadmap_remote_data_source.dart'
    as _i114;
import '../../modules/roadmap/data/data_sources/remote/roadmap_remote_data_source_imp.dart'
    as _i430;
import '../../modules/roadmap/data/local_models/career_local.dart' as _i1005;
import '../../modules/roadmap/data/local_models/roadmap_step_local.dart'
    as _i835;
import '../../modules/roadmap/data/repositories/roadmap_repository_imp.dart'
    as _i1027;
import '../../modules/roadmap/domain/repositories/roadmap_repository.dart'
    as _i504;
import '../../modules/roadmap/domain/use_cases/get_career_details_use_case.dart'
    as _i318;
import '../../modules/roadmap/domain/use_cases/get_roadmap_step_details_use_case.dart'
    as _i580;
import '../../modules/roadmap/domain/use_cases/get_roadmap_steps_use_case.dart'
    as _i1009;
import '../../modules/roadmap/ui/screens/roadmap_screen/view_model/roadmap_view_model.dart'
    as _i612;
import '../../modules/roadmap/ui/screens/roadmap_step_details/view_model/roadmap_step_details_view_model.dart'
    as _i368;
import '../auth_providers/auth_provider.dart' as _i842;
import '../auth_providers/user_provider.dart' as _i9;
import '../bootstrap/app_initializer.dart' as _i4;
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
import '../presentation/screens/home_screen/view_model/home_view_model.dart'
    as _i346;
import '../presentation/utils/awesome_notification/awesome_notification_service.dart'
    as _i230;
import '../presentation/utils/firebase/messaging/firebase_cloud_messaging_service.dart'
    as _i510;
import '../presentation/utils/firebase/messaging/firebase_messaging_module.dart'
    as _i829;
import '../presentation/utils/image_picker/image_picker_di_module.dart'
    as _i252;
import '../presentation/utils/image_picker/image_picker_service.dart' as _i683;
import '../presentation/utils/image_picker/image_picker_service_imp.dart'
    as _i141;
import '../presentation/utils/url_opener/url_opener.dart' as _i352;
import '../presentation/utils/url_opener/url_opener_imp.dart' as _i194;
import '../utils/counter/count_down_utility.dart' as _i497;
import '../utils/device_id/device_id_di_module.dart' as _i388;
import '../utils/device_id/device_id_service.dart' as _i413;
import '../utils/device_info/device_info_di_module.dart' as _i1043;
import '../utils/device_info/device_info_service.dart' as _i416;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dbInitializer = _$DbInitializer();
    final appLocalizationRegister = _$AppLocalizationRegister();
    final deviceInfoDiModule = _$DeviceInfoDiModule();
    final storagesInitializer = _$StoragesInitializer();
    final firebaseMessagingModule = _$FirebaseMessagingModule();
    final imagePickerDiModule = _$ImagePickerDiModule();
    final deviceIdDiModule = _$DeviceIdDiModule();
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
    gh.factory<_i346.HomeViewModel>(() => _i346.HomeViewModel());
    gh.factory<_i497.CountDownUtility>(() => _i497.CountDownUtility());
    await gh.factoryAsync<_i655.PackageInfo>(
      () => deviceInfoDiModule.packageInfo,
      preResolve: true,
    );
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
    gh.lazySingleton<_i183.ImagePicker>(
      () => imagePickerDiModule.providerImagePicker(),
    );
    gh.lazySingleton<_i706.Uuid>(() => deviceIdDiModule.provideUuid());
    gh.lazySingleton<_i833.DeviceInfoPlugin>(
      () => deviceInfoDiModule.deviceInfoService,
    );
    gh.lazySingleton<_i116.GoogleSignIn>(() => authDiModule.googleSignIn());
    gh.factory<_i622.SocialAuthService>(
      () => _i301.SocialAuthServiceImp(gh<_i116.GoogleSignIn>()),
    );
    gh.lazySingleton<_i352.UrlOpener>(() => _i194.UrlOpenerImp());
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
    gh.lazySingleton<_i872.ProfileApiClient>(
      () => _i872.ProfileApiClient(gh<_i361.Dio>(instanceName: 'mainDio')),
    );
    gh.lazySingleton<_i692.QuizApiClient>(
      () => _i692.QuizApiClient(gh<_i361.Dio>(instanceName: 'mainDio')),
    );
    gh.lazySingleton<_i935.RoadmapApiClient>(
      () => _i935.RoadmapApiClient(gh<_i361.Dio>(instanceName: 'mainDio')),
    );
    gh.factory<_i911.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImp(gh<_i362.AuthApiClient>()),
    );
    gh.factory<_i114.RoadmapRemoteDataSource>(
      () => _i430.RoadmapRemoteDataSourceImp(gh<_i935.RoadmapApiClient>()),
    );
    gh.factory<_i683.ImagePickerService>(
      () => _i141.ImagePickerServiceImpl(gh<_i183.ImagePicker>()),
    );
    gh.factory<_i413.DeviceIdService>(
      () => _i413.DeviceIdService(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
        gh<_i706.Uuid>(),
      ),
    );
    gh.factory<_i72.ProfileLocalDataSource>(
      () => _i844.ProfileLocalDataSourceImp(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.factory<_i376.AuthLocalDataSource>(
      () => _i405.AuthLocalDataSourceImp(
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.factory<_i779.AuthRepository>(
      () => _i23.AuthRepoImp(
        gh<_i911.AuthRemoteDataSource>(),
        gh<_i622.SocialAuthService>(),
        gh<_i376.AuthLocalDataSource>(),
        gh<_i413.DeviceIdService>(),
        gh<_i892.FirebaseMessaging>(),
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
    gh.factory<_i416.DeviceInfoService>(
      () => _i416.DeviceInfoService(
        gh<_i833.DeviceInfoPlugin>(),
        gh<_i655.PackageInfo>(),
      ),
    );
    gh.lazySingleton<_i214.IsarCollection<_i1005.CareerLocal>>(
      () => dbInitializer.careerCollection(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i214.IsarCollection<_i835.RoadmapStepLocal>>(
      () => dbInitializer.roadmapCollection(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i214.IsarCollection<_i568.SavedQuizzesPaginationLocal>>(
      () => dbInitializer.savedQuizzesPaginationCollection(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i214.IsarCollection<_i242.SavedQuizLocal>>(
      () => dbInitializer.savedQuizCollection(gh<_i214.Isar>()),
    );
    gh.factory<_i250.CareerAssessmentRemoteDataSource>(
      () => _i787.CareerAssessmentRemoteDataSourceImp(
        gh<_i787.CareerAssessmentApiClient>(),
      ),
    );
    gh.factory<_i190.SavedQuizLocalDataSource>(
      () => _i936.SavedQuizLocalDataSourceImp(
        gh<_i214.Isar>(),
        gh<_i214.IsarCollection<_i242.SavedQuizLocal>>(),
      ),
    );
    gh.factory<_i249.QuizRemoteDataSource>(
      () => _i365.QuizRemoteDataSourceImp(gh<_i692.QuizApiClient>()),
    );
    gh.factory<_i929.SavedQuizzesPaginationLocalDataSource>(
      () => _i269.SavedQuizzesPaginationLocalDataSourceImp(
        gh<_i214.Isar>(),
        gh<_i214.IsarCollection<_i568.SavedQuizzesPaginationLocal>>(),
      ),
    );
    gh.factory<_i929.ProfileRemoteDataSource>(
      () => _i442.ProfileRemoteDataSourceImp(gh<_i872.ProfileApiClient>()),
    );
    gh.factory<_i496.ProfileRepository>(
      () => _i795.ProfileRepositoryImp(
        gh<_i929.ProfileRemoteDataSource>(),
        gh<_i72.ProfileLocalDataSource>(),
        gh<_i413.DeviceIdService>(),
        gh<_i892.FirebaseMessaging>(),
        gh<_i416.DeviceInfoService>(),
      ),
    );
    gh.factory<_i908.RoadmapLocalDataSource>(
      () => _i513.RoadmapLocalDataSourceImp(
        gh<_i214.Isar>(),
        gh<_i214.IsarCollection<_i835.RoadmapStepLocal>>(),
      ),
    );
    gh.factory<_i201.CareerAssessmentRepo>(
      () => _i456.CareerAssessmentRepoImp(
        gh<_i250.CareerAssessmentRemoteDataSource>(),
        gh<_i1003.StorageService>(instanceName: 'secureStorage'),
      ),
    );
    gh.factory<_i169.CareerLocalDataSource>(
      () => _i196.CareerLocalDataSourceImp(
        gh<_i214.Isar>(),
        gh<_i214.IsarCollection<_i1005.CareerLocal>>(),
      ),
    );
    gh.factory<_i516.ChangePasswordUseCase>(
      () => _i516.ChangePasswordUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i648.DeleteAccountUseCase>(
      () => _i648.DeleteAccountUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i11.DisableNotificationsUseCase>(
      () => _i11.DisableNotificationsUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i570.EditUserProfileUseCase>(
      () => _i570.EditUserProfileUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i389.EnableNotificationsUseCase>(
      () => _i389.EnableNotificationsUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i18.GetUserProfileUseCase>(
      () => _i18.GetUserProfileUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i128.LogoutUseCase>(
      () => _i128.LogoutUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i967.RefreshFcmTokenUseCase>(
      () => _i967.RefreshFcmTokenUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i117.SyncProfileUseCase>(
      () => _i117.SyncProfileUseCase(gh<_i496.ProfileRepository>()),
    );
    gh.factory<_i404.UploadProfilePictureUseCase>(
      () => _i404.UploadProfilePictureUseCase(gh<_i496.ProfileRepository>()),
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
    gh.factory<_i139.QuizRepository>(
      () => _i882.QuizRepositoryImp(
        gh<_i249.QuizRemoteDataSource>(),
        gh<_i214.Isar>(),
        gh<_i929.SavedQuizzesPaginationLocalDataSource>(),
        gh<_i190.SavedQuizLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i510.FirebaseCloudMessagingService>(
      () => _i510.FirebaseCloudMessagingService(
        gh<_i230.AwesomeNotificationService>(),
        gh<_i892.FirebaseMessaging>(),
        gh<_i967.RefreshFcmTokenUseCase>(),
        gh<_i9.UserProvider>(),
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
    gh.factory<_i206.GetCareerDetailsUseCase>(
      () => _i206.GetCareerDetailsUseCase(gh<_i201.CareerAssessmentRepo>()),
    );
    gh.factory<_i504.RoadmapRepository>(
      () => _i1027.RoadmapRepositoryImp(
        gh<_i214.Isar>(),
        gh<_i114.RoadmapRemoteDataSource>(),
        gh<_i169.CareerLocalDataSource>(),
        gh<_i908.RoadmapLocalDataSource>(),
      ),
    );
    gh.factory<_i582.CareerDetailsViewModel>(
      () => _i582.CareerDetailsViewModel(gh<_i206.GetCareerDetailsUseCase>()),
    );
    gh.factory<_i202.ForgetPasswordViewModel>(
      () => _i202.ForgetPasswordViewModel(
        gh<_i347.ForgetPasswordUseCase>(),
        gh<_i5.VerifyCodeUseCase>(),
        gh<_i807.ResetPasswordUseCase>(),
        gh<_i497.CountDownUtility>(),
      ),
    );
    gh.factory<_i455.TopCareerMatchesViewModel>(
      () => _i455.TopCareerMatchesViewModel(
        gh<_i80.ChooseSuggestedCareerUseCase>(),
        gh<_i9.UserProvider>(),
      ),
    );
    gh.factory<_i219.EditProfileViewModel>(
      () => _i219.EditProfileViewModel(
        gh<_i683.ImagePickerService>(),
        gh<_i570.EditUserProfileUseCase>(),
        gh<_i404.UploadProfilePictureUseCase>(),
        gh<_i18.GetUserProfileUseCase>(),
        gh<_i842.AuthProvider>(),
        gh<_i9.UserProvider>(),
      ),
    );
    gh.factory<_i419.CheckQuizAnswersUseCase>(
      () => _i419.CheckQuizAnswersUseCase(gh<_i139.QuizRepository>()),
    );
    gh.factory<_i383.GetQuizQuestionsUseCase>(
      () => _i383.GetQuizQuestionsUseCase(gh<_i139.QuizRepository>()),
    );
    gh.factory<_i502.GetSavedQuizUseCase>(
      () => _i502.GetSavedQuizUseCase(gh<_i139.QuizRepository>()),
    );
    gh.factory<_i638.GetSavedQuizzesUseCase>(
      () => _i638.GetSavedQuizzesUseCase(gh<_i139.QuizRepository>()),
    );
    gh.factory<_i916.ChangePasswordViewModel>(
      () => _i916.ChangePasswordViewModel(
        gh<_i516.ChangePasswordUseCase>(),
        gh<_i9.UserProvider>(),
        gh<_i842.AuthProvider>(),
      ),
    );
    gh.factory<_i222.ResendVerificationEmailViewModel>(
      () => _i222.ResendVerificationEmailViewModel(
        gh<_i439.ResendEmailVerificationUseCase>(),
      ),
    );
    gh.factory<_i318.GetUserCareerUseCase>(
      () => _i318.GetUserCareerUseCase(gh<_i504.RoadmapRepository>()),
    );
    gh.factory<_i580.GetRoadmapStepDetailsUseCase>(
      () => _i580.GetRoadmapStepDetailsUseCase(gh<_i504.RoadmapRepository>()),
    );
    gh.factory<_i1009.GetRoadmapStepsUseCase>(
      () => _i1009.GetRoadmapStepsUseCase(gh<_i504.RoadmapRepository>()),
    );
    gh.factory<_i95.SavedQuizzesViewModel>(
      () => _i95.SavedQuizzesViewModel(
        gh<_i638.GetSavedQuizzesUseCase>(),
        gh<_i9.UserProvider>(),
      ),
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
    gh.factory<_i365.CareerAssessmentViewModel>(
      () => _i365.CareerAssessmentViewModel(
        gh<_i508.GetCareerAssessmentQuestionsUseCase>(),
        gh<_i610.CheckCareerAssessmentAnswersUseCase>(),
      ),
    );
    gh.factory<_i1056.SavedQuizViewModel>(
      () => _i1056.SavedQuizViewModel(gh<_i502.GetSavedQuizUseCase>()),
    );
    gh.factory<_i368.RoadmapStepDetailsViewModel>(
      () => _i368.RoadmapStepDetailsViewModel(
        gh<_i580.GetRoadmapStepDetailsUseCase>(),
      ),
    );
    gh.factory<_i426.QuizViewModel>(
      () => _i426.QuizViewModel(
        gh<_i383.GetQuizQuestionsUseCase>(),
        gh<_i419.CheckQuizAnswersUseCase>(),
        gh<_i497.CountDownUtility>(),
      ),
    );
    gh.factory<_i1050.LoginViewModel>(
      () => _i1050.LoginViewModel(
        gh<_i46.LoginUseCase>(),
        gh<_i280.GmailLoginUseCase>(),
        gh<_i4.AppInitializer>(),
      ),
    );
    gh.factory<_i88.ProfileViewModel>(
      () => _i88.ProfileViewModel(
        gh<_i128.LogoutUseCase>(),
        gh<_i648.DeleteAccountUseCase>(),
        gh<_i117.SyncProfileUseCase>(),
        gh<_i9.UserProvider>(),
        gh<_i4.AppInitializer>(),
        gh<_i389.EnableNotificationsUseCase>(),
        gh<_i11.DisableNotificationsUseCase>(),
      ),
    );
    gh.factory<_i612.RoadmapViewModel>(
      () => _i612.RoadmapViewModel(
        gh<_i318.GetUserCareerUseCase>(),
        gh<_i1009.GetRoadmapStepsUseCase>(),
        gh<_i9.UserProvider>(),
      ),
    );
    gh.factory<_i967.SignUpViewModel>(
      () => _i967.SignUpViewModel(
        gh<_i246.SignUpUseCase>(),
        gh<_i123.GmailSignUpUseCase>(),
        gh<_i4.AppInitializer>(),
      ),
    );
    return this;
  }
}

class _$DbInitializer extends _i1006.DbInitializer {}

class _$AppLocalizationRegister extends _i555.AppLocalizationRegister {}

class _$DeviceInfoDiModule extends _i1043.DeviceInfoDiModule {}

class _$StoragesInitializer extends _i272.StoragesInitializer {}

class _$FirebaseMessagingModule extends _i829.FirebaseMessagingModule {}

class _$ImagePickerDiModule extends _i252.ImagePickerDiModule {}

class _$DeviceIdDiModule extends _i388.DeviceIdDiModule {}

class _$AuthDiModule extends _i301.AuthDiModule {}

class _$NetworkModule extends _i426.NetworkModule {}
