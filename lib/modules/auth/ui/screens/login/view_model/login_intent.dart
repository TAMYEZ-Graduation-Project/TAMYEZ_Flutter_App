sealed class LoginIntent {
  const LoginIntent();
}

class SystemLoginIntent extends LoginIntent {
  final String email;
  final String password;

  const SystemLoginIntent({required this.email, required this.password});
}

class GmailLoginIntent extends LoginIntent {
  const GmailLoginIntent();
}
