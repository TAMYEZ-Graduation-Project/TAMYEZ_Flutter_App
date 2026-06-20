import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/di/di.dart';
import 'package:tamyez_app/core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import 'package:tamyez_app/modules/auth/domain/use_case/get_login_session_use_case.dart';
import 'package:tamyez_app/modules/startup/ui/splash/constants/splash_screen_constants.dart';
import 'package:tamyez_app/modules/startup/ui/splash/splash_screen.dart'
    show SplashScreen;

import '../../../core/shared/build_widget.dart' show buildWidget;
import '../../../core/shared/widget_testing_shared_setups.dart';
import 'splash_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetLoginSessionUseCase>()])
void main() {
  group('Test Splash Screen widget', () {
    final WidgetTestingSharedSetups sharedSetups = WidgetTestingSharedSetups();
    late MockGetLoginSessionUseCase mockGetLoginSessionUseCase;

    setUp(() async {
      await sharedSetups.sharedSetup();
      mockGetLoginSessionUseCase = MockGetLoginSessionUseCase();
      when(mockGetLoginSessionUseCase.call()).thenAnswer((_) async => null);
      if (getIt.isRegistered<GetLoginSessionUseCase>()) {
        await getIt.unregister<GetLoginSessionUseCase>();
      }
      getIt.registerFactory<GetLoginSessionUseCase>(
        () => mockGetLoginSessionUseCase,
      );
    });

    tearDown(() async {
      await getIt.reset();
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
            sharedSetups.mockNavigatorObserver.didReplace(
              newRoute: argThat(
                predicate<Route<dynamic>>((route) {
                  return route.settings.name == DefinedRoutes.onboardingRoute;
                }),
                named: 'newRoute',
              ),
              oldRoute: argThat(
                predicate<Route<dynamic>>((route) {
                  return route.settings.name == DefinedRoutes.splashRoute;
                }),
                named: 'oldRoute',
              ),
            ),
          ).called(1);
        },
      );
    });
  });
}
