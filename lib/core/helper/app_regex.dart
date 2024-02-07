class AppRegex {
  static bool isEmailValidate(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.?[a-zA-Z]+)$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
        .hasMatch(password);
  }

  static bool isPhoneValid(String password) {
    return !RegExp(r'^[0-9]+$').hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasSpecialCharacters(String password) {
    return RegExp(r'^(?=.*?[/~!@#$%^&*()_+}{><.?|;])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^.{8,}').hasMatch(password);
  }
}
