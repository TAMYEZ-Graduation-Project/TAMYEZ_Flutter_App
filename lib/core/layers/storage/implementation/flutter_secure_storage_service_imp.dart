import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;
import 'package:injectable/injectable.dart' show LazySingleton, Named;

import '../../../functions/safe_print.dart' show safePrint;
import '../../../handlers/execution/execution_handler.dart';
import '../../../handlers/execution/execution_result.dart';
import '../constants/storage_constants.dart';
import '../contracts/storage_service_contract.dart';

@LazySingleton(as: StorageService)
@Named(StorageConstants.secureStorage)
class SecureStorageServiceImp implements StorageService {
  final FlutterSecureStorage storageInstance;

  SecureStorageServiceImp(this.storageInstance);

  @override
  Future<void> setInt(String key, int value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: '$value'),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setDouble(String key, double value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: '$value'),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: '$value'),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: value),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    final storageResult = await ExecutionHandler.execute<void>(
      () => storageInstance.write(key: key, value: jsonEncode(value)),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorStoringMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<int?> getInt(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case ExecutionSuccess<String?>():
        return int.tryParse(storageResult.data ?? '');
      case ExecutionError<String?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<double?> getDouble(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case ExecutionSuccess<String?>():
        return double.tryParse(storageResult.data ?? '');
      case ExecutionError<String?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<bool?> getBool(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case ExecutionSuccess<String?>():
        return bool.tryParse(storageResult.data ?? '');
      case ExecutionError<String?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<String?> getString(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case ExecutionSuccess<String?>():
        return storageResult.data;
      case ExecutionError<String?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.read(key: key),
    );
    switch (storageResult) {
      case ExecutionSuccess<String?>():
        if (storageResult.data == null || storageResult.data!.isEmpty) {
          return null;
        }
        final result = jsonDecode(storageResult.data!);
        return result is List<String> ? result : null;
      case ExecutionError<String?>():
        safePrint(
          StorageConstants.errorReadingMessage(storageResult.error.toString()),
        );
    }
    return null;
  }

  @override
  Future<void> deleteValue(String key) async {
    final storageResult = await ExecutionHandler.execute(
      () => storageInstance.delete(key: key),
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorDeletingMessage(storageResult.error.toString()),
      );
    }
  }

  @override
  Future<void> deleteAll() async {
    final storageResult = await ExecutionHandler.execute(
      storageInstance.deleteAll,
    );
    if (storageResult is ExecutionError) {
      safePrint(
        StorageConstants.errorDeletingMessage(storageResult.error.toString()),
      );
    }
  }
}
