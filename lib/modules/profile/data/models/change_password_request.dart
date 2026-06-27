class ChangePasswordRequest {
  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
    required this.v,
  });

  late String currentPassword;
  late String newPassword;
  late String confirmPassword;
  late num v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPassword'] = currentPassword;
    map['newPassword'] = newPassword;
    map['confirmPassword'] = confirmPassword;
    map['v'] = v;
    return map;
  }
}
