import 'package:flutter/material.dart' show BuildContext;

import '../../validation/validation_error.dart' show ValidationError;
import 'validation_message_mapper.dart' show mapValidationErrorToMessage;

String? validateField(
  BuildContext context,
  ValidationError? Function() validate,
) {
  final error = validate();
  if (error == null) return null;
  return mapValidationErrorToMessage(context, error);
}
