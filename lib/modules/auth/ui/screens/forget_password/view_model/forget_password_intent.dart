sealed class ForgetPasswordIntent {
  const ForgetPasswordIntent();
}

class SubmitEmailIntent extends ForgetPasswordIntent {
  final String email;

  const SubmitEmailIntent(this.email);
}

class ResendOtpCodeIntent extends ForgetPasswordIntent {
  const ResendOtpCodeIntent();
}

class VerifyCodeIntent extends ForgetPasswordIntent {
  final String code;

  const VerifyCodeIntent(this.code);
}

class ResetPasswordIntent extends ForgetPasswordIntent {
  final String password;
  final String confirmPassword;

  const ResetPasswordIntent({
    required this.password,
    required this.confirmPassword,
  });
}

class PageNavigationIntent extends ForgetPasswordIntent {
  final int page;

  const PageNavigationIntent(this.page);
}
