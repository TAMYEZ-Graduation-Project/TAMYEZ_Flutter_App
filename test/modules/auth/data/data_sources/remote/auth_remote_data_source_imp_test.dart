import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/network/models/login_session_dto.dart';
import 'package:tamyez_app/core/network/models/simple_api_response.dart';
import 'package:tamyez_app/modules/auth/data/data_sources/remote/auth_api_client.dart';
import 'package:tamyez_app/modules/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:tamyez_app/modules/auth/data/data_sources/remote/auth_remote_data_source_imp.dart';
import 'package:tamyez_app/modules/auth/data/models/gmail_login_request.dart';
import 'package:tamyez_app/modules/auth/data/models/login_request.dart';
import 'package:tamyez_app/modules/auth/data/models/login_response.dart';
import 'package:tamyez_app/modules/auth/data/models/reset_password_request.dart';
import 'package:tamyez_app/modules/auth/data/models/sign_up_request.dart';
import 'package:tamyez_app/modules/auth/data/models/sign_up_response.dart';
import 'package:tamyez_app/modules/auth/data/models/user_email_request.dart';
import 'package:tamyez_app/modules/auth/data/models/verify_code_request.dart';

import 'auth_remote_data_source_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthApiClient>()])
void main() {
  late MockAuthApiClient mockAuthApiClient;
  late AuthRemoteDataSource authRemoteDataSource;
  final LoginResponse loginResponse = LoginResponse(
    success: true,
    message: 'Login successfully',
    body: LoginSessionDto.fromJson({
      'accessToken': 'accessToken',
      'notificationsEnabled': true,
      'user': {'fullName': 'User 1', 'email': 'user1@gmail.com'},
    }),
  );

  final SimpleApiResponse simpleApiResponse = SimpleApiResponse(
    success: true,
    message: 'Message',
  );

  setUp(() {
    mockAuthApiClient = MockAuthApiClient();
    authRemoteDataSource = AuthRemoteDataSourceImp(mockAuthApiClient);
  });

  group('signUp function test', () {
    test('testing that api client sign up function is called', () async {
      // arrange
      final SignUpRequest request = SignUpRequest(
        fullName: 'User 1',
        email: 'user1@gmail.com',
        password: '123456',
        confirmPassword: '123456',
        gender: 'Male',
        phoneNumber: '0522222222',
      );
      final signUpResponse = SignUpResponse(
        success: true,
        message: 'Account create successfully',
      );
      when(
        mockAuthApiClient.signUp(request),
      ).thenAnswer((_) async => signUpResponse);

      // act
      final response = await authRemoteDataSource.signUp(request: request);

      // assert
      expect(response.success, equals(signUpResponse.success));
      expect(response.message, equals(signUpResponse.message));
      verify(mockAuthApiClient.signUp(request)).called(1);
    });
  });

  group('gmailSignUp function test', () {
    test('testing that api client gmailSignUp function is called', () async {
      // arrange
      final GmailLoginRequest request = GmailLoginRequest(
        idToken: 'idToken',
        deviceId: 'deviceId',
        fcmToken: 'fcmToken',
      );
      when(
        mockAuthApiClient.gmailSignUp(request),
      ).thenAnswer((_) async => loginResponse);

      // act
      final response = await authRemoteDataSource.gmailSignUp(request: request);

      // assert
      expect(response.success, equals(loginResponse.success));
      expect(response.message, equals(loginResponse.message));
      expect(
        response.body?.accessToken,
        equals(loginResponse.body?.accessToken),
      );
      expect(
        response.body?.notificationsEnabled,
        equals(loginResponse.body?.notificationsEnabled),
      );
      expect(
        response.body?.user?.fullName,
        equals(loginResponse.body?.user?.fullName),
      );
      expect(
        response.body?.user?.email,
        equals(loginResponse.body?.user?.email),
      );
      verify(mockAuthApiClient.gmailSignUp(request)).called(1);
    });
  });

  group('resendEmailVerification function test', () {
    test(
      'testing that api client resendEmailVerification function is called',
      () async {
        // arrange
        final UserEmailRequest request = UserEmailRequest(
          email: 'user1@gmail.com',
        );
        when(
          mockAuthApiClient.resendEmailVerification(request),
        ).thenAnswer((_) async => simpleApiResponse);

        // act
        final response = await authRemoteDataSource.resendEmailVerification(
          request: request,
        );

        // assert
        expect(response.success, equals(simpleApiResponse.success));
        expect(response.message, equals(simpleApiResponse.message));
        verify(mockAuthApiClient.resendEmailVerification(request)).called(1);
      },
    );
  });

  group('login function test', () {
    test('testing that api client login function is called', () async {
      // arrange
      final LoginRequest request = LoginRequest(
        email: 'user1@gmail.com',
        password: '123456',
        deviceId: 'deviceId',
        fcmToken: 'fcmToken',
      );
      when(
        mockAuthApiClient.login(request),
      ).thenAnswer((_) async => loginResponse);

      // act
      final response = await authRemoteDataSource.login(request: request);

      // assert
      expect(response.success, equals(loginResponse.success));
      expect(response.message, equals(loginResponse.message));
      expect(
        response.body?.accessToken,
        equals(loginResponse.body?.accessToken),
      );
      expect(
        response.body?.notificationsEnabled,
        equals(loginResponse.body?.notificationsEnabled),
      );
      expect(
        response.body?.user?.fullName,
        equals(loginResponse.body?.user?.fullName),
      );
      expect(
        response.body?.user?.email,
        equals(loginResponse.body?.user?.email),
      );
      verify(mockAuthApiClient.login(request)).called(1);
    });
  });

  group('gmailLogin function test', () {
    test('testing that api client gmailLogin function is called', () async {
      // arrange
      final GmailLoginRequest request = GmailLoginRequest(
        idToken: 'idToken',
        deviceId: 'deviceId',
        fcmToken: 'fcmToken',
      );
      when(
        mockAuthApiClient.gmailLogin(request),
      ).thenAnswer((_) async => loginResponse);

      // act
      final response = await authRemoteDataSource.gmailLogin(request: request);

      // assert
      expect(response.success, equals(loginResponse.success));
      expect(response.message, equals(loginResponse.message));
      expect(
        response.body?.accessToken,
        equals(loginResponse.body?.accessToken),
      );
      expect(
        response.body?.notificationsEnabled,
        equals(loginResponse.body?.notificationsEnabled),
      );
      expect(
        response.body?.user?.fullName,
        equals(loginResponse.body?.user?.fullName),
      );
      expect(
        response.body?.user?.email,
        equals(loginResponse.body?.user?.email),
      );
      verify(mockAuthApiClient.gmailLogin(request)).called(1);
    });
  });

  group('forgetPassword function test', () {
    test('testing that api client forgetPassword function is called', () async {
      // arrange
      final UserEmailRequest request = UserEmailRequest(
        email: 'user1@gmail.com',
      );
      when(
        mockAuthApiClient.forgetPassword(request),
      ).thenAnswer((_) async => simpleApiResponse);

      // act
      final response = await authRemoteDataSource.forgetPassword(
        request: request,
      );

      // assert
      expect(response.success, equals(simpleApiResponse.success));
      expect(response.message, equals(simpleApiResponse.message));
      verify(mockAuthApiClient.forgetPassword(request)).called(1);
    });
  });

  group('resetPassword function test', () {
    test('testing that api client resetPassword function is called', () async {
      // arrange
      final ResetPasswordRequest request = ResetPasswordRequest(
        email: 'user1@gmail.com',
        confirmPassword: '1223234',
        password: '1223234',
      );
      when(
        mockAuthApiClient.resetPassword(request),
      ).thenAnswer((_) async => simpleApiResponse);

      // act
      final response = await authRemoteDataSource.resetPassword(
        request: request,
      );

      // assert
      expect(response.success, equals(simpleApiResponse.success));
      expect(response.message, equals(simpleApiResponse.message));
      verify(mockAuthApiClient.resetPassword(request)).called(1);
    });
  });

  group('verifyCode function test', () {
    test('testing that api client verifyCode function is called', () async {
      // arrange
      final VerifyCodeRequest request = VerifyCodeRequest(
        email: 'user1@gmail.com',
        otp: '123456',
      );
      when(
        mockAuthApiClient.verifyCode(request),
      ).thenAnswer((_) async => simpleApiResponse);

      // act
      final response = await authRemoteDataSource.verifyCode(request: request);

      // assert
      expect(response.success, equals(simpleApiResponse.success));
      expect(response.message, equals(simpleApiResponse.message));
      verify(mockAuthApiClient.verifyCode(request)).called(1);
    });
  });
}
