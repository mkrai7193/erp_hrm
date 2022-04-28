class InputValidator {
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number can't be empty";
    } else if (value.length < 8) {
      return "Enter a valid phone number";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    var regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length > 6 && !regex.hasMatch(value)) {
      return "Enter a valid password";
    } else {
      return null;
    }
  }
}
