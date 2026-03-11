import 'package:flutter/material.dart';
import 'package:tamyez_app/core/routing/defined_routes.dart';
import 'package:tamyez_app/core/routing/page_transitions.dart';
import 'package:tamyez_app/modules/home/home_screen.dart';
import 'package:tamyez_app/modules/splash/splash_screen.dart';

abstract class RoutingProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      String? name = settings.name;
      //var args = settings.arguments;
      switch (name) {
        case DefinedRoutes.splashRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SplashScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    PageTransitions.fadeTransition(
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ),
          );

        case DefinedRoutes.homeRoute:
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    PageTransitions.slideAndFade(
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ),
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
                    "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
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
