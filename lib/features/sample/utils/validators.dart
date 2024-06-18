class Validators {
  static String? title(String? value, {String errorMsg = 'This field is required!'}) {
    if (value == null || value.isEmpty) return errorMsg;
    return null;
  }

  static String? body(String? value, {String errorMsg = 'This field is required!'}) {
    if (value == null || value.isEmpty) return errorMsg;
    if (value.length < 15) return 'Text length must be 15 characters or above.';
    return null;
  }
}
