enum EmailValidationError { invalid }

class Email {
  const Email.pure();
  const Email.dirty([String value = '']);
}
