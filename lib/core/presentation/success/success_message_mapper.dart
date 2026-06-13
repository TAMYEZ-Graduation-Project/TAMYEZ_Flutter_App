import '../../layers/localization/l10n/generated/app_localizations.dart';
import '../../success/success_enum.dart' show SuccessEnum;

abstract class SuccessHandling {
  static String mapSuccessToMessage(
    AppLocalizations l10n,
    SuccessEnum success,
  ) {
    switch (success) {
      case SuccessEnum.loginSuccess:
        return l10n.loginSuccess;
      case SuccessEnum.signUpSuccess:
        return l10n.signUpSuccess;
      case SuccessEnum.otpResentSuccess:
        return l10n.otpResentSuccess;
      case SuccessEnum.resetPasswordSuccess:
        return l10n.resetPasswordSuccess;
      case SuccessEnum.forgetPasswordEmailSent:
        return l10n.forgetPasswordEmailSent;
      case SuccessEnum.otpVerifiedSuccess:
        return l10n.otpVerifiedSuccess;
    }
  }
}
