class ChangePasswordParams {
  ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
    required this.v,
  });

  late String currentPassword;
  late String newPassword;
  late String confirmPassword;
  late num v;
}
