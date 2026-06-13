class VerifyCodeRequest {
  VerifyCodeRequest({this.email, this.otp});

  String? email;
  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['otp'] = otp;
    return map;
  }
}
