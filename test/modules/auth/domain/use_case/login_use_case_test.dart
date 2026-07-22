import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/constants/app_enums.dart';
import 'package:tamyez_app/core/entities/auth_token.dart';
import 'package:tamyez_app/core/entities/login_session_entity.dart';
import 'package:tamyez_app/core/entities/user_entity.dart';
import 'package:tamyez_app/core/error/failures/app_failures.dart';
import 'package:tamyez_app/core/execution/operation_result.dart';
import 'package:tamyez_app/modules/auth/domain/entities/login_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/login_response_entity.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/login_use_case.dart';

import '../../core/helpers/shared_test_mocks.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;
  const LoginParams params = LoginParams(
    email: 'user1@gmail.com',
    password: 'password',
  );
  const LoginResponseEntity response = LoginResponseEntity(
    success: true,
    message: 'Success',
    body: LoginSessionEntity(
      token: AuthToken(value: 'token', role: UserRoleEnum.user),
      user: UserEntity(
        fullName: 'User 1',
        email: 'user1@gmail.com',
        gender: 'Male',
        phoneNumber: '0522222222',
        id: '1233224',
      ),
      notificationsEnabled: true,
    ),
  );

  setUpAll(() {
    provideDummy<OperationResult<LoginResponseEntity>>(
      OperationSuccess<LoginResponseEntity>(response),
    );
    provideDummy<OperationResult<LoginResponseEntity>>(
      OperationFailure<LoginResponseEntity>(const NoInternetFailure()),
    );
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  group('login function test', () {
    test(
      'Test login function will call login function in repository and return success if the call succeeds',
      () async {
        // arrange
        when(
          mockAuthRepository.login(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationSuccess<LoginResponseEntity>(response),
        );
        // act
        final result = await loginUseCase(params: params, rememberMe: true);

        // assert
        expect(result, isA<OperationSuccess<LoginResponseEntity>>());
        expect(
          (result as OperationSuccess<LoginResponseEntity>).data,
          response,
        );
        verify(
          mockAuthRepository.login(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).called(1);
      },
    );
    test(
      'Test login function will call login function in repository and return failure if the call fails',
      () async {
        // arrange
        when(
          mockAuthRepository.login(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationFailure<LoginResponseEntity>(const NoInternetFailure()),
        );
        // act
        final result = await loginUseCase(params: params, rememberMe: true);

        // assert
        expect(result, isA<OperationFailure<LoginResponseEntity>>());
        expect(
          (result as OperationFailure<LoginResponseEntity>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRepository.login(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).called(1);
      },
    );
  });
}
