import "package:flutter/material.dart";
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer2;
import 'package:tamyez_app/core/constants/asset_paths.dart';
import 'package:tamyez_app/core/di/injectable_initializer.dart' show getIt;
import 'package:tamyez_app/core/layers/localization/enums/languages_enum.dart';
import 'package:tamyez_app/core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'package:tamyez_app/core/layers/localization/l10n/manager/localization_manager.dart';
import 'package:tamyez_app/core/layers/theme/factory/app_theme_factory.dart'
    show AppThemeFactory;
import 'package:tamyez_app/core/layers/theme/manager/theme_manager.dart';
import 'package:tamyez_app/core/routing/defined_routes.dart';
import 'package:tamyez_app/core/routing/routing_provider.dart'
    show RoutingProvider;
import 'package:tamyez_app/core/screen/custom_breakpoints.dart'
    show CustomBreakpoints;
import 'package:tamyez_app/core/validation/validation_functions.dart';
import 'package:tamyez_app/main.dart' show globalNavigatorKey;
import 'package:tamyez_app/modules/splash/constants/splash_screen_constants.dart';
import 'package:tamyez_app/modules/splash/splash_screen.dart' show SplashScreen;

import 'splash_screen_test.mocks.dart';

Widget buildWidget({
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
          home: const SplashScreen(),
        );
      },
    ),
  );
}

@GenerateNiceMocks([
  MockSpec<LocalizationManager>(),
  MockSpec<ThemeManager>(),
  MockSpec<NavigatorObserver>(),
])
void main() {
  group("Test Splash Screen widget", () {
    late MockLocalizationManager mockLocalizationManager;
    late MockThemeManager mockThemeManager;
    late MockNavigatorObserver mockNavigatorObserver;
    late AppLocalizations appLocalizations;

    setUpAll(() async {
      mockNavigatorObserver = MockNavigatorObserver();
      appLocalizations = await AppLocalizations.delegate.load(
        Locale(LanguagesEnum.en.getLanguageCode()),
      );
      getIt.registerSingleton<AppLocalizations>(appLocalizations);
      getIt.registerSingleton<ValidateFunctions>(
        ValidateFunctions(appLocalizations),
      );
    });

    setUp(() async {
      mockLocalizationManager = MockLocalizationManager();
      if (getIt.isRegistered<LocalizationManager>()) {
        await getIt.unregister<LocalizationManager>();
      }
      getIt.registerSingleton<LocalizationManager>(mockLocalizationManager);
      mockThemeManager = MockThemeManager();
      if (getIt.isRegistered<ThemeManager>()) {
        await getIt.unregister<ThemeManager>();
      }
      getIt.registerSingleton<ThemeManager>(mockThemeManager);
    });

    group("Test widget existence in the screen", () {
      testWidgets(
        "Test that the app logo and the two pieces of text under will appear",
        (widgetTester) async {
          // arrange
          await widgetTester.pumpWidget(
            buildWidget(
              localizationManager: mockLocalizationManager,
              themeManager: mockThemeManager,
              navigatorObserver: mockNavigatorObserver,
            ),
          );

          // act
          Finder splashScreenColumn = find.byKey(
            const Key(SplashScreenConstants.splashScreenColumnKey),
          );
          Finder imageInsideColumn = find.descendant(
            of: splashScreenColumn,
            matching: find.image(const AssetImage(AssetPaths.appLogo)),
          );

          Finder welcomeTamyezText = find.descendant(
            of: splashScreenColumn,
            matching: find.text(appLocalizations.welcomeToTamyez),
          );

          Finder discoverStrengthText = find.descendant(
            of: splashScreenColumn,
            matching: find.text(
              appLocalizations.discoverStrengthAndPathMessage,
            ),
          );

          // assert
          expect(splashScreenColumn, findsOneWidget);
          expect(imageInsideColumn, findsOneWidget);
          expect(welcomeTamyezText, findsOneWidget);
          expect(discoverStrengthText, findsOneWidget);
        },
      );
    });

    group("Test widget behavior in the screen", () {
      testWidgets(
        "Test if the splash screen will navigate to the onboarding page after 2 seconds",
        (widgetTester) async {
          // arrange
          await widgetTester.pumpWidget(
            buildWidget(
              localizationManager: mockLocalizationManager,
              themeManager: mockThemeManager,
              navigatorObserver: mockNavigatorObserver,
            ),
          );

          await widgetTester.pump(const Duration(seconds: 3));
          await widgetTester.pump(const Duration(seconds: 1));

          // act
          ///*
          ///In Flutter widget tests, real time doesn’t pass automatically. So await Future.delayed(...)
          /// can hang forever because the fake clock never advances.
          ///
          /// Use the tester to move time forward:
          /// - Pause for a duration: await tester.pump(const Duration(seconds: 1));
          /// - Wait until everything settles (animations/microtasks): await tester.pumpAndSettle(); (can hang if frames keep getting scheduled).
          /// - Need real time: wrap in await tester.runAsync(() async { await Future.delayed(...); });
          ///*/
          await widgetTester.runAsync(() async {
            await Future.delayed(const Duration(seconds: 1));
          });

          // assert
          verify(
            mockNavigatorObserver.didPush(
              argThat(
                predicate<Route>((route) {
                  return route.settings.name == DefinedRoutes.onboardingRoute;
                }),
              ),
              argThat(
                predicate<Route>((route) {
                  return route.settings.name == DefinedRoutes.splashRoute;
                }),
              ),
            ),
          ).called(1);
        },
      );
    });
  });
}
