import 'validation_error.dart' show ValidationError;

abstract class Validators {
  static final RegExp _fullNameRegex = RegExp(
    r'^[A-Z][a-z]{1,24}\s[A-Z][a-z]{1,24}$',
  );
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*\W).{8,}$',
  );

  static final RegExp _phoneNumberRegex = RegExp(r'^(\+20)(10|11|12|15)\d{8}$');

  static final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static ValidationError? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationError.emptyField;
    }
    if (!_fullNameRegex.hasMatch(value)) {
      return ValidationError.invalidFullName;
    }
    return null;
  }

  static ValidationError? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationError.emptyField;
    }
    if (!_passwordRegex.hasMatch(value)) {
      return ValidationError.invalidPassword;
    }
    return null;
  }

  static ValidationError? validateConfirmPassword(
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return ValidationError.emptyField;
    }
    if (value != password) {
      return ValidationError.passwordMismatch;
    }
    return null;
  }

  static ValidationError? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationError.emptyField;
    }
    if (!_phoneNumberRegex.hasMatch(value)) {
      return ValidationError.invalidPhoneNumber;
    }
    return null;
  }

  static ValidationError? validateEmail(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidationError.emptyField;
    }

    if (!emailRegex.hasMatch(input)) {
      return ValidationError.invalidEmail;
    }

    return null;
  }
}
