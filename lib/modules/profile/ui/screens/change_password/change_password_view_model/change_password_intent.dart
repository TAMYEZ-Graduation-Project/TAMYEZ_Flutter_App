sealed class ChangePasswordIntent {
  const ChangePasswordIntent();
}

class ChangeUserPasswordIntent extends ChangePasswordIntent {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangeUserPasswordIntent({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
