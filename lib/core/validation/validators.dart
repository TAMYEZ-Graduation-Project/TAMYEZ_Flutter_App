import 'validation_error.dart' show ValidationError;

abstract class Validators {
  static ValidationError? validateEmail(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidationError.emptyField;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(input)) {
      return ValidationError.invalidEmail;
    }

    return null;
  }

  static ValidationError? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return ValidationError.emptyField;
    }
    if (input.length < 8) {
      return ValidationError.passwordTooShort;
    }
    if (!RegExp(r'(?=.*?[A-Z])').hasMatch(input)) {
      return ValidationError.passwordMissingUppercase;
    }
    if (!RegExp(r'(?=.*?[a-z])').hasMatch(input)) {
      return ValidationError.passwordMissingLowercase;
    }
    if (!RegExp(r'(?=.*?[0-9])').hasMatch(input)) {
      return ValidationError.passwordMissingDigit;
    }
    if (!RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(input)) {
      return ValidationError.passwordMissingSpecialChar;
    }
    return null;
  }
}
