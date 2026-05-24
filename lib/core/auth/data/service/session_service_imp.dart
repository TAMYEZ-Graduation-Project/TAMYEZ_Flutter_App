import 'dart:convert';

import 'package:injectable/injectable.dart' show LazySingleton, Named;

import '../../../layers/storage/constants/storage_constants.dart'
    show StorageConstants;
import '../../../layers/storage/contracts/storage_service_contract.dart'
    show StorageService;
import '../../domain/entities/session_entity.dart' show SessionEntity;
import '../../domain/service/session_storage_service.dart';
import '../models/stored_session_dto.dart' show StoredSessionDto;

@LazySingleton(as: SessionStorageService)
class SessionStorageServiceImp implements SessionStorageService {
  final StorageService _storageService;

  SessionStorageServiceImp(
    @Named(StorageConstants.secureStorage) this._storageService,
  );

  @override
  Future<void> saveSession(SessionEntity session) async {
    final sessionDto = StoredSessionDto.fromEntity(session);
    await _storageService.setString(
      StorageConstants.sessionKey,
      jsonEncode(sessionDto.toJson()),
    );
  }

  @override
  Future<SessionEntity?> restoreSession() async {
    final sessionDtoJson = await _storageService.getString(
      StorageConstants.sessionKey,
    );
    if (sessionDtoJson != null) {
      return StoredSessionDto.fromJson(
        jsonDecode(sessionDtoJson) as Map<String, dynamic>,
      ).toEntity();
    }
    return null;
  }

  @override
  Future<void> clearSession() {
    return _storageService.deleteValue(StorageConstants.sessionKey);
  }
}
