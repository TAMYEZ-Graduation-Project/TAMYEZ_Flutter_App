import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:injectable/injectable.dart' show Named, singleton;

import '../../../storage/constants/storage_constants.dart';
import '../../../storage/contracts/storage_service_contract.dart';
import '../../enums/languages_enum.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  final StorageService _storageService;
  LocalizationManager(
    @Named(StorageConstants.secureStorage) this._storageService,
  );

  LanguagesEnum _currentLocale = LanguagesEnum.en;

  LanguagesEnum get currentLocale {
    return _currentLocale;
  }

  void setInitLocal(LanguagesEnum initLocal) {
    _currentLocale = initLocal;
    notifyListeners();
  }

  Future<void> changeLocal(LanguagesEnum languageEnum) async {
    _currentLocale = languageEnum;
    _saveLocal(languageEnum.getLanguageCode());
    notifyListeners();
  }

  void _saveLocal(String languageCode) {
    _storageService.setString(StorageConstants.localeKey, languageCode);
  }

  Future<String?> getSavedLocal() async {
    final savedLocale = await _storageService.getString(
      StorageConstants.localeKey,
    );
    return savedLocale;
  }

  bool get isEnglish => currentLocale == LanguagesEnum.en;
}
