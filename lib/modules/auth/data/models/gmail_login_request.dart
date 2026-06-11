class GmailLoginRequest {
  GmailLoginRequest({this.deviceId, this.fcmToken, required this.idToken});

  String? deviceId;
  String? fcmToken;
  String idToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (deviceId != null) map['deviceId'] = deviceId;
    if (fcmToken != null) map['fcmToken'] = fcmToken;
    map['idToken'] = idToken;
    return map;
  }
}
