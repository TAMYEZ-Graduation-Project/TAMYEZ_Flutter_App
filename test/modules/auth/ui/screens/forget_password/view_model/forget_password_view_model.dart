import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/error/failures/app_failures.dart';
import 'package:tamyez_app/core/execution/operation_result.dart';
import 'package:tamyez_app/core/presentation/result/ui_effect.dart';
import 'package:tamyez_app/core/presentation/result/ui_result.dart';
import 'package:tamyez_app/core/presentation/routing/defined_routes.dart';
import 'package:tamyez_app/core/utils/counter/count_down_utility.dart';
import 'package:tamyez_app/modules/auth/domain/entities/reset_password_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/user_email_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/verify_code_params.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/forget_password_use_case.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/reset_password_use_case.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/verify_code_use_case.dart';
import 'package:tamyez_app/modules/auth/ui/screens/forget_password/view_model/forget_password_intent.dart';
import 'package:tamyez_app/modules/auth/ui/screens/forget_password/view_model/forget_password_state.dart';
import 'package:tamyez_app/modules/auth/ui/screens/forget_password/view_model/forget_password_view_model.dart';

import 'forget_password_view_model.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ForgetPasswordUseCase>(),
  MockSpec<VerifyCodeUseCase>(),
  MockSpec<ResetPasswordUseCase>(),
  MockSpec<CountDownUtility>(),
])
void main() {
  late MockForgetPasswordUseCase mockForgetPasswordUseCase;
  late MockVerifyCodeUseCase mockVerifyCodeUseCase;
  late MockResetPasswordUseCase mockResetPasswordUseCase;
  late MockCountDownUtility mockCountDownUtility;
  late ForgetPasswordViewModel forgetPasswordViewModel;

  setUpAll(() {
    provideDummy<OperationResult<bool>>(OperationSuccess<bool>(true));
    provideDummy<OperationResult<bool>>(
      OperationFailure<bool>(const NoInternetFailure()),
    );
  });

  setUp(() {
    mockForgetPasswordUseCase = MockForgetPasswordUseCase();
    mockVerifyCodeUseCase = MockVerifyCodeUseCase();
    mockResetPasswordUseCase = MockResetPasswordUseCase();
    mockCountDownUtility = MockCountDownUtility();
    forgetPasswordViewModel = ForgetPasswordViewModel(
      mockForgetPasswordUseCase,
      mockVerifyCodeUseCase,
      mockResetPasswordUseCase,
      mockCountDownUtility,
    );
  });

  group('SubmitEmailIntent test', () {
    blocTest(
      'Test SubmitEmailIntent will call forgetPasswordUseCase function and emits [loading, success] if call succeeds',
      build: () => forgetPasswordViewModel,
      setUp: () {
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
      },
      act: (bloc) => bloc.doIntent(const SubmitEmailIntent('email')),
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.forgetPasswordResult,
            'forgetPasswordResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>()
              .having(
                (s) => s.forgetPasswordResult,
                'forgetPasswordResult',
                isA<Success<void>>(),
              )
              .having((s) => s.userEmail, 'forgetPasswordResult', 'email'),
        ];
      },
      verify: (bloc) {
        verify(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplaySuccessEffect and PageNavigationEffect will be triggered when forget password api call succeeds',
      () async {
        // arrange
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([
            isA<DisplaySuccessEffect>(),
            isA<PageNavigationEffect>(),
          ]),
        );

        // act
        forgetPasswordViewModel.doIntent(const SubmitEmailIntent('email'));

        // assert
        await eventExpectation;
      },
    );
    blocTest(
      'Test SubmitEmailIntent will call forgetPasswordUseCase function and emits [loading, failure] if call fails',
      build: () => forgetPasswordViewModel,
      setUp: () {
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
      },
      act: (bloc) => bloc.doIntent(const SubmitEmailIntent('email')),
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.forgetPasswordResult,
            'forgetPasswordResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.forgetPasswordResult,
            'forgetPasswordResult',
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
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplayErrorEffect will be triggered when forget password api call fails',
      () async {
        // arrange
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([isA<DisplayErrorEffect>()]),
        );

        // act
        forgetPasswordViewModel.doIntent(const SubmitEmailIntent('email'));

        // assert
        await eventExpectation;
      },
    );
  });

  group('ResendOtpCodeIntent test', () {
    blocTest(
      'Test ResendOtpCodeIntent will call forgetPasswordUseCase function and emits [loading, success] if call succeeds',
      build: () => forgetPasswordViewModel,
      setUp: () {
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
      },
      act: (bloc) {
        bloc.doIntent(const ResendOtpCodeIntent());
      },
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.resendOtpCodeResult,
            'resendOtpCodeResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.resendOtpCodeResult,
            'resendOtpCodeResult',
            isA<Success<void>>(),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).called(1);
        verify(
          mockCountDownUtility.startCountdown(
            seconds: argThat(isA<int>(), named: 'seconds'),
            onTick: anyNamed('onTick'),
            onFinished: anyNamed('onFinished'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplaySuccessEffect will be triggered when forget password api call succeeds',
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([isA<DisplaySuccessEffect>()]),
        );

        // act
        forgetPasswordViewModel.doIntent(const ResendOtpCodeIntent());

        // assert
        await eventExpectation;
      },
    );
    test(
      "Test that forget password use case won't be called when countdown is running",
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
        when(mockCountDownUtility.isCountdownRunning).thenReturn(true);

        // act
        forgetPasswordViewModel.doIntent(const ResendOtpCodeIntent());

        // assert
        verifyNever(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        );
      },
    );
    test('Test remaining time will change when countdown is running', () async {
      // arrange
      late void Function(int) capturedOnTick;
      forgetPasswordViewModel.emit(
        forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
      );
      when(
        mockForgetPasswordUseCase(
          params: argThat(isA<UserEmailParams>(), named: 'params'),
        ),
      ).thenAnswer((realInvocation) async => OperationSuccess(true));
      when(
        mockCountDownUtility.startCountdown(
          seconds: argThat(isA<int>(), named: 'seconds'),
          onTick: anyNamed('onTick'),
          onFinished: anyNamed('onFinished'),
        ),
      ).thenAnswer((invocation) {
        capturedOnTick =
            invocation.namedArguments[#onTick] as void Function(int);
      });

      // act
      await forgetPasswordViewModel.doIntent(const ResendOtpCodeIntent());
      capturedOnTick(10);

      // assert
      expect(forgetPasswordViewModel.state.timeRemainingForNextResend, 10);
      verify(
        mockCountDownUtility.startCountdown(
          seconds: argThat(isA<int>(), named: 'seconds'),
          onTick: anyNamed('onTick'),
          onFinished: anyNamed('onFinished'),
        ),
      ).called(1);
    });
    test(
      'Test remaining time will be zero when countdown is finished',
      () async {
        // arrange
        late void Function() capturedOnFinished;
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
        when(
          mockCountDownUtility.startCountdown(
            seconds: argThat(isA<int>(), named: 'seconds'),
            onTick: anyNamed('onTick'),
            onFinished: anyNamed('onFinished'),
          ),
        ).thenAnswer((invocation) {
          capturedOnFinished =
              invocation.namedArguments[#onFinished] as void Function();
        });

        // act
        await forgetPasswordViewModel.doIntent(const ResendOtpCodeIntent());
        capturedOnFinished();

        // assert
        expect(forgetPasswordViewModel.state.timeRemainingForNextResend, 0);
        verify(
          mockCountDownUtility.startCountdown(
            seconds: argThat(isA<int>(), named: 'seconds'),
            onTick: anyNamed('onTick'),
            onFinished: anyNamed('onFinished'),
          ),
        ).called(1);
      },
    );

    blocTest(
      'Test ResendOtpCodeIntent will call forgetPasswordUseCase function and emits [loading, failure] if call fails',
      build: () => forgetPasswordViewModel,
      setUp: () {
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
      },
      act: (bloc) {
        bloc.doIntent(const ResendOtpCodeIntent());
      },
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.resendOtpCodeResult,
            'resendOtpCodeResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.resendOtpCodeResult,
            'resendOtpCodeResult',
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
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).called(1);
        verifyNever(
          mockCountDownUtility.startCountdown(
            seconds: argThat(isA<int>(), named: 'seconds'),
            onTick: anyNamed('onTick'),
            onFinished: anyNamed('onFinished'),
          ),
        );
      },
    );
    test(
      'Test event DisplayErrorEffect will be triggered when forget password api call fails',
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockForgetPasswordUseCase(
            params: argThat(isA<UserEmailParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([isA<DisplayErrorEffect>()]),
        );

        // act
        forgetPasswordViewModel.doIntent(const ResendOtpCodeIntent());
        // assert
        await eventExpectation;
      },
    );
  });

  group('VerifyCodeIntent test', () {
    blocTest(
      'Test VerifyCodeIntent will call verifyCodeUseCase function and emits [loading, success] if call succeeds',
      build: () => forgetPasswordViewModel,
      setUp: () {
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockVerifyCodeUseCase(
            params: argThat(isA<VerifyCodeParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
      },
      act: (bloc) {
        bloc.doIntent(const VerifyCodeIntent('123456'));
      },
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.verifyCodeResult,
            'verifyCodeResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.verifyCodeResult,
            'verifyCodeResult',
            isA<Success<void>>(),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockVerifyCodeUseCase(
            params: argThat(isA<VerifyCodeParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplaySuccessEffect and PageNavigationEffect will be triggered when verify code api call succeeds',
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockVerifyCodeUseCase(
            params: argThat(isA<VerifyCodeParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([
            isA<DisplaySuccessEffect>(),
            isA<PageNavigationEffect>(),
          ]),
        );

        // act
        forgetPasswordViewModel.doIntent(const VerifyCodeIntent('123456'));

        // assert
        await eventExpectation;
      },
    );
    blocTest(
      'Test VerifyCodeIntent will call verifyCodeUseCase function and emits [loading, failure] if call fails',
      build: () => forgetPasswordViewModel,
      setUp: () {
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockVerifyCodeUseCase(
            params: argThat(isA<VerifyCodeParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
      },
      act: (bloc) {
        bloc.doIntent(const VerifyCodeIntent('123456'));
      },
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.verifyCodeResult,
            'verifyCodeResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.verifyCodeResult,
            'verifyCodeResult',
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
          mockVerifyCodeUseCase(
            params: argThat(isA<VerifyCodeParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplayErrorEffect will be triggered when verify code api call fails',
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockVerifyCodeUseCase(
            params: argThat(isA<VerifyCodeParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([isA<DisplayErrorEffect>()]),
        );

        // act
        forgetPasswordViewModel.doIntent(const VerifyCodeIntent('123456'));
        // assert
        await eventExpectation;
      },
    );
  });

  group('ResetPasswordIntent test', () {
    blocTest(
      'Test ResetPasswordIntent will call resetPasswordUseCase function and emits [loading, success] if call succeeds',
      build: () => forgetPasswordViewModel,
      setUp: () {
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockResetPasswordUseCase(
            params: argThat(isA<ResetPasswordParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
      },
      act: (bloc) {
        bloc.doIntent(
          const ResetPasswordIntent(
            password: 'password',
            confirmPassword: 'password',
          ),
        );
      },
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.resetPasswordResult,
            'resetPasswordResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.resetPasswordResult,
            'resetPasswordResult',
            isA<Success<void>>(),
          ),
        ];
      },
      verify: (bloc) {
        verify(
          mockResetPasswordUseCase(
            params: argThat(isA<ResetPasswordParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplaySuccessEffect and NavigateEffect will be triggered when reset password api call succeeds',
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockResetPasswordUseCase(
            params: argThat(isA<ResetPasswordParams>(), named: 'params'),
          ),
        ).thenAnswer((realInvocation) async => OperationSuccess(true));
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([
            isA<DisplaySuccessEffect>(),
            isA<NavigateEffect>().having(
              (n) => n.route,
              'route',
              DefinedRoutes.loginRoute,
            ),
          ]),
        );

        // act
        forgetPasswordViewModel.doIntent(
          const ResetPasswordIntent(
            password: 'password',
            confirmPassword: 'password',
          ),
        );

        // assert
        await eventExpectation;
      },
    );
    blocTest(
      'Test ResetPasswordIntent will call resetPasswordUseCase function and emits [loading, failure] if call fails',
      build: () => forgetPasswordViewModel,
      setUp: () {
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockResetPasswordUseCase(
            params: argThat(isA<ResetPasswordParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
      },
      act: (bloc) {
        bloc.doIntent(
          const ResetPasswordIntent(
            password: 'password',
            confirmPassword: 'password',
          ),
        );
      },
      expect: () {
        return [
          isA<ForgetPasswordState>().having(
            (s) => s.resetPasswordResult,
            'resetPasswordResult',
            isA<Loading<void>>(),
          ),
          isA<ForgetPasswordState>().having(
            (s) => s.resetPasswordResult,
            'resetPasswordResult',
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
          mockResetPasswordUseCase(
            params: argThat(isA<ResetPasswordParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test event DisplayErrorEffect will be triggered when verify code api call fails',
      () async {
        // arrange
        forgetPasswordViewModel.emit(
          forgetPasswordViewModel.state.copyWith(userEmail: 'email'),
        );
        when(
          mockResetPasswordUseCase(
            params: argThat(isA<ResetPasswordParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async => OperationFailure(const NoInternetFailure()),
        );
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([isA<DisplayErrorEffect>()]),
        );

        // act
        forgetPasswordViewModel.doIntent(
          const ResetPasswordIntent(
            password: 'password',
            confirmPassword: 'password',
          ),
        );
        // assert
        await eventExpectation;
      },
    );
  });

  group('PageNavigationIntent test', () {
    test(
      'Test PageNavigationEffect will be triggered when doing intent PageNavigationIntent',
      () async {
        // arrange
        final eventExpectation = expectLater(
          forgetPasswordViewModel.effectStream,
          emitsInAnyOrder([
            isA<PageNavigationEffect>().having((n) => n.page, 'page', 1),
          ]),
        );

        // act
        forgetPasswordViewModel.doIntent(const PageNavigationIntent(1));

        // assert
        await eventExpectation;
      },
    );
  });
}
