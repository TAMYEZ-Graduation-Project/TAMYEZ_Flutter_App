import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AwesomeNotificationService {
  static String fcmChannelKey = "FCM_Channel";
  static AwesomeNotifications? _awesomeNotifications;

  FutureOr<AwesomeNotifications> get initInstance async {
    if (_awesomeNotifications == null) {
      _awesomeNotifications = AwesomeNotifications();
      await _init(_awesomeNotifications!);
    }
    return _awesomeNotifications!;
  }

  Future<bool> _init(AwesomeNotifications awesomeNotifications) {
    return awesomeNotifications.initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelKey: fcmChannelKey,
          channelName: 'General Notifications',
          channelDescription:
              'Notification channel for showing pushed notifications',
          defaultColor: Color(0xFF9D50DD),
          playSound: true,
          ledColor: Colors.white,
        ),
      ],
    );
  }

  void showNotification({
    required String title,
    required String body,
    String? imageUrl,
  }) {
    _awesomeNotifications?.createNotification(
      content: NotificationContent(
        id: UniqueKey().hashCode,
        channelKey: fcmChannelKey,
        actionType: ActionType.Default,
        title: title,
        body: body,
        largeIcon: imageUrl,
      ),
    );
  }
}
