import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../layers/storage/constants/storage_constants.dart';
import '../../layers/storage/contracts/storage_service_contract.dart';

@injectable
class DeviceIdService {
  final StorageService _storageService;
  final Uuid _uuid;

  DeviceIdService(
    @Named(StorageConstants.secureStorage) this._storageService,
    this._uuid,
  );

  Future<String> getDeviceId() async {
    String? id = await _storageService.getString(StorageConstants.deviceIdKey);

    if (id == null) {
      id = _uuid.v4();
      await _storageService.setString(StorageConstants.deviceIdKey, id);
    }

    return id;
  }
}
