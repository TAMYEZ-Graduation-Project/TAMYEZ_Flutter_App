import 'package:flutter/material.dart'
    show NavigatorObserver, Locale, Brightness;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/di/di.dart' show getIt;
import 'package:tamyez_app/core/layers/localization/enums/languages_enum.dart'
    show LanguagesEnum, LanguagesEnumExtension;
import 'package:tamyez_app/core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'package:tamyez_app/core/layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import 'package:tamyez_app/core/layers/theme/manager/theme_manager.dart'
    show ThemeManager;

import 'widget_testing_shared_setups.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LocalizationManager>(),
  MockSpec<ThemeManager>(),
  MockSpec<NavigatorObserver>(),
])
class WidgetTestingSharedSetups {
  late MockLocalizationManager mockLocalizationManager;
  late MockThemeManager mockThemeManager;
  late MockNavigatorObserver mockNavigatorObserver;
  late AppLocalizations appLocalizations;

  /// Before using any fields from the object of this class,
  /// you must call sharedSetupAll and sharedSetup in there correct places \n
  WidgetTestingSharedSetups();

  Future<void> sharedSetup() async {
    mockNavigatorObserver = MockNavigatorObserver();
    appLocalizations = await AppLocalizations.delegate.load(
      Locale(LanguagesEnum.en.getLanguageCode()),
    );
    mockLocalizationManager = MockLocalizationManager();
    if (getIt.isRegistered<LocalizationManager>()) {
      await getIt.unregister<LocalizationManager>();
    }
    when(
      mockLocalizationManager.currentLocale,
    ).thenReturn(LanguagesEnum.en);
    getIt.registerSingleton<LocalizationManager>(mockLocalizationManager);

    mockThemeManager = MockThemeManager();
    if (getIt.isRegistered<ThemeManager>()) {
      await getIt.unregister<ThemeManager>();
    }
    getIt.registerSingleton<ThemeManager>(mockThemeManager);
    when(mockThemeManager.currentTheme).thenReturn(Brightness.light);
  }
}
