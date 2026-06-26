class RefreshFcmTokenRequest {
  final String deviceId;
  final String fcmToken;

  RefreshFcmTokenRequest({required this.deviceId, required this.fcmToken});

  Map<String, dynamic> toJson() {
    return {'deviceId': deviceId, 'fcmToken': fcmToken};
  }

  factory RefreshFcmTokenRequest.fromJson(Map<String, dynamic> json) {
    return RefreshFcmTokenRequest(
      deviceId: json['deviceId'] as String,
      fcmToken: json['fcmToken'] as String,
    );
  }
}
