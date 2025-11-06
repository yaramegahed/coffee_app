class AppValidators {
  static String? userName(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  static String? emailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email or phone number';
    }

    final text = value.trim();

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    final phoneRegex = RegExp(r'^01[0-9]{9}$');

    if (!emailRegex.hasMatch(text) && !phoneRegex.hasMatch(text)) {
      return 'Please enter a valid email or phone number';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 8) return 'Too short';
    return null;
  }
}
