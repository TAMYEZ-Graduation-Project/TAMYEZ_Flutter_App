import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/routing/defined_routes.dart';
import 'package:tamyez_app/modules/splash/constants/splash_screen_constants.dart';
import 'package:tamyez_app/modules/splash/splash_screen.dart' show SplashScreen;

import '../core/shared/build_widget.dart' show buildWidget;
import '../core/shared/widget_testing_shared_setups.dart';

void main() {
  group('Test Splash Screen widget', () {
    final WidgetTestingSharedSetups sharedSetups = WidgetTestingSharedSetups();

    setUpAll(() async {
      await sharedSetups.sharedSetupAll();
    });

    setUp(() async {
      await sharedSetups.sharedSetup();
    });

    group('Test widget existence in the screen', () {
      testWidgets(
        'Test that the app logo and the two pieces of text under will appear',
        (widgetTester) async {
          // arrange
          await widgetTester.pumpWidget(
            buildWidget(
              home: const SplashScreen(),
              localizationManager: sharedSetups.mockLocalizationManager,
              themeManager: sharedSetups.mockThemeManager,
              navigatorObserver: sharedSetups.mockNavigatorObserver,
            ),
          );

          // act
          final Finder splashScreenColumn = find.byKey(
            const Key(SplashScreenConstants.splashScreenColumnKey),
          );
          final Finder imageInsideColumn = find.byKey(
            const Key(SplashScreenConstants.appLogoImageKey),
          );

          final Finder welcomeTamyezText = find.descendant(
            of: splashScreenColumn,
            matching: find.text(sharedSetups.appLocalizations.welcomeToTamyez),
          );

          final Finder discoverStrengthText = find.descendant(
            of: splashScreenColumn,
            matching: find.text(
              sharedSetups.appLocalizations.discoverStrengthAndPathMessage,
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

    group('Test widget behavior in the screen', () {
      testWidgets(
        'Test if the splash screen will navigate to the onboarding page after 2 seconds',
        (widgetTester) async {
          // arrange
          await widgetTester.pumpWidget(
            buildWidget(
              home: const SplashScreen(),
              localizationManager: sharedSetups.mockLocalizationManager,
              themeManager: sharedSetups.mockThemeManager,
              navigatorObserver: sharedSetups.mockNavigatorObserver,
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
            await Future<void>.delayed(const Duration(seconds: 1));
          });

          // assert
          verify(
            sharedSetups.mockNavigatorObserver.didPush(
              argThat(
                predicate<Route<dynamic>>((route) {
                  return route.settings.name == DefinedRoutes.onboardingRoute;
                }),
              ),
              argThat(
                predicate<Route<dynamic>>((route) {
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
