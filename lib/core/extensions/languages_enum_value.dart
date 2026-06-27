import '../layers/localization/enums/languages_enum.dart';

extension LanguagesEnumValue on String {
  LanguagesEnum get toLanguagesEnum {
    switch (this) {
      case 'en':
        return LanguagesEnum.en;
      case 'ar':
        return LanguagesEnum.ar;
      default:
        return LanguagesEnum.en;
    }
  }
}
