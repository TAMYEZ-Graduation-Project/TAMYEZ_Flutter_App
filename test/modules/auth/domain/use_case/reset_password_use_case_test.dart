import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/error/failures/app_failures.dart';
import 'package:tamyez_app/core/execution/operation_result.dart';
import 'package:tamyez_app/modules/auth/domain/entities/reset_password_params.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/reset_password_use_case.dart';

import '../../core/helpers/shared_test_mocks.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late ResetPasswordUseCase resetPasswordUseCase;
  final ResetPasswordParams params = ResetPasswordParams(
    email: 'user1@gmail.com',
    password: 'password',
    confirmPassword: 'password',
  );

  setUpAll(() {
    provideDummy<OperationResult<bool>>(OperationSuccess<bool>(true));
    provideDummy<OperationResult<bool>>(
      OperationFailure<bool>(const NoInternetFailure()),
    );
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    resetPasswordUseCase = ResetPasswordUseCase(mockAuthRepository);
  });

  group('resetPassword function test', () {
    test(
      'Test resetPassword function will call resetPassword function in repository and return success if the call succeeds',
      () async {
        // arrange
        when(
          mockAuthRepository.resetPassword(params: params),
        ).thenAnswer((realInvocation) async => OperationSuccess<bool>(true));
        // act
        final result = await resetPasswordUseCase(params: params);

        // assert
        expect(result, isA<OperationSuccess<bool>>());
        expect((result as OperationSuccess<bool>).data, true);
        verify(mockAuthRepository.resetPassword(params: params)).called(1);
      },
    );
    test(
      'Test resetPassword function will call resetPassword function in repository and return failure if the call fails',
      () async {
        // arrange
        when(mockAuthRepository.resetPassword(params: params)).thenAnswer(
          (realInvocation) async =>
              OperationFailure<bool>(const NoInternetFailure()),
        );
        // act
        final result = await resetPasswordUseCase(params: params);

        // assert
        expect(result, isA<OperationFailure<bool>>());
        expect(
          (result as OperationFailure<bool>).failure,
          isA<NoInternetFailure>(),
        );
        verify(mockAuthRepository.resetPassword(params: params)).called(1);
      },
    );
  });
}
