class InputValidator {
  String? validatePhoneNumber(String? value, String field) {
    if (value == null || value.isEmpty) {
      return "$field can't be empty";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    } else {
      return null;
    }
  }
}
