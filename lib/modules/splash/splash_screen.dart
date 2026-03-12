import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamyez_app/core/bases/base_stateful_widget_state.dart';
import 'package:tamyez_app/core/constants/asset_paths.dart';
import 'package:tamyez_app/core/layers/theme/colors/app_colors.dart';

import '../../core/routing/defined_routes.dart' show DefinedRoutes;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(count: 1);

    controller.forward().then((value) {
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, DefinedRoutes.onboardingRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return AnimatedScale(
              scale: controller.status.isCompleted ? 1 : 0.2 + controller.value,
              duration: const Duration(seconds: 1),
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const .symmetric(horizontal: 80),
                    child: Center(child: Image.asset(AssetPaths.appLogo)),
                  ),
                  Text(
                    appLocalizations.welcomeToTamyez,
                    style: typography.hero.copyWith(
                      fontWeight: .w400,
                      color: AppColors.darkBlue,
                      fontFamily: GoogleFonts.lilitaOne().fontFamily,
                      shadows: [
                        Shadow(
                          offset: const Offset(0.0, 5.0), // X and Y offset
                          blurRadius: 15.0, // The blur radius
                          color: Colors.black.withAlpha(
                            90,
                          ), // The color of the shadow
                        ),
                      ],
                    ),
                  ),
                  Text(
                    appLocalizations.discoverStrengthAndPathMessage,
                    style: typography.body,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
