import '../../layers/localization/l10n/generated/app_localizations.dart';
import '../../validation/validation_error.dart' show ValidationError;

String mapValidationErrorToMessage(
  AppLocalizations l10n,
  ValidationError error,
) {
  switch (error) {
    case ValidationError.emptyField:
      return l10n.fieldRequired;

    case ValidationError.invalidEmail:
      return l10n.pleaseEnterValidEmail;

    case ValidationError.usernameTooShort:
      return l10n.userNameTooShort;

    case ValidationError.usernameTooLong:
      return l10n.userNameTooLong;

    case ValidationError.usernameInvalidChars:
      return l10n.userNameRules;

    case ValidationError.passwordMismatch:
      return l10n.noMatch;

    case ValidationError.invalidPhoneNumber:
      return l10n.phoneNumberRules;

    case ValidationError.nameTooShort:
      return l10n.namesLengthRule;

    case ValidationError.invalidName:
      return l10n.namesRules;

    case ValidationError.invalidFullName:
      return l10n.invalidFullName;

    case ValidationError.invalidPassword:
      return l10n.invalidPassword;
    case ValidationError.invalidGender:
      return l10n.invalidGender;
  }
}
