import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/constants/app_enums.dart';
import 'package:tamyez_app/core/entities/auth_token.dart';
import 'package:tamyez_app/core/entities/login_session_entity.dart';
import 'package:tamyez_app/core/entities/user_entity.dart';
import 'package:tamyez_app/core/error/failures/app_failures.dart';
import 'package:tamyez_app/core/execution/operation_result.dart';
import 'package:tamyez_app/core/presentation/result/ui_effect.dart';
import 'package:tamyez_app/core/presentation/result/ui_result.dart';
import 'package:tamyez_app/modules/auth/domain/entities/login_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/login_response_entity.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/gmail_login_use_case.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/login_use_case.dart';
import 'package:tamyez_app/modules/auth/ui/screens/login/view_model/login_intent.dart';
import 'package:tamyez_app/modules/auth/ui/screens/login/view_model/login_state.dart';
import 'package:tamyez_app/modules/auth/ui/screens/login/view_model/login_view_model.dart';

import '../../../../core/helpers/shared_test_mocks.mocks.dart';
import 'login_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginUseCase>(), MockSpec<GmailLoginUseCase>()])
void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockGmailLoginUseCase mockGmailLoginUseCase;
  late MockAppInitializer mockAppInitializer;
  late LoginViewModel loginViewModel;
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
    mockLoginUseCase = MockLoginUseCase();
    mockGmailLoginUseCase = MockGmailLoginUseCase();
    mockAppInitializer = MockAppInitializer();
    loginViewModel = LoginViewModel(
      mockLoginUseCase,
      mockGmailLoginUseCase,
      mockAppInitializer,
    );
  });

  tearDown(() {
    if (!loginViewModel.isClosed) {
      loginViewModel.close();
    }
  });

  group('SystemLoginIntent test', () {
    blocTest(
      'Test SystemLoginIntent will call loginUseCase function and emits [loading, success] if call succeeds',
      build: () => loginViewModel,
      setUp: () {
        when(
          mockLoginUseCase(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationSuccess<LoginResponseEntity>(response),
        );
      },
      act: (bloc) => bloc.doIntent(
        const SystemLoginIntent(
          email: 'email',
          password: 'password',
          rememberMe: true,
        ),
      ),
      expect: () {
        return [
          isA<LoginState>().having(
            (s) => s.systemLoginResult,
            'systemLoginResult',
            isA<Loading<void>>(),
          ),
          isA<LoginState>().having(
            (s) => s.systemLoginResult,
            'systemLoginResult',
            isA<Success<void>>(),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockLoginUseCase(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).called(1);
        verify(
          mockAppInitializer.initAuthAndUserProvider(session: response.body),
        ).called(1);
      },
    );
    test(
      'Test event DisplaySuccessEffect and NavigateEffect will be triggered when login succeeds',
      () async {
        // arrange
        when(
          mockLoginUseCase(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationSuccess<LoginResponseEntity>(response),
        );
        final eventExpectation = expectLater(
          loginViewModel.effectStream,
          emitsInAnyOrder([isA<DisplaySuccessEffect>(), isA<NavigateEffect>()]),
        );

        // act
        loginViewModel.doIntent(
          const SystemLoginIntent(
            email: 'email',
            password: 'password',
            rememberMe: true,
          ),
        );

        // assert
        await eventExpectation;
      },
    );
    blocTest(
      'Test SystemLoginIntent will call loginUseCase function and emits [loading, failure] if call fails',
      build: () => loginViewModel,
      setUp: () {
        when(
          mockLoginUseCase(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationFailure<LoginResponseEntity>(const NoInternetFailure()),
        );
      },
      act: (bloc) => bloc.doIntent(
        const SystemLoginIntent(
          email: 'email',
          password: 'password',
          rememberMe: true,
        ),
      ),
      expect: () {
        return [
          isA<LoginState>().having(
            (s) => s.systemLoginResult,
            'systemLoginResult',
            isA<Loading<void>>(),
          ),
          isA<LoginState>().having(
            (s) => s.systemLoginResult,
            'systemLoginResult',
            isA<Error<void>>().having(
              (e) => e.failure,
              'failure',
              isA<NoInternetFailure>(),
            ),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockLoginUseCase(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).called(1);
        verifyNever(
          mockAppInitializer.initAuthAndUserProvider(session: response.body),
        ).called(0);
      },
    );
    test(
      'Test event DisplayErrorEffect will be triggered when login fails',
      () async {
        // arrange
        when(
          mockLoginUseCase(
            params: argThat(isA<LoginParams>(), named: 'params'),
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationFailure<LoginResponseEntity>(const NoInternetFailure()),
        );
        final eventExpectation = expectLater(
          loginViewModel.effectStream,
          emits(isA<DisplayErrorEffect>()),
        );

        // act
        loginViewModel.doIntent(
          const SystemLoginIntent(
            email: 'email',
            password: 'password',
            rememberMe: true,
          ),
        );

        // assert
        await eventExpectation;
      },
    );
  });

  group('GmailLoginIntent test', () {
    blocTest(
      'Test GmailLoginIntent will call loginUseCase function and emits [loading, success] if call succeeds',
      build: () => loginViewModel,
      setUp: () {
        when(
          mockGmailLoginUseCase(
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationSuccess<LoginResponseEntity>(response),
        );
      },
      act: (bloc) => bloc.doIntent(const GmailLoginIntent(rememberMe: true)),
      expect: () {
        return [
          isA<LoginState>().having(
            (s) => s.googleLoginResult,
            'googleLoginResult',
            isA<Loading<void>>(),
          ),
          isA<LoginState>().having(
            (s) => s.googleLoginResult,
            'googleLoginResult',
            isA<Success<void>>(),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockGmailLoginUseCase(
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).called(1);
        verify(
          mockAppInitializer.initAuthAndUserProvider(session: response.body),
        ).called(1);
      },
    );
    test(
      'Test event DisplaySuccessEffect and NavigateEffect will be triggered when login succeeds',
      () async {
        // arrange
        when(
          mockGmailLoginUseCase(
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationSuccess<LoginResponseEntity>(response),
        );
        final eventExpectation = expectLater(
          loginViewModel.effectStream,
          emitsInAnyOrder([isA<DisplaySuccessEffect>(), isA<NavigateEffect>()]),
        );

        // act
        loginViewModel.doIntent(const GmailLoginIntent(rememberMe: true));

        // assert
        await eventExpectation;
      },
    );
    blocTest(
      'Test GmailLoginIntent will call loginUseCase function and emits [loading, failure] if call fails',
      build: () => loginViewModel,
      setUp: () {
        when(
          mockGmailLoginUseCase(
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationFailure<LoginResponseEntity>(const NoInternetFailure()),
        );
      },
      act: (bloc) => bloc.doIntent(const GmailLoginIntent(rememberMe: true)),
      expect: () {
        return [
          isA<LoginState>().having(
            (s) => s.googleLoginResult,
            'googleLoginResult',
            isA<Loading<void>>(),
          ),
          isA<LoginState>().having(
            (s) => s.googleLoginResult,
            'googleLoginResult',
            isA<Error<void>>().having(
              (e) => e.failure,
              'failure',
              isA<NoInternetFailure>(),
            ),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockGmailLoginUseCase(
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).called(1);
        verifyNever(
          mockAppInitializer.initAuthAndUserProvider(session: response.body),
        ).called(0);
      },
    );
    test(
      'Test event DisplayErrorEffect will be triggered when login fails',
      () async {
        // arrange
        when(
          mockGmailLoginUseCase(
            rememberMe: argThat(isA<bool>(), named: 'rememberMe'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationFailure<LoginResponseEntity>(const NoInternetFailure()),
        );
        final eventExpectation = expectLater(
          loginViewModel.effectStream,
          emits(isA<DisplayErrorEffect>()),
        );

        // act
        loginViewModel.doIntent(const GmailLoginIntent(rememberMe: true));

        // assert
        await eventExpectation;
      },
    );
  });
}
