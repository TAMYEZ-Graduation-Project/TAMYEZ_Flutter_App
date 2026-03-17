import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/bases/base_stateful_widget_state.dart';
import '../../core/constants/asset_paths.dart';
import '../../core/layers/theme/colors/app_colors.dart';
import '../../core/layers/theme/extensions/app_typography.dart';
import '../../core/layers/theme/factory/app_theme_factory.dart'
    show AppThemeFactory;
import '../../core/routing/defined_routes.dart' show DefinedRoutes;
import '../../core/screen/custom_breakpoints.dart' show CustomBreakpoints;
import 'constants/splash_screen_constants.dart';

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
      Future.delayed(const Duration(seconds: 1), () async {
        if (!mounted) return;
        await Navigator.pushNamed(context, DefinedRoutes.onboardingRoute);
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
              child: ResponsiveLayoutBuilder(
                breakpointProvider: CustomBreakpoints(),
                builder: (screenType, constraints) {
                  return AnimatedBuilder(
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
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: !screenType.isMobile
                                    ? constraints.maxWidth * (40 / 100)
                                    : constraints.maxWidth * (30 / 100),
                              ),
                              child: Center(
                                child: Image.asset(
                                  Theme.brightnessOf(context) ==
                                          Brightness.light
                                      ? AssetPaths.appLogo
                                      : AssetPaths.appLogoDark,
                                  cacheWidth: 320,
                                  cacheHeight: 340,
                                ),
                              ),
                            ),
                            Text(
                              appLocalizations.welcomeToTamyez,
                              style: typography.hero.copyWith(
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.brightnessOf(context) ==
                                        Brightness.light
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
