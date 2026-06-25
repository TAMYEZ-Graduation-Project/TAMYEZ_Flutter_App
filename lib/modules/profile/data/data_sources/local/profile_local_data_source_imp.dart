import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../core/layers/storage/constants/storage_constants.dart';
import '../../../../../core/layers/storage/contracts/storage_service_contract.dart';
import '../../../../../core/network/models/user_dto.dart';
import '../../../../../core/utils/functions/safe_print.dart';
import 'profile_local_data_source.dart';

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImp implements ProfileLocalDataSource {
  final StorageService _storageService;

  const ProfileLocalDataSourceImp(
    @Named(StorageConstants.secureStorage) this._storageService,
  );

  @override
  Future<UserDto?> getSavedUserProfile() async {
    final userStr = await _storageService.getString(StorageConstants.userKey);
    if (userStr != null) {
      safePrint('in local data source ${jsonDecode(userStr)}');
      return UserDto.fromJson(jsonDecode(userStr) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> saveUserProfile({required UserDto newUser}) {
    return _storageService.setString(
      StorageConstants.userKey,
      jsonEncode(newUser.toJson()),
    );
  }

  @override
  Future<void> clear() {
    return _storageService.deleteAll();
  }
}
