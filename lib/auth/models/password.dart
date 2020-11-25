enum PasswordValidationError { invalid }

class Password {
  const Password.pure();
  const Password.dirty([String value = '']);

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError validator(String value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
