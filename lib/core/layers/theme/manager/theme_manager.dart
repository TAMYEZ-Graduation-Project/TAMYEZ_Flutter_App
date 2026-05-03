import 'package:flutter/material.dart' show ChangeNotifier, Brightness;
import 'package:injectable/injectable.dart' show singleton, Named;

import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/storage_service_contract.dart';
import '../extensions/brightness_enum_extension.dart';

@singleton
class ThemeManager extends ChangeNotifier {
  final StorageService _storageService;
  late Brightness _currentTheme;

  ThemeManager(@Named(StorageConstants.secureStorage) this._storageService);

  Brightness get currentTheme {
    return _currentTheme;
  }

  void setInitTheme(Brightness initTheme) {
    _currentTheme = initTheme;
  }

  void changeTheme(Brightness newTheme) {
    _currentTheme = newTheme;
    _saveTheme();
    notifyListeners();
  }

  void _saveTheme() {
    _storageService.setString(
      StorageConstants.themeKey,
      _currentTheme.getName(),
    );
  }
}
