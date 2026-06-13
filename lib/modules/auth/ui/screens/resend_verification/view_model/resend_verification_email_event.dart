sealed class ResendVerificationEmailIntent {
  const ResendVerificationEmailIntent();
}

class ResendOtpIntent extends ResendVerificationEmailIntent {
  final String email;

  const ResendOtpIntent(this.email);
}
