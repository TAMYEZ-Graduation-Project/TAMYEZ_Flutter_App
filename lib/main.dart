import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider, Consumer2;
import 'package:tamyez_app/core/layers/theme/factory/app_theme_factory.dart';
import 'package:tamyez_app/core/routing/routing_provider.dart';
import 'package:tamyez_app/core/utils/awesome_notification/awesome_notification_service.dart';
import 'package:tamyez_app/core/utils/di/di_init.dart';
import 'package:tamyez_app/core/utils/firebase/messaging/firebase_cloud_messaging_service.dart';
import 'package:tamyez_app/modules/splash/splash_screen.dart';

import 'core/layers/localization/l10n/manager/localization_manager.dart'
    show LocalizationManager;
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
    await getIt.get<AwesomeNotificationService>().initInstance;
    await getIt.get<FirebaseCloudMessagingService>().initNotifications();
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
              themeMode: ThemeMode.light,
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
          }
      ),
    );
  }
}
