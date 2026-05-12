import 'package:flutter/material.dart' show BuildContext;
import 'package:injectable/injectable.dart' show lazySingleton;

import '../../error/failures/app_failures.dart';
import '../../layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;

@lazySingleton
class FailureHandling {
  String mapFailureToMessage(BuildContext context, Failure failure) {
    final l10n = AppLocalizations.of(context)!;

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

      case UnknownFailure():
      default:
        return l10n.unknownError;
    }
  }

  bool _isUserSafeMessage(String? message) {
    if (message == null) return false;

    if (message.length > 150) return false;
    if (message.contains('Exception')) return false;
    return true;
  }
}
