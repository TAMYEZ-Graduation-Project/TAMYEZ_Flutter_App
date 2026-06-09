sealed class SignUpIntent {
  const SignUpIntent();
}

class SystemSignUpIntent extends SignUpIntent {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String gender;

  const SystemSignUpIntent({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.gender,
  });
}

class GoogleSignUpIntent extends SignUpIntent {
  const GoogleSignUpIntent();
}
