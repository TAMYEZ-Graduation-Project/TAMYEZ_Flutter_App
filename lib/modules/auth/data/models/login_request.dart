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
    map['deviceId'] = deviceId;
    map['fcmToken'] = fcmToken;
    return map;
  }
}
