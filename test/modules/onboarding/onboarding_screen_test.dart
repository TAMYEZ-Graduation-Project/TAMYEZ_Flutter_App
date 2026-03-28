import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show RichText, FilledButton, Text;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/layers/localization/enums/languages_enum.dart';
import 'package:tamyez_app/core/routing/defined_routes.dart';
import 'package:tamyez_app/modules/onboarding/constants/onboarding_screen_constants.dart'
    show OnboardingScreenConstants;
import 'package:tamyez_app/modules/onboarding/onboarding_screen.dart';
import 'package:tamyez_app/modules/onboarding/widget/choose_language_widget.dart'
    show ChooseLanguageWidget;
import 'package:tamyez_app/modules/splash/splash_screen.dart';

import '../core/shared/build_widget.dart';
import '../core/shared/widget_testing_shared_setups.dart'
    show WidgetTestingSharedSetups;

void main() {
  group('Test OnboardingScreen widget', () {
    final WidgetTestingSharedSetups sharedSetups = WidgetTestingSharedSetups();

    setUpAll(() async {
      await sharedSetups.sharedSetupAll();
    });

    setUp(() async {
      await sharedSetups.sharedSetup();
    });

    group('Test widgets existence in the screen', () {
      testWidgets(
        'Test if the discover career image, text elements, local button and continue button will appear',
        (widgetTester) async {
          // arrange
          await widgetTester.pumpWidget(
            buildWidget(
              home: const OnboardingScreen(),
              localizationManager: sharedSetups.mockLocalizationManager,
              themeManager: sharedSetups.mockThemeManager,
              navigatorObserver: sharedSetups.mockNavigatorObserver,
            ),
          );
          // act
          final Finder discoverCareerImage = find.byKey(
            const Key(OnboardingScreenConstants.discoverCareerImageKey),
          );
          final Finder onboardingColumn = find.byKey(
            const Key(OnboardingScreenConstants.onboardingColumnKey),
          );
          final Finder discoverYourTruePotentialText = find.descendant(
            of: onboardingColumn,
            matching: find.text(
              sharedSetups.appLocalizations.discoverYourTruePotential,
            ),
          );
          final Finder chooseYourLanguageText = find.descendant(
            of: onboardingColumn,
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is Padding &&
                  widget.child is RichText &&
                  ((widget.child as RichText).text as TextSpan)
                          .children!
                          .length ==
                      2,
            ),
          );
          final Finder chooseLanguageButton = find.descendant(
            of: onboardingColumn,
            matching: find.byType(ChooseLanguageWidget),
          );
          final Finder continueButton = find.descendant(
            of: onboardingColumn,
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is FilledButton &&
                  (widget.child as Text).data ==
                      sharedSetups.appLocalizations.continueWord,
            ),
          );

          // assert
          expect(discoverCareerImage, findsOneWidget);
          expect(onboardingColumn, findsOneWidget);
          expect(discoverYourTruePotentialText, findsOneWidget);
          expect(chooseYourLanguageText, findsOneWidget);
          expect(chooseLanguageButton, findsOneWidget);
          expect(continueButton, findsOneWidget);
        },
      );
    });

    group('Test widgets behavior in the screen', () {
      testWidgets(
        'Test if the choose language button will change language as selected',
        (widgetTester) async {
          // arrange
          await widgetTester.pumpWidget(
            buildWidget(
              home: const OnboardingScreen(),
              localizationManager: sharedSetups.mockLocalizationManager,
              themeManager: sharedSetups.mockThemeManager,
              navigatorObserver: sharedSetups.mockNavigatorObserver,
            ),
          );
          // act
          final Finder chooseLanguageArabicButton = find.byKey(
            const Key(OnboardingScreenConstants.chooseLanguageArabicButtonKey),
          );
          final Finder chooseLanguageEnglishButton = find.byKey(
            const Key(OnboardingScreenConstants.chooseLanguageEnglishButtonKey),
          );

          await widgetTester.tap(chooseLanguageArabicButton);
          await widgetTester.pump();
          // assert
          verify(
            sharedSetups.mockLocalizationManager.changeLocal(LanguagesEnum.ar),
          ).called(1);

          await widgetTester.tap(chooseLanguageEnglishButton);
          await widgetTester.pump();
          // assert
          verify(
            sharedSetups.mockLocalizationManager.changeLocal(LanguagesEnum.en),
          ).called(1);
        },
      );
      testWidgets(
        'Test if the continue button will navigate to the login page',
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
          await widgetTester.pump(const Duration(seconds: 1));
          // act
          final Finder continueButton = find.descendant(
            of: find.byKey(
              const Key(OnboardingScreenConstants.onboardingColumnKey),
            ),
            matching: find.byType(FilledButton),
          );

          await widgetTester.tap(continueButton);
          await widgetTester.pump();

          // assert
          verify(
            sharedSetups.mockNavigatorObserver.didPush(
              argThat(
                predicate<Route<dynamic>>((route) {
                  return route.settings.name == DefinedRoutes.loginRoute;
                }),
              ),
              argThat(
                predicate<Route<dynamic>>((route) {
                  return route.settings.name == DefinedRoutes.onboardingRoute;
                }),
              ),
            ),
          ).called(1);
        },
      );
    });
  });
}
