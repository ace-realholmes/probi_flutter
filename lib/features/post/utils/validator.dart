class Validators {
  static String? title(String? value,
      {String errorMsg = 'Title is required!'}) {
    if (value == null || value.isEmpty) return errorMsg;
    return null;
  }

  static String? body(String? value,
      {String errorMsg = 'Body is required!'}) {
    if (value == null || value.isEmpty) return errorMsg;
    if (value.length < 18) return 'Text length must be 18 characters or above.';
    return null;
  }
}
