class EnableNotificationsRequest {
  final String deviceId;
  final String? replaceDeviceId;
  final String fcmToken;
  final String appVersion;
  final String platform;
  final String os;
  final String deviceModel;

  EnableNotificationsRequest({
    required this.deviceId,
    this.replaceDeviceId,
    required this.fcmToken,
    required this.appVersion,
    required this.platform,
    required this.os,
    required this.deviceModel,
  });

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      if (replaceDeviceId != null) 'replaceDeviceId': replaceDeviceId,
      'fcmToken': fcmToken,
      'appVersion': appVersion,
      'platform': platform,
      'os': os,
      'deviceModel': deviceModel,
    };
  }
}
