class AppFormValidator {
  static const int _maxLabelLength = 25;
  static const int _maxUsernameLength = 50;
  static const int _maxPasswordLength = 50;

  static String? validateLabel(String? value) {
    if (value == null || value.isEmpty == true) {
      return 'Label cannot be empty';
    }

    if (value.length > _maxLabelLength) {
      return 'Label cannot exceed $_maxLabelLength characters';
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty == true) {
      return 'Username cannot be empty';
    }

    if (value.length > _maxUsernameLength) {
      return 'Username cannot exceed $_maxUsernameLength characters';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty == true) {
      return 'Password cannot be empty';
    }

    if (value.length > _maxPasswordLength) {
      return 'Password cannot exceed $_maxPasswordLength characters';
    }

    return null;
  }
}
