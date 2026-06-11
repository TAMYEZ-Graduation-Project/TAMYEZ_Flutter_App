class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
    this.deviceId,
    this.fcmToken,
  });

  String email;
  String password;
  String? deviceId;
  String? fcmToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    if (deviceId != null) map['deviceId'] = deviceId;
    if (fcmToken != null) map['fcmToken'] = fcmToken;
    return map;
  }
}
