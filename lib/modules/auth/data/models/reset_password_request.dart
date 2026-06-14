class ResetPasswordRequest {
  ResetPasswordRequest({this.email, this.password, this.confirmPassword});

  String? email;
  String? password;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    return map;
  }
}
