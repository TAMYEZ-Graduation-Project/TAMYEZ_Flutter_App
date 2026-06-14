import 'dart:convert' show jsonEncode;

import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions/app_exceptions.dart'
    show LoginBadResponseException;
import '../../../../../core/layers/storage/constants/storage_constants.dart'
    show StorageConstants;
import '../../../../../core/layers/storage/contracts/storage_service_contract.dart'
    show StorageService;
import '../../models/login_response.dart';
import 'auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final StorageService _storageService;

  const AuthLocalDataSourceImp(
    @Named(StorageConstants.secureStorage) this._storageService,
  );

  @override
  Future<void> saveLoginSession({LoginBodyDto? body}) async {
    if (body?.user == null || body?.accessToken == null) {
      throw const LoginBadResponseException();
    }
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
  Future<bool> isThereLoginSession() async {
    final List<String?> savedValues = await Future.wait([
      _storageService.getString(StorageConstants.userKey),
      _storageService.getString(StorageConstants.accessToken),
    ]);

    return savedValues[0] != null && savedValues[1] != null;
  }
}
