import 'package:flutter/material.dart' show BuildContext;

import '../../validation/validation_error.dart' show ValidationError;
import 'validation_message_mapper.dart' show mapValidationErrorToMessage;

String? validateField(
  BuildContext context,
  String? value,
  ValidationError? Function(String? value) validate,
) {
  final error = validate(value);
  if (error == null) return null;
  return mapValidationErrorToMessage(context, error);
}
