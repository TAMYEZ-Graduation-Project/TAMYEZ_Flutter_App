import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/layers/storage/constants/storage_constants.dart';
import 'package:tamyez_app/core/layers/storage/contracts/storage_service_contract.dart';
import 'package:tamyez_app/core/network/models/login_session_dto.dart';
import 'package:tamyez_app/core/network/models/user_dto.dart';
import 'package:tamyez_app/modules/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:tamyez_app/modules/auth/data/data_sources/local/auth_local_data_source_imp.dart';

import 'auth_local_data_source_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<StorageService>()])
void main() {
  late MockStorageService mockStorageService;
  late AuthLocalDataSource authLocalDataSource;

  setUp(() {
    mockStorageService = MockStorageService();
    authLocalDataSource = AuthLocalDataSourceImp(mockStorageService);
  });

  group('saveLoginSession function', () {
    test(
      'Test that token, notification flag and user info are saved',
      () async {
        // arrange
        final LoginSessionDto dto = LoginSessionDto(
          accessToken: 'oeireoj324204jsdofj23ijrdafjeoa',
          notificationsEnabled: false,
          user: UserDto(fullName: 'User 1', email: 'user1@gmail.com'),
        );
        // act
        await authLocalDataSource.saveLoginSession(body: dto);

        // assert
        verify(
          mockStorageService.setString(
            StorageConstants.accessToken,
            dto.accessToken,
          ),
        ).called(1);
        verify(
          mockStorageService.setBool(
            StorageConstants.notificationsEnabledKey,
            dto.notificationsEnabled ?? false,
          ),
        ).called(1);
        verify(
          mockStorageService.setString(
            StorageConstants.userKey,
            jsonEncode(dto.user?.toJson() ?? '{}'),
          ),
        ).called(1);
      },
    );
  });

  group('clearLoginSession function', () {
    test(
      'Test that token, notification flag and user info are cleared',
      () async {
        // arrange

        // act
        await authLocalDataSource.clearLoginSession();

        // assert
        verify(
          mockStorageService.deleteValue(StorageConstants.accessToken),
        ).called(1);
        verify(
          mockStorageService.deleteValue(
            StorageConstants.notificationsEnabledKey,
          ),
        ).called(1);
        verify(
          mockStorageService.deleteValue(StorageConstants.userKey),
        ).called(1);
      },
    );
  });

  group('getLoginSession function', () {
    test(
      'Test that token, notification flag and user info are returned',
      () async {
        // arrange
        const token = 'oeireoj324204jsdofj23ijrdafjeoa';
        const user = '{"fullName": "User 1", "email": "user1@gmail.com"}';
        when(
          mockStorageService.getString(StorageConstants.accessToken),
        ).thenAnswer((_) async => token);
        when(
          mockStorageService.getString(StorageConstants.userKey),
        ).thenAnswer((_) async => user);
        when(
          mockStorageService.getBool(StorageConstants.notificationsEnabledKey),
        ).thenAnswer((realInvocation) => Future.value(false));

        // act
        final result = await authLocalDataSource.getLoginSession();

        // assert
        verify(
          mockStorageService.getString(StorageConstants.accessToken),
        ).called(1);
        verify(
          mockStorageService.getBool(StorageConstants.notificationsEnabledKey),
        ).called(1);
        verify(
          mockStorageService.getString(StorageConstants.userKey),
        ).called(1);
        expect(result.accessToken, equals(token));
        expect(result.user?.fullName, equals('User 1'));
        expect(result.user?.email, equals('user1@gmail.com'));
        expect(result.notificationsEnabled, equals(false));
      },
    );
  });
}
