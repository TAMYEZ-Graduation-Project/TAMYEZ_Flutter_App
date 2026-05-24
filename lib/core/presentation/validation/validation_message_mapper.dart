import 'package:flutter/material.dart' show BuildContext;

import '../../validation/validation_error.dart' show ValidationError;
import '../extension/context_extension.dart';

String mapValidationErrorToMessage(
  BuildContext context,
  ValidationError error,
) {
  final l10n = context.appLocalizations;

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

    case ValidationError.passwordTooShort:
      return l10n.passwordLength;

    case ValidationError.passwordMissingUppercase:
      return l10n.uppercaseRulePassword;

    case ValidationError.passwordMissingLowercase:
      return l10n.lowercaseRulePassword;

    case ValidationError.passwordMissingDigit:
      return l10n.digitRulePassword;

    case ValidationError.passwordMissingSpecialChar:
      return l10n.specialCharactersRulePassword;

    case ValidationError.passwordMismatch:
      return l10n.noMatch;

    case ValidationError.invalidPhoneNumber:
      return l10n.phoneNumberRules;

    case ValidationError.nameTooShort:
      return l10n.namesLengthRule;

    case ValidationError.invalidName:
      return l10n.namesRules;
  }
}
