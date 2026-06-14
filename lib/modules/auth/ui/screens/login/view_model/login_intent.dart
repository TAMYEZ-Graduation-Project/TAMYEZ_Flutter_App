sealed class LoginIntent {
  const LoginIntent();
}

class SystemLoginIntent extends LoginIntent {
  final String email;
  final String password;
  final bool rememberMe;

  const SystemLoginIntent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}

class GmailLoginIntent extends LoginIntent {
  final bool rememberMe;

  const GmailLoginIntent({required this.rememberMe});
}
