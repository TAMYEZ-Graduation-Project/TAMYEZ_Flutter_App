import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/constants/app_enums.dart';
import 'package:tamyez_app/core/entities/auth_token.dart';
import 'package:tamyez_app/core/entities/login_session_entity.dart';
import 'package:tamyez_app/core/entities/user_entity.dart';
import 'package:tamyez_app/modules/auth/domain/use_case/get_login_session_use_case.dart';

import '../../core/helpers/shared_test_mocks.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late GetLoginSessionUseCase getLoginSessionUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    getLoginSessionUseCase = GetLoginSessionUseCase(mockAuthRepository);
  });

  group('getLoginSession function test', () {
    test(
      'Test getLoginSession function will call getLoginSession function in repository and return saved login session if the call succeeds',
      () async {
        // arrange
        const LoginSessionEntity loginSessionEntity = LoginSessionEntity(
          token: AuthToken(value: 'token', role: UserRoleEnum.user),
          user: UserEntity(
            fullName: 'user1',
            email: 'user1@gmail.com',
            role: 'User',
            id: '1',
          ),
          notificationsEnabled: true,
        );
        when(
          mockAuthRepository.getLoginSession(),
        ).thenAnswer((realInvocation) async => loginSessionEntity);
        // act
        final result = await getLoginSessionUseCase();

        // assert
        expect(result, isA<LoginSessionEntity>());
        expect(result, loginSessionEntity);
        verify(mockAuthRepository.getLoginSession()).called(1);
      },
    );
    test(
      'Test getLoginSession function will call getLoginSession function in repository and return null if the there is no saved login session or the call fails',
      () async {
        // arrange
        when(
          mockAuthRepository.getLoginSession(),
        ).thenAnswer((realInvocation) async => null);
        // act
        final result = await getLoginSessionUseCase();

        // assert
        expect(result, isNull);
        verify(mockAuthRepository.getLoginSession()).called(1);
      },
    );
  });
}
