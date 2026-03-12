import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer2;
import 'package:tamyez_app/core/functions/has_google_services.dart';
import 'package:tamyez_app/core/layers/theme/factory/app_theme_factory.dart';
import 'package:tamyez_app/core/routing/routing_provider.dart';
import 'package:tamyez_app/core/utils/awesome_notification/awesome_notification_service.dart';
import 'package:tamyez_app/core/utils/di/di_init.dart';
import 'package:tamyez_app/core/utils/firebase/messaging/firebase_cloud_messaging_service.dart';
import 'package:tamyez_app/modules/splash/splash_screen.dart';

import 'core/layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'core/layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
import 'core/layers/theme/extensions/app_typography.dart' show AppTypography;
import 'core/layers/theme/manager/theme_manager.dart' show ThemeManager;
import 'core/screen/custom_breakpoints.dart' show CustomBreakpoints;
import 'firebase_options.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'config/.env');
  await configureDependencies();

  runApp(const MyApp());

  Future.delayed(Duration.zero, () async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (Platform.isAndroid && !(await hasGoogleServices())) {
      showDialog(
        context: globalNavigatorKey.currentContext!,
        builder: (context) {
          final appTypography = Theme.of(context).extension<AppTypography>()!;
          final l10n = AppLocalizations.of(context)!;
          return AlertDialog(
            title: Text(
              l10n.warning,
              style: appTypography.title.copyWith(color: Colors.red),
              textAlign: .center,
            ),
            content: Text(
              l10n.googlePlayServicesMissingMessage,
              textAlign: .center,
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
    } else {
      await getIt.get<AwesomeNotificationService>().initInstance;
      await getIt.get<FirebaseCloudMessagingService>().initNotifications();
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LocalizationManager>()),
        ChangeNotifierProvider(create: (_) => getIt<ThemeManager>()),
      ],
      child: Consumer2<LocalizationManager, ThemeManager>(
        builder: (context, l10nManager, themeManager, child) {
          return MaterialApp(
            title: 'TAMYEZ App, Our Graduation Project.',
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
}
