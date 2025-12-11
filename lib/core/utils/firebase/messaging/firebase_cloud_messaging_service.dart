import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:tamyez_app/core/utils/awesome_notification/awesome_notification_service.dart';

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
    debugPrint(
      "Notification Authorization Status: ${notificationSettings.authorizationStatus}",
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      // get token for this device
      final fcmToken = await _firebaseMessaging.getToken();
      debugPrint("======> Token:$fcmToken");
      _firebaseMessaging.onTokenRefresh
          .listen((newFcmToken) {
            debugPrint("======> Refreshed Token:$newFcmToken");
          })
          .onError((error) {
            debugPrint("Error Refreshing Token: $error");
          });
      // init setup for handling push notifications
      _initPushNotifications();
    } else {
      debugPrint(
        "Notification Authorization Status: ${notificationSettings.authorizationStatus}",
      );
    }
  }

  // received messages handling function
  Future<void> handleMessage(RemoteMessage? message) async {
    debugPrint("current state ========>");
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
  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('Foreground message received: ${message.data}');
    final notificationData = message.notification;
    if (notificationData != null) {
      // Display a local notification using the service
      _awesomeNotificationService.showNotification(
        title: notificationData.title ?? "No Title",
        body: notificationData.body ?? "",
      );
    }
  }
}

@pragma('vm:entry-point')
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  debugPrint("Background Handler");
  // Handle the message
}
