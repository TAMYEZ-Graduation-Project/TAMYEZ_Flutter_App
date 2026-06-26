class SignUpRequest {
  SignUpRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.phoneNumber,
  });

  String fullName;
  String email;
  String password;
  String confirmPassword;
  String gender;
  String phoneNumber;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['gender'] = gender;
    map['phoneNumber'] = phoneNumber;
    return map;
  }
}
