class DisableNotificationsRequest {
  final String deviceId;

  DisableNotificationsRequest({required this.deviceId});

  Map<String, dynamic> toJson() {
    return {'deviceId': deviceId};
  }

  factory DisableNotificationsRequest.fromJson(Map<String, dynamic> json) {
    return DisableNotificationsRequest(deviceId: json['deviceId'] as String);
  }
}
