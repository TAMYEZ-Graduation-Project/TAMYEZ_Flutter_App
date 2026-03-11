import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StoragesInitializer {
  @lazySingleton
  FlutterSecureStorage initFlutterSecureStorage() {
    return FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIosOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions();

  IOSOptions _getIosOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
}
