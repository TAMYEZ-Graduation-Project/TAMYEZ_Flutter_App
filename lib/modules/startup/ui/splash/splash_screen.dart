import 'dart:async';
import 'dart:io' show Platform;

import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/asset_paths.dart';
import '../../../../core/di/di.dart' show getIt;
import '../../../../core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import '../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../core/layers/theme/extensions/app_typography.dart';
import '../../../../core/layers/theme/factory/app_theme_factory.dart'
    show AppThemeFactory;
import '../../../../core/presentation/bases/base_stateful_widget_state.dart'
    show BaseStatefulWidgetState;
import '../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../../../../core/presentation/routing/navigator_key.dart';
import '../../../../core/presentation/screen/custom_breakpoints.dart'
    show CustomBreakpoints;
import '../../../../core/utils/functions/has_google_services.dart'
    show hasGoogleServices;
import '../../../auth/domain/use_case/check_login_session_use_case.dart';
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

  final Completer<bool> isLoggedInCompleter = Completer<bool>();

  @override
  void initState() {
    super.initState();

    checkLoginSession();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    controller.forward().then((value) {
      Future.delayed(const Duration(seconds: 1), () async {
        final isLoggedIn = await isLoggedInCompleter.future;
        if (!mounted) return;
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, DefinedRoutes.homeRoute);
        } else {
          Navigator.pushReplacementNamed(
            context,
            DefinedRoutes.onboardingRoute,
          );
        }
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          checkGooglePlayServices();
        });
      });
    });
  }

  Future<void> checkLoginSession() async {
    isLoggedInCompleter.complete(
      await getIt.get<CheckLoginSessionUseCase>().call(),
    );
  }

  Future<void> checkGooglePlayServices() async {
    if (Platform.isAndroid && !(await hasGoogleServices())) {
      showDialog<AlertDialog>(
        context: globalNavigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) {
          final appTypography = Theme.of(context).extension<AppTypography>()!;
          final l10n = AppLocalizations.of(context)!;
          return AlertDialog(
            title: Text(
              l10n.warning,
              style: appTypography.title.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            content: Text(
              l10n.googlePlayServicesMissingMessage,
              textAlign: TextAlign.center,
              style: appTypography.title,
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(l10n.ok, style: appTypography.button),
              ),
            ],
          );
        },
      );
    }
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
                  return ScaleTransition(
                    scale: controller,
                    child: RepaintBoundary(
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
                                key: const Key(
                                  SplashScreenConstants.appLogoImageKey,
                                ),
                                Theme.brightnessOf(context) == Brightness.light
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
