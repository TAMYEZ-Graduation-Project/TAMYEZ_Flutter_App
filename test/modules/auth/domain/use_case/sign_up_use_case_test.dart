import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/error/failures/app_failures.dart';
import 'package:tamyez_app/core/execution/operation_result.dart';
import 'package:tamyez_app/modules/auth/domain/entities/sign_up_params.dart';
import 'package:tamyez_app/modules/auth/domain/entities/sign_up_response_entity.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/sign_up_use_case.dart';

import '../../core/helpers/shared_test_mocks.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignUpUseCase signUpUseCase;
  const SignUpParams params = SignUpParams(
    fullName: 'User 1',
    email: 'user1@gmail.com',
    password: 'password',
    confirmPassword: 'password',
    gender: 'Male',
    phoneNumber: '0522222222',
  );
  const SignUpResponseEntity response = SignUpResponseEntity(
    success: true,
    message: 'Success',
  );

  setUpAll(() {
    provideDummy<OperationResult<SignUpResponseEntity>>(
      OperationSuccess<SignUpResponseEntity>(response),
    );
    provideDummy<OperationResult<SignUpResponseEntity>>(
      OperationFailure<SignUpResponseEntity>(const NoInternetFailure()),
    );
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signUpUseCase = SignUpUseCase(mockAuthRepository);
  });

  group('signUp function test', () {
    test(
      'Test signUp function will call signUp function in repository and return success if the call succeeds',
      () async {
        // arrange
        when(
          mockAuthRepository.signUp(
            params: argThat(isA<SignUpParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationSuccess<SignUpResponseEntity>(response),
        );
        // act
        final result = await signUpUseCase(params: params);

        // assert
        expect(result, isA<OperationSuccess<SignUpResponseEntity>>());
        expect(
          (result as OperationSuccess<SignUpResponseEntity>).data,
          response,
        );
        verify(
          mockAuthRepository.signUp(
            params: argThat(isA<SignUpParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
    test(
      'Test signUp function will call signUp function in repository and return failure if the call fails',
      () async {
        // arrange
        when(
          mockAuthRepository.signUp(
            params: argThat(isA<SignUpParams>(), named: 'params'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              OperationFailure<SignUpResponseEntity>(const NoInternetFailure()),
        );
        // act
        final result = await signUpUseCase(params: params);

        // assert
        expect(result, isA<OperationFailure<SignUpResponseEntity>>());
        expect(
          (result as OperationFailure<SignUpResponseEntity>).failure,
          isA<NoInternetFailure>(),
        );
        verify(
          mockAuthRepository.signUp(
            params: argThat(isA<SignUpParams>(), named: 'params'),
          ),
        ).called(1);
      },
    );
  });
}
