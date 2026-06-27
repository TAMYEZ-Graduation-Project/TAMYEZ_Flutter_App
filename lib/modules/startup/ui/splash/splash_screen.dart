import 'dart:async';
import 'dart:io' show Platform;

import 'package:fit_ui/fit_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/auth_providers/user_provider.dart';
import '../../../../core/bootstrap/app_initializer.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/di/di.dart' show getIt;
import '../../../../core/entities/login_session_entity.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/execution/operation_result.dart';
import '../../../../core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import '../../../../core/layers/theme/colors/app_colors.dart';
import '../../../../core/layers/theme/extensions/app_typography.dart';
import '../../../../core/layers/theme/factory/app_theme_factory.dart'
    show AppThemeFactory;
import '../../../../core/presentation/bases/base_stateful_widget_state.dart'
    show BaseStatefulWidgetState;
import '../../../../core/presentation/break_points/custom_breakpoints.dart'
    show CustomBreakpoints;
import '../../../../core/presentation/routing/defined_routes.dart'
    show DefinedRoutes;
import '../../../../core/presentation/routing/navigator_key.dart';
import '../../../../core/utils/functions/has_google_services.dart'
    show hasGoogleServices;
import '../../../../core/utils/functions/user_completed_assessment.dart';
import '../../../auth/domain/use_case/get_login_session_use_case.dart';
import '../../../profile/domain/use_cases/sync_profile_use_case.dart';
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

  final Completer<LoginSessionEntity?> loginSessionCompleter = Completer();

  @override
  void initState() {
    super.initState();

    checkLoginSession();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    controller.forward().then((value) async {
      final loginSession = await loginSessionCompleter.future;
      if (!mounted) return;
      determineNextScreenToNavigateTo(loginSession);
      Future.delayed(const Duration(seconds: 1), () async {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          checkGooglePlayServices();
        });
      });
    });
  }

  Future<void> checkLoginSession() async {
    loginSessionCompleter.complete(
      await getIt.get<GetLoginSessionUseCase>().call(),
    );
  }

  Future<void> determineNextScreenToNavigateTo(
    LoginSessionEntity? loginSession,
  ) async {
    if (loginSession != null) {
      getIt.get<AppInitializer>().initAuthAndUserProvider(
        session: loginSession,
      );
      final result = await getIt.get<SyncProfileUseCase>().call();
      if (!mounted) return;
      switch (result) {
        case OperationSuccess<UserEntity>():
          getIt.get<UserProvider>().setUser(user: result.data);
          if (userCompletedAssessment(result.data)) {
            Navigator.pushReplacementNamed(context, DefinedRoutes.homeRoute);
          } else {
            Navigator.pushReplacementNamed(
              context,
              DefinedRoutes.discoverYourPotentialRoute,
            );
          }
        case OperationFailure<UserEntity>():
          Navigator.pushReplacementNamed(
            context,
            DefinedRoutes.onboardingRoute,
          );
      }
    } else {
      Navigator.pushReplacementNamed(context, DefinedRoutes.onboardingRoute);
    }
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
