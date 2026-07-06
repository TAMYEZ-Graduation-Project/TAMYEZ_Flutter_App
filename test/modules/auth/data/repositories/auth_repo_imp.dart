import 'package:dio/dio.dart' show DioException, RequestOptions;
import 'package:firebase_messaging/firebase_messaging.dart'
    show FirebaseMessaging;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/entities/login_session_entity.dart';
import 'package:tamyez_app/core/error/exceptions/app_exceptions.dart';
import 'package:tamyez_app/core/error/failures/app_failures.dart'
    show NoInternetFailure, GoogleLoginFailure, LoginBadResponseFailure;
import 'package:tamyez_app/core/execution/operation_result.dart';
import 'package:tamyez_app/core/mappers/base_auth_mapper.dart';
import 'package:tamyez_app/core/network/models/login_session_dto.dart'
    show LoginSessionDto;
import 'package:tamyez_app/core/network/models/simple_api_response.dart';
import 'package:tamyez_app/core/network/models/user_dto.dart';
import 'package:tamyez_app/core/utils/device_id/device_id_service.dart'
    show DeviceIdService;
import 'package:tamyez_app/modules/auth/data/data_sources/local/auth_local_data_source.dart'
    show AuthLocalDataSource;
import 'package:tamyez_app/modules/auth/data/data_sources/remote/auth_remote_data_source.dart'
    show AuthRemoteDataSource;
import 'package:tamyez_app/modules/auth/data/data_sources/remote/social_auth_service.dart'
    show SocialAuthService;
import 'package:tamyez_app/modules/auth/data/mappers/auth_mapper.dart';
import 'package:tamyez_app/modules/auth/data/models/gmail_login_request.dart';
import 'package:tamyez_app/modules/auth/data/models/login_request.dart';
import 'package:tamyez_app/modules/auth/data/models/login_response.dart';
import 'package:tamyez_app/modules/auth/data/models/sign_up_request.dart';
import 'package:tamyez_app/modules/auth/data/models/sign_up_response.dart';
import 'package:tamyez_app/modules/auth/data/models/user_email_request.dart';
import 'package:tamyez_app/modules/auth/data/repositories/auth_repo_imp.dart'
    show AuthRepoImp;
import 'package:tamyez_app/modules/auth/domain/entities/login_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/login_response_entity.dart';
import 'package:tamyez_app/modules/auth/domain/entities/sign_up_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/sign_up_response_entity.dart';
import 'package:tamyez_app/modules/auth/domain/entities/user_email_params.dart';
import 'package:tamyez_app/modules/auth/domain/repositories/auth_repository.dart';

