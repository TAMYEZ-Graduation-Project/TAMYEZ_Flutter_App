import '../../error/failures/app_failures.dart';
import '../../layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;

abstract class FailureHandling {
  static String mapFailureToMessage(AppLocalizations l10n, Failure failure) {
    switch (failure) {
      case NoInternetFailure():
        return l10n.connectionError;

      case ConnectionTimeoutFailure():
        return l10n.connectionTimeout;

      case SendTimeoutFailure():
        return l10n.sendTimeout;

      case ReceiveTimeoutFailure():
        return l10n.receiveTimeout;

      case BadCertificateFailure():
        return l10n.badCertificate;

      case RequestCancelledFailure():
        return l10n.requestCancelled;

      case UnauthorizedFailure():
        return l10n.sessionExpired;

      case ParsingFailure():
        return l10n.badRequest;

      case CacheFailure():
        return l10n.localSaveFailed;

      case ServerFailure(:final serverMessage):
        if (_isUserSafeMessage(serverMessage)) {
          return serverMessage!;
        }
        return l10n.somethingWentWrong;

      case GoogleLoginFailure():
        return l10n.googleLoginFailed;

      case BadRequestFailure():
        return l10n.badRequest;

      case GoogleLoginNotSupportedFailure():
        return l10n.googleLoginNotSupported;

      case UnknownFailure():
        return l10n.unknownError;
      case LoginBadResponseFailure():
        return l10n.loginBadResponse;
      case QuizBadResponseFailure():
        return l10n.quizBadResponse;
    }
  }

  static bool _isUserSafeMessage(String? message) {
    if (message == null) return false;

    if (message.length > 150) return false;
    if (message.contains('Exception')) return false;
    return true;
  }
}
