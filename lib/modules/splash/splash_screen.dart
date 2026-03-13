import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tamyez_app/core/bases/base_stateful_widget_state.dart';
import 'package:tamyez_app/core/constants/asset_paths.dart';
import 'package:tamyez_app/core/layers/theme/colors/app_colors.dart';
import 'package:tamyez_app/core/layers/theme/extensions/app_typography.dart';
import 'package:tamyez_app/modules/splash/constants/splash_screen_constants.dart';

import '../../core/layers/theme/factory/app_theme_factory.dart'
    show AppThemeFactory;
import '../../core/routing/defined_routes.dart' show DefinedRoutes;
import '../../core/screen/custom_breakpoints.dart' show CustomBreakpoints;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStatefulWidgetState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Brightness systemBrightness;

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
        Navigator.pushNamed(context, DefinedRoutes.onboardingRoute);
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    systemBrightness = MediaQuery.platformBrightnessOf(context);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemeFactory.create(
        brightness: systemBrightness,
        device: CustomBreakpoints().of(context),
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  return AnimatedScale(
                    scale: controller.status.isCompleted
                        ? 1
                        : 0.2 + controller.value,
                    duration: const Duration(seconds: 1),
                    child: Column(
                      key: const Key(
                        SplashScreenConstants.splashScreenColumnKey,
                      ),
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const .symmetric(horizontal: 80),
                          child: Center(
                            child: Image.asset(
                              Theme.brightnessOf(context) == Brightness.light
                                  ? AssetPaths.appLogo
                                  : AssetPaths.appLogoDark,
                            ),
                          ),
                        ),
                        Text(
                          appLocalizations.welcomeToTamyez,
                          style: typography.hero.copyWith(
                            fontWeight: .w400,
                            color:
                                Theme.brightnessOf(context) == Brightness.light
                                ? AppColors.darkBlue
                                : AppColors.blue,
                            fontFamily: GoogleFonts.lilitaOne().fontFamily,
                            shadows: [
                              Shadow(
                                offset: const Offset(
                                  0.0,
                                  5.0,
                                ), // X and Y offset
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
                          style: Theme.of(
                            context,
                          ).extension<AppTypography>()?.body,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
