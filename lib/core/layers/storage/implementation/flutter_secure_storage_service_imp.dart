import 'dart:async';
import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;
import 'package:injectable/injectable.dart' show LazySingleton, Named;

import '../../../error/exceptions/app_exceptions.dart';
import '../../../utils/functions/safe_print.dart';
import '../constants/storage_constants.dart';
import '../contracts/storage_service_contract.dart';

@LazySingleton(as: StorageService)
@Named(StorageConstants.secureStorage)
class SecureStorageServiceImp implements StorageService {
  final FlutterSecureStorage storageInstance;

  SecureStorageServiceImp(this.storageInstance);

  FutureOr<T> _storageHandler<T>(FutureOr<T> Function() handle) async {
    try {
      return handle.call();
    } on PlatformException {
      try {
        await storageInstance.deleteAll();
      } on PlatformException catch (clearError) {
        safePrint('Failed to clear secure storage: $clearError');
      }
      throw const CacheException();
    }
  }

  @override
  Future<void> setInt(String key, int value) async {
    return _storageHandler(() {
      return storageInstance.write(key: key, value: '$value');
    });
  }

  @override
  Future<void> setDouble(String key, double value) async {
    return _storageHandler(
      () => storageInstance.write(key: key, value: '$value'),
    );
  }

  @override
  Future<void> setBool(String key, bool value) async {
    return _storageHandler(
      () => storageInstance.write(key: key, value: '$value'),
    );
  }

  @override
  Future<void> setString(String key, String value) async {
    return _storageHandler(() => storageInstance.write(key: key, value: value));
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    return storageInstance.write(key: key, value: jsonEncode(value));
  }

  @override
  Future<int?> getInt(String key) async {
    return _storageHandler(() async {
      final data = await storageInstance.read(key: key);
      return int.tryParse(data ?? '');
    });
  }

  @override
  Future<double?> getDouble(String key) async {
    return _storageHandler(() async {
      final data = await storageInstance.read(key: key);
      return double.tryParse(data ?? '');
    });
  }

  @override
  Future<bool?> getBool(String key) async {
    return _storageHandler(() async {
      final data = await storageInstance.read(key: key);
      return bool.tryParse(data ?? '');
    });
  }

  @override
  Future<String?> getString(String key) async {
    return _storageHandler(() => storageInstance.read(key: key));
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _storageHandler(() async {
      final data = await storageInstance.read(key: key);

      if (data == null || data.isEmpty) {
        return null;
      }
      final result = await compute(jsonDecode, data);
      return result is List<String> ? result : null;
    });
  }

  @override
  Future<void> deleteValue(String key) async {
    return _storageHandler(() {
      return storageInstance.delete(key: key);
    });
  }

  @override
  Future<void> deleteAll() async {
    return _storageHandler(storageInstance.deleteAll);
  }
}
