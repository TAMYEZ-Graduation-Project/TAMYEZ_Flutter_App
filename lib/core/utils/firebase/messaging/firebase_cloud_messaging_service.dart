import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../../functions/safe_print.dart';
import '../../awesome_notification/awesome_notification_service.dart';

@lazySingleton
class FirebaseCloudMessagingService {
  late final AwesomeNotificationService _awesomeNotificationService;

  FirebaseCloudMessagingService(this._awesomeNotificationService);

  // creating an instance from firebase messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // notifications initialization function
  Future<void> initNotifications() async {
    // request permission from user
    final NotificationSettings notificationSettings = await _firebaseMessaging
        .requestPermission();
    safePrint(
      'Notification Authorization Status: ${notificationSettings.authorizationStatus}',
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      // get token for this device
      final fcmToken = await _firebaseMessaging.getToken();
      safePrint('======> Token:$fcmToken');
      _firebaseMessaging.onTokenRefresh
          .listen((newFcmToken) {
            safePrint('======> Refreshed Token:$newFcmToken');
          })
          .onError((Object error) {
            safePrint('Error Refreshing Token: $error');
          });
      // init setup for handling push notifications
      _initPushNotifications();
    } else {
      safePrint(
        'Notification Authorization Status: ${notificationSettings.authorizationStatus}',
      );
    }
  }

  // received messages handling function
  Future<void> handleMessage(RemoteMessage? message) async {
    safePrint('current state ========>');
    if (message == null) return;
    // Navigate to a new screen
  }

  // setup foreground and background settings
  Future<void> _initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    await _firebaseMessaging.getInitialMessage().then(handleMessage);

    // attach event listener for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // notification when the app is in background
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

    // notification when the app is in foreground
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
  }

  /// Handles messages received while the app is in the foreground
  Future<void> _onForegroundMessage(RemoteMessage message) async {
    safePrint('Foreground message received: ${message.data}');
    final notificationData = message.notification;
    if (notificationData != null) {
      // Display a local notification using the service
      await _awesomeNotificationService.showNotification(
        title: notificationData.title ?? 'No Title',
        body: notificationData.body ?? '',
        imageUrl: notificationData.android?.imageUrl,
      );
    }
  }
}

@pragma('vm:entry-point')
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  safePrint('Background Handler');
  // Handle the message
}
