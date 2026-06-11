import 'package:flutter/material.dart';

import '../../../modules/auth/ui/screens/forget_password/forget_password_screen.dart';
import '../../../modules/auth/ui/screens/forget_password/reset_password_screen.dart';
import '../../../modules/auth/ui/screens/forget_password/verification_code_screen.dart';
import '../../../modules/auth/ui/screens/login/login_screen.dart';
import '../../../modules/auth/ui/screens/sign_up/sign_up_screen.dart'
    show SignUpScreen;
import '../../../modules/home/home_screen.dart' show HomeScreen;
import '../../../modules/startup/ui/onboarding/onboarding_screen.dart';
import '../../../modules/startup/ui/splash/splash_screen.dart'
    show SplashScreen;
import 'defined_routes.dart';
import 'page_transitions.dart';

abstract class RoutingProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      final String? name = settings.name;
      //var args = settings.arguments;
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
                name: DefinedRoutes.forgetPasswordRoute),
          );
        case DefinedRoutes.verificationCodeRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const VerificationCodeScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings:
            const RouteSettings(name: DefinedRoutes.verificationCodeRoute),
          );
        case DefinedRoutes.resetPasswordRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const ResetPasswordScreen(),
            transitionsBuilder: PageTransitions.slideAndFade,
            settings: const RouteSettings(
                name: DefinedRoutes.resetPasswordRoute),
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
