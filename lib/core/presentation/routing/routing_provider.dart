import 'package:flutter/material.dart';

import '../../../modules/auth/ui/screens/forget_password/forget_password_screen.dart';
import '../../../modules/auth/ui/screens/login/login_screen.dart';
import '../../../modules/auth/ui/screens/resend_verification/resend_verification_email_screen.dart'
    show ResendVerificationEmailScreen;
import '../../../modules/auth/ui/screens/sign_up/sign_up_screen.dart'
    show SignUpScreen;
import '../../../modules/career_assessment/domain/entities/career_details_screen_params.dart'
    show CareerDetailsScreenParams;
import '../../../modules/career_assessment/domain/entities/check_career_assessment_answers_response_entity.dart'
    show SuggestedCareerEntity;
import '../../../modules/career_assessment/ui/screens/career_assessment/career_assessment_screen.dart'
    show CareerAssessmentScreen;
import '../../../modules/career_assessment/ui/screens/career_details/career_details_screen.dart';
import '../../../modules/career_assessment/ui/screens/discover_your_potential/discover_your_potential_screen.dart';
import '../../../modules/career_assessment/ui/screens/top_career_matches/top_career_matches_screen.dart';
import '../../../modules/home/home_screen.dart' show HomeScreen;
import '../../../modules/startup/ui/onboarding/onboarding_screen.dart';
import '../../../modules/startup/ui/splash/splash_screen.dart'
    show SplashScreen;
import '../../layers/localization/l10n/generated/app_localizations.dart';
import 'defined_routes.dart';
import 'page_transitions.dart';

abstract class RoutingProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      final String? name = settings.name;
      final args = settings.arguments;
      switch (name) {
        case DefinedRoutes.splashRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SplashScreen(),
            transitionsBuilder: PageTransitions.fadeTransition,

            /// This is important for testing
            settings: const RouteSettings(name: DefinedRoutes.splashRoute),
          );

        case DefinedRoutes.onboardingRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnboardingScreen(),
            transitionsBuilder: PageTransitions.zoom,
            settings: const RouteSettings(name: DefinedRoutes.onboardingRoute),
          );

        case DefinedRoutes.loginRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(name: DefinedRoutes.loginRoute),
          );
        case DefinedRoutes.signUpRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignUpScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(name: DefinedRoutes.signUpRoute),
          );
        case DefinedRoutes.forgetPasswordRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgetPasswordScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
              name: DefinedRoutes.forgetPasswordRoute,
            ),
          );
        case DefinedRoutes.resendVerificationEmailRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ResendVerificationEmailScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
              name: DefinedRoutes.resendVerificationEmailRoute,
            ),
          );
        case DefinedRoutes.discoverYourPotentialRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DiscoverYourPotentialScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
              name: DefinedRoutes.discoverYourPotentialRoute,
            ),
          );
        case DefinedRoutes.careerAssessmentRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CareerAssessmentScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
              name: DefinedRoutes.careerAssessmentRoute,
            ),
          );
        case DefinedRoutes.topCareerMatchesRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                TopCareerMatchesScreen(
                  suggestedCareers: args as List<SuggestedCareerEntity>,
                ),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
              name: DefinedRoutes.topCareerMatchesRoute,
            ),
          );
        case DefinedRoutes.careerDetailsRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                CareerDetailsScreen(params: args as CareerDetailsScreenParams),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
              name: DefinedRoutes.careerDetailsRoute,
            ),
          );
        case DefinedRoutes.homeRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(name: DefinedRoutes.homeRoute),
          );
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Material(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.routingError,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
