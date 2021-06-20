class FormTool{
  static String emptyFieldValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}