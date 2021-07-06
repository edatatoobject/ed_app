import 'package:email_validator/email_validator.dart';

class FormTool {
  static String emptyFieldValidator(String value) {
    if (_checkValue(value)) {
      return 'Please enter some text';
    }
    return null;
  }

  static String emailFieldValidator(String value) {
    
    if (_checkValue(value)) {
      return 'Please enter email';
    }

    if (!EmailValidator.validate(value)) {
      return 'Please enter valid email';
    }

    return null;
  }

  static String usernameFieldValidator(String value) {
    if (_checkValue(value)) {
      return 'Please enter User Name';
    }
    
    return null;
  }

  static bool _checkValue(String value) {
    return value == null || value.isEmpty;
  }
}
