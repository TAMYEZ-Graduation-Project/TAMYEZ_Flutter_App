import 'package:flutter/material.dart';

import '../../modules/auth/ui/screens/login/login_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/splash/splash_screen.dart';
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
