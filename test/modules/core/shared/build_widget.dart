import 'package:flutter/material.dart'
    show Widget, NavigatorObserver, Locale, Theme, MaterialApp;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer2;
import 'package:tamyez_app/core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'package:tamyez_app/core/layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import 'package:tamyez_app/core/layers/theme/factory/app_theme_factory.dart'
    show AppThemeFactory;
import 'package:tamyez_app/core/layers/theme/manager/theme_manager.dart'
    show ThemeManager;
import 'package:tamyez_app/core/routing/routing_provider.dart'
    show RoutingProvider;
import 'package:tamyez_app/core/screen/custom_breakpoints.dart'
    show CustomBreakpoints;
import 'package:tamyez_app/main.dart' show globalNavigatorKey;

Widget buildWidget({
  required Widget home,
  required LocalizationManager localizationManager,
  required ThemeManager themeManager,
  required NavigatorObserver navigatorObserver,
}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => localizationManager),
      ChangeNotifierProvider(create: (_) => themeManager),
    ],
    child: Consumer2<LocalizationManager, ThemeManager>(
      builder: (context, l10nManager, themeManager, child) {
        return MaterialApp(
          title: 'TAMYEZ App, Our Graduation Project.',
          debugShowCheckedModeBanner: false,
          navigatorKey: globalNavigatorKey,
          locale: Locale(l10nManager.currentLocale),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: RoutingProvider.generateRoute,
          navigatorObservers: [navigatorObserver],
          builder: (context, child) {
            return Theme(
              data: AppThemeFactory.create(
                brightness: themeManager.currentTheme,
                device: CustomBreakpoints().of(context),
                fontFamily: GoogleFonts.manrope().fontFamily,
              ),
              child: child!,
            );
          },
          home: home,
        );
      },
    ),
  );
}
