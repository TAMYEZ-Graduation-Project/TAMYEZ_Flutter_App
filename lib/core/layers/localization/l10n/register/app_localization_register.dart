import 'package:flutter/material.dart' show Locale;
import 'package:injectable/injectable.dart' show module, preResolve;

import '../../enums/languages_enum.dart';
import '../generated/app_localizations.dart';

@module
abstract class AppLocalizationRegister {
  @preResolve
  Future<AppLocalizations> register() {
    return AppLocalizations.delegate.load(
      Locale(LanguagesEnum.en.getLanguageCode()),
    );
  }
}
