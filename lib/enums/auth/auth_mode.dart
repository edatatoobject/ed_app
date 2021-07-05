enum AuthMode { Login, Register }

String getModeName(AuthMode authMode) {
  if (authMode == AuthMode.Login) {
    return "Login";
  }

  return "Register";
}
