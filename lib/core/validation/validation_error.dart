enum ValidationError {
  emptyField,

  // Name
  invalidName,
  nameTooShort,

  // Username
  usernameTooShort,
  usernameTooLong,
  usernameInvalidChars,

  // Email
  invalidEmail,

  // Phone
  invalidPhoneNumber,

  // Password
  passwordTooShort,
  passwordMissingUppercase,
  passwordMissingLowercase,
  passwordMissingDigit,
  passwordMissingSpecialChar,

  // Confirm password
  passwordMismatch,
}