import 'auth_repo_imp.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthRemoteDataSource>(),
  MockSpec<SocialAuthService>(),
  MockSpec<AuthLocalDataSource>(),
  MockSpec<DeviceIdService>(),
  MockSpec<FirebaseMessaging>(),
])
void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockSocialAuthService mockSocialAuthService;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockDeviceIdService mockDeviceIdService;
  late MockFirebaseMessaging mockFirebaseMessaging;
  late AuthRepository authRepository;
  final DioException connectionErrorException = DioException.connectionError(
    requestOptions: RequestOptions(),
    reason: 'error',
  );
  late LoginResponse loginResponse;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockSocialAuthService = MockSocialAuthService();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockDeviceIdService = MockDeviceIdService();
    mockFirebaseMessaging = MockFirebaseMessaging();
    authRepository = AuthRepoImp(
      mockAuthRemoteDataSource,
      mockSocialAuthService,
      mockAuthLocalDataSource,
      mockDeviceIdService,
      mockFirebaseMessaging,
    );
    loginResponse = LoginResponse(
      success: true,
      message: 'Success',
      body: LoginSessionDto(
        accessToken: 'accessToken',
        user: UserDto(
          fullName: 'User 1',
          email: 'user1@gmail.com',
          gender: 'Male',
          phoneNumber: '0522222222',
          id: '1233224',
          profilePicture: 'profilePicture',
        ),
      ),
    );
  });

  group('signUp function test', () {
    test(
      'Test signUp function will call signUp function in remote data source and return success if the call succeeds',
      () async {
        // arrange
        const SignUpParams params = SignUpParams(
          fullName: 'User 1',
          email: 'user1@gmail.com',
          password: '123456',
          confirmPassword: '123456',
          gender: 'Male',
          phoneNumber: '0522222222',
        );
        final SignUpResponse response = SignUpResponse(
          success: true,
          message: 'Success',
        );
        when(
          mockAuthRemoteDataSource.signUp(
            request: argThat(isA<SignUpRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => response);
        // act

        final result = await authRepository.signUp(params: params);

        // assert
        expect(result, isA<OperationSuccess<SignUpResponseEntity>>());
        expect(
          (result as OperationSuccess<SignUpResponseEntity>).data,
          response.toEntity(),
        );
        verify(
          mockAuthRemoteDataSource.signUp(
            request: argThat(isA<SignUpRequest>(), named: 'request'),
          ),
        ).called(1);
      },
    );
    test(
      'Test signUp function will call signUp function in remote data source and return failure if the call fails',
      () async {
        // arrange
        const SignUpParams params = SignUpParams(
          fullName: 'User 1',
          email: 'user1@gmail.com',
          password: '123456',
          confirmPassword: '123456',
          gender: 'Male',
          phoneNumber: '0522222222',
        );
        when(
          mockAuthRemoteDataSource.signUp(
            request: argThat(isA<SignUpRequest>(), named: 'request'),
          ),
        ).thenThrow(connectionErrorException);
        // act

        final result = await authRepository.signUp(params: params);

        // assert
        expect(result, isA<OperationFailure<SignUpResponseEntity>>());
        expect(
          (result as OperationFailure<SignUpResponseEntity>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.signUp(
            request: argThat(isA<SignUpRequest>(), named: 'request'),
          ),
        ).called(1);
      },
    );
  });

  group('gmailSignUp function test', () {
    test(
      'Test gmailSignUp function will call gmailSignUp function in remote data source and return success if the call succeeds',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailSignUp();

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationSuccess<LoginResponseEntity>>());
        expect(
          (result as OperationSuccess<LoginResponseEntity>).data,
          loginResponse.toEntity(),
        );
        verify(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
        verify(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        ).called(1);
      },
    );
    test(
      'Test gmailSignUp function will call gmailSignUp function in remote data source and return failure if getGoogleIdToken fails',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenThrow(const GoogleLoginException());
        when(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailSignUp();

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<GoogleLoginFailure>(),
        );
        verifyNever(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        );
        verifyNever(mockDeviceIdService.getDeviceId());
        verifyNever(mockFirebaseMessaging.getToken());
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        );
      },
    );
    test(
      'Test gmailSignUp function will call gmailSignUp function in remote data source and return failure if login session not valid',
      () async {
        // arrange
        loginResponse.body = LoginSessionDto();
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailSignUp();

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<LoginBadResponseFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        );
      },
    );
    test(
      'Test gmailSignUp function will call gmailSignUp function in remote data source and return failure if the call fails',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenThrow(connectionErrorException);
        // act

        final result = await authRepository.gmailSignUp();

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.gmailSignUp(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
      },
    );
  });

  group('resendEmailVerification function test', () {
    test(
      'Test resendEmailVerification function will call resendEmailVerification function in remote data source and return success if the call succeeds',
      () async {
        // arrange
        final UserEmailParams params = UserEmailParams(
          email: 'user1@gmail.com',
        );
        final SimpleApiResponse response = SimpleApiResponse(
          success: true,
          message: 'Success',
        );
        when(
          mockAuthRemoteDataSource.resendEmailVerification(
            request: argThat(isA<UserEmailRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => response);
        // act

        final result = await authRepository.resendEmailVerification(
          params: params,
        );

        // assert
        expect(result, isA<OperationSuccess<bool>>());
        expect((result as OperationSuccess<bool>).data, true);
        verify(
          mockAuthRemoteDataSource.resendEmailVerification(
            request: argThat(isA<UserEmailRequest>(), named: 'request'),
          ),
        ).called(1);
      },
    );
    test(
      'Test resendEmailVerification function will call resendEmailVerification function in remote data source and return failure if the call fails',
      () async {
        // arrange
        final UserEmailParams params = UserEmailParams(
          email: 'user1@gmail.com',
        );
        when(
          mockAuthRemoteDataSource.resendEmailVerification(
            request: argThat(isA<UserEmailRequest>(), named: 'request'),
          ),
        ).thenThrow(connectionErrorException);
        // act

        final result = await authRepository.resendEmailVerification(
          params: params,
        );

        // assert
        expect(result, isA<OperationFailure<bool>>());
        expect(
          (result as OperationFailure<bool>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.resendEmailVerification(
            request: argThat(isA<UserEmailRequest>(), named: 'request'),
          ),
        ).called(1);
      },
    );
  });

  group('login function test', () {
    test(
      'Test login function will call login function in remote data source, save login session and return success if the call succeeds',
      () async {
        // arrange
        const LoginParams params = LoginParams(
          email: 'user1@gmail.com',
          password: '123456',
        );
        when(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.login(
          params: params,
          rememberMe: true,
        );

        // assert
        expect(result, isA<OperationSuccess<LoginResponseEntity>>());
        expect(
          (result as OperationSuccess<LoginResponseEntity>).data,
          loginResponse.toEntity(),
        );
        verify(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
        verify(
          mockAuthLocalDataSource.saveLoginSession(
            body: argThat(isA<LoginSessionDto>(), named: 'body'),
          ),
        ).called(1);
      },
    );
    test(
      'Test login function will call login function in remote data source, ignore saving login session and return success if the call succeeds',
      () async {
        // arrange
        const LoginParams params = LoginParams(
          email: 'user1@gmail.com',
          password: '123456',
        );
        when(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.login(
          params: params,
          rememberMe: false,
        );

        // assert
        expect(result, isA<OperationSuccess<LoginResponseEntity>>());
        expect(
          (result as OperationSuccess<LoginResponseEntity>).data,
          loginResponse.toEntity(),
        );
        verify(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(
            body: argThat(isA<LoginSessionDto>(), named: 'body'),
          ),
        );
      },
    );
    test(
      'Test login function will call login function in remote data source and return failure if login session not valid',
      () async {
        // arrange
        loginResponse.body = LoginSessionDto();
        const LoginParams params = LoginParams(
          email: 'user1@gmail.com',
          password: '123456',
        );
        when(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.login(
          params: params,
          rememberMe: true,
        );

        // assert
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<LoginBadResponseFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        );
      },
    );
    test(
      'Test login function will call login function in remote data source and return failure if the call fails',
      () async {
        // arrange
        const LoginParams params = LoginParams(
          email: 'user1@gmail.com',
          password: '123456',
        );
        when(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).thenThrow(connectionErrorException);
        // act

        final result = await authRepository.login(
          params: params,
          rememberMe: true,
        );

        // assert
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.login(
            request: argThat(isA<LoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(
            body: argThat(isA<LoginSessionDto>(), named: 'body'),
          ),
        );
      },
    );
  });

  group('gmailLogin function test', () {
    test(
      'Test gmailLogin function will call gmailLogin function in remote data source, save login session and return success if the call succeeds',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailLogin(rememberMe: true);

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationSuccess<LoginResponseEntity>>());
        expect(
          (result as OperationSuccess<LoginResponseEntity>).data,
          loginResponse.toEntity(),
        );
        verify(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
        verify(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        ).called(1);
      },
    );
    test(
      'Test gmailLogin function will call gmailLogin function in remote data source, ignore saving login session and return success if the call succeeds',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailLogin(rememberMe: false);

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationSuccess<LoginResponseEntity>>());
        expect(
          (result as OperationSuccess<LoginResponseEntity>).data,
          loginResponse.toEntity(),
        );
        verify(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        );
      },
    );
    test(
      'Test gmailLogin function will call gmailLogin function in remote data source and return failure if getGoogleIdToken fails',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenThrow(const GoogleLoginException());
        when(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailLogin(rememberMe: true);

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<GoogleLoginFailure>(),
        );
        verifyNever(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        );
        verifyNever(mockDeviceIdService.getDeviceId());
        verifyNever(mockFirebaseMessaging.getToken());
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        );
      },
    );
    test(
      'Test gmailLogin function will call gmailLogin function in remote data source and return failure if login session not valid',
      () async {
        // arrange
        loginResponse.body = LoginSessionDto();
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenAnswer((realInvocation) async => loginResponse);
        // act

        final result = await authRepository.gmailLogin(rememberMe: true);

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<LoginBadResponseFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verifyNever(
          mockAuthLocalDataSource.saveLoginSession(body: anyNamed('body')),
        );
      },
    );
    test(
      'Test gmailLogin function will call gmailLogin function in remote data source and return failure if the call fails',
      () async {
        // arrange
        when(
          mockSocialAuthService.getGoogleIdToken(),
        ).thenAnswer((realInvocation) async => 'idToken');
        when(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).thenThrow(connectionErrorException);
        // act

        final result = await authRepository.gmailLogin(rememberMe: true);

        // assert
        verify(mockSocialAuthService.getGoogleIdToken()).called(1);
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRemoteDataSource.gmailLogin(
            request: argThat(isA<GmailLoginRequest>(), named: 'request'),
          ),
        ).called(1);
        verify(mockDeviceIdService.getDeviceId()).called(1);
        verify(mockFirebaseMessaging.getToken()).called(1);
      },
    );
  });

  group('getLoginSession function test', () {
    test(
      'Test getLoginSession function will call getLoginSession function in local data source, and return the saved login session if it exists',
      () async {
        // arrange
        final LoginSessionDto loginSessionDto = LoginSessionDto(
          accessToken: 'accessToken',
          user: UserDto(
            fullName: 'User 1',
            email: 'user1@gmail.com',
            gender: 'Male',
            phoneNumber: '0522222222',
            id: '1233224',
            profilePicture: 'profilePicture',
          ),
        );
        when(
          mockAuthLocalDataSource.getLoginSession(),
        ).thenAnswer((realInvocation) async => loginSessionDto);
        // act
        final result = await authRepository.getLoginSession();

        // assert
        expect(result, isA<LoginSessionEntity?>());
        expect(result, loginSessionDto.toEntity());
        verify(mockAuthLocalDataSource.getLoginSession()).called(1);
      },
    );
    test(
      'Test getLoginSession function will call getLoginSession function in local data source, and return the null if either accessToken or user is null',
      () async {
        // arrange
        final LoginSessionDto loginSessionDto = LoginSessionDto(
          user: UserDto(
            fullName: 'User 1',
            email: 'user1@gmail.com',
            gender: 'Male',
            phoneNumber: '0522222222',
            id: '1233224',
            profilePicture: 'profilePicture',
          ),
        );
        when(
          mockAuthLocalDataSource.getLoginSession(),
        ).thenAnswer((realInvocation) async => loginSessionDto);
        // act
        final result = await authRepository.getLoginSession();

        // assert
        expect(result, isA<LoginSessionEntity?>());
        expect(result, isNull);
        verify(mockAuthLocalDataSource.getLoginSession()).called(1);
      },
    );
    test(
      'Test getLoginSession function will call getLoginSession function in local data source, and return the null if storage service throws exception',
      () async {
        // arrange
        when(
          mockAuthLocalDataSource.getLoginSession(),
        ).thenThrow(const CacheException());
        // act
        final result = await authRepository.getLoginSession();

        // assert
        expect(result, isA<LoginSessionEntity?>());
        expect(result, isNull);
        verify(mockAuthLocalDataSource.getLoginSession()).called(1);
      },
    );
  });
}
