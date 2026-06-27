import 'package:flutter/material.dart' show ChangeNotifier, Brightness;
import 'package:injectable/injectable.dart' show singleton, Named;

import '../../storage/constants/storage_constants.dart';
import '../../storage/contracts/storage_service_contract.dart';
import '../extensions/brightness_enum_extension.dart';

@singleton
class ThemeManager extends ChangeNotifier {
  final StorageService _storageService;
  ThemeManager(@Named(StorageConstants.secureStorage) this._storageService);

  Brightness _currentTheme = Brightness.light;

  Brightness get currentTheme {
    return _currentTheme;
  }

  bool get isDarkTheme => _currentTheme == Brightness.dark;

  void setInitTheme(Brightness initTheme) {
    _currentTheme = initTheme;
    notifyListeners();
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
