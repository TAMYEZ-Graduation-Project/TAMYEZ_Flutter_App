import '../../layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import '../../validation/validation_error.dart' show ValidationError;
import 'validation_message_mapper.dart' show mapValidationErrorToMessage;

String? validateField(
  AppLocalizations l10n,
  String? value,
  ValidationError? Function(String? value) validate,
) {
  final error = validate(value);
  if (error == null) return null;
  return mapValidationErrorToMessage(l10n, error);
}
