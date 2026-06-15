import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:injectable/injectable.dart';

import '../../../../../core/layers/storage/constants/storage_constants.dart'
    show StorageConstants;
import '../../../../../core/layers/storage/contracts/storage_service_contract.dart'
    show StorageService;
import '../../../../../core/network/models/login_session_dto.dart';
import '../../../../../core/network/models/user_dto.dart';
import 'auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final StorageService _storageService;

  const AuthLocalDataSourceImp(
    @Named(StorageConstants.secureStorage) this._storageService,
  );

  @override
  Future<void> saveLoginSession({LoginSessionDto? body}) async {
    await Future.wait([
      _storageService.setString(
        StorageConstants.userKey,
        jsonEncode(body!.user!.toJson()),
      ),
      _storageService.setString(
        StorageConstants.accessToken,
        jsonEncode(body.accessToken),
      ),
    ]);
  }

  @override
  Future<void> clearLoginSession() async {
    await Future.wait([
      _storageService.deleteValue(StorageConstants.userKey),
      _storageService.deleteValue(StorageConstants.accessToken),
    ]);
  }

  @override
  Future<LoginSessionDto> getLoginSession() async {
    final List<String?> savedValues = await Future.wait([
      _storageService.getString(StorageConstants.userKey),
      _storageService.getString(StorageConstants.accessToken),
    ]);

    return LoginSessionDto(
      accessToken: savedValues[0],
      user: savedValues[1] == null
          ? null
          : UserDto.fromJson(
              jsonDecode(savedValues[1]!) as Map<String, dynamic>,
            ),
    );
  }
}
