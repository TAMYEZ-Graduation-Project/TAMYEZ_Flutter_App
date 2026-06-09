enum ValidationError {
  emptyField,

  // Name
  invalidFullName,
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
  invalidPassword,

  // Confirm password
  passwordMismatch,
}
