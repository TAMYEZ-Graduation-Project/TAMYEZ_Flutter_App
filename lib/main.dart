import 'dart:async';

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;
import 'package:flutter/foundation.dart' show PlatformDispatcher;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer2;

import 'core/auth_providers/auth_provider.dart' show AuthProvider;
import 'core/auth_providers/user_provider.dart';
import 'core/bootstrap/app_initializer.dart';
import 'core/di/di.dart';
import 'core/entities/auth_status.dart';
import 'core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'core/layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import 'core/layers/theme/factory/app_theme_factory.dart';
import 'core/layers/theme/manager/theme_manager.dart' show ThemeManager;
import 'core/presentation/break_points/custom_breakpoints.dart'
    show CustomBreakpoints;
import 'core/presentation/routing/defined_routes.dart' show DefinedRoutes;
import 'core/presentation/routing/navigator_key.dart' show globalNavigatorKey;
import 'core/presentation/routing/routing_provider.dart' show RoutingProvider;
import 'core/presentation/utils/dialogs/app_dialogs.dart' show AppDialogs;
import 'firebase_options.dart' show DefaultFirebaseOptions;
import 'modules/startup/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Framework / platform initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Firebase Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Dependency Injection
  await configureDependencies();

  // App-level initialization (session, theme, locale...)
  final appInitializer = getIt.get<AppInitializer>();
  await appInitializer.initializeEssential();

  runApp(
    const MyApp(),
  );

  // Post-startup init
  Future.microtask(() async {
    await appInitializer.initializeLight();
  });
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    appInitializer.initializeHeavy();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = getIt.get<AuthProvider>();
    authProvider.addListener(_onAuthStateChanged);
    FlutterNativeSplash.remove();
  }

  void _onAuthStateChanged() {
    final context = globalNavigatorKey.currentContext;
    if (context == null) return;
    final l10n = AppLocalizations.of(context)!;

    switch (authProvider.authStatus) {
      case AuthStatus.tokenExpired:
        AppDialogs.defaultDialog(
          context,
          title: l10n.tokenExpiredTitle,
          content: l10n.tokenExpiredContent,
          firstButtonText: l10n.goToLogin,
          dismissible: false,
          firstButtonAction: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              DefinedRoutes.loginRoute,
              (route) => false,
            );
          },
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LocalizationManager>()),
        ChangeNotifierProvider(create: (_) => getIt<ThemeManager>()),
        ChangeNotifierProvider(create: (_) => getIt<UserProvider>()),
      ],
      child: Consumer2<LocalizationManager, ThemeManager>(
        builder: (context, l10nManager, themeManager, child) {
          final l10n = AppLocalizations.of(context);
          return MaterialApp(
            title: l10n?.appTitle ?? 'TAMYEZ App',
            debugShowCheckedModeBanner: false,
            navigatorKey: globalNavigatorKey,
            locale: Locale(l10nManager.currentLocale),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: RoutingProvider.generateRoute,
            builder: (context, child) {
              return Theme(
                data: AppThemeFactory.create(
                  brightness: themeManager.currentTheme,
                  device: CustomBreakpoints().of(context),
                  fontFamily: GoogleFonts.manrope().fontFamily,
                ),
                child: child!,
              );
            },
            home: const SplashScreen(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    authProvider.removeListener(_onAuthStateChanged);
    super.dispose();
  }
}
