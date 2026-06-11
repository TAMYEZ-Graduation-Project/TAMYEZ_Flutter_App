import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show RichText, FilledButton, Text;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tamyez_app/core/di/di.dart' show getIt;
import 'package:tamyez_app/core/layers/localization/enums/languages_enum.dart';
import 'package:tamyez_app/core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import 'package:tamyez_app/modules/auth/ui/screens/login/view_model/login_state.dart';
import 'package:tamyez_app/modules/auth/ui/screens/login/view_model/login_view_model.dart';
import 'package:tamyez_app/modules/startup/ui/onboarding/constants/onboarding_screen_constants.dart'
    show OnboardingScreenConstants;
import 'package:tamyez_app/modules/startup/ui/onboarding/onboarding_screen.dart';
import 'package:tamyez_app/modules/startup/ui/onboarding/widget/choose_language_widget.dart'
    show ChooseLanguageWidget;
import 'package:tamyez_app/modules/startup/ui/splash/splash_screen.dart';

import '../../../core/shared/build_widget.dart';
import '../../../core/shared/widget_testing_shared_setups.dart'
    show WidgetTestingSharedSetups;
import 'onboarding_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<LoginViewModel>()])
void main() {
  group('Test OnboardingScreen widget', () {
    final WidgetTestingSharedSetups sharedSetups = WidgetTestingSharedSetups();
    late MockLoginViewModel mockLoginViewModel;
    setUp(() async {
      await sharedSetups.sharedSetup();
      if (getIt.isRegistered<LoginViewModel>()) {
        getIt.unregister<LoginViewModel>();
      }
      mockLoginViewModel = MockLoginViewModel();
      getIt.registerFactory<LoginViewModel>(() => mockLoginViewModel);
    });

    tearDown(() async {
      await getIt.reset();
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
          when(mockLoginViewModel.state).thenReturn(const LoginState());
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
