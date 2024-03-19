class TextFieldValidator {
  static bool passwordValidator({required String password}) {
    if (password.length >= 8 &&
        containUppercase(password) &&
        containLowercase(password) &&
        containNumber(password) &&
        !containSpace(password)) {
      return true;
    }
    return false;
  }

  static bool phoneValidator({required String phone}) {
    if (phone.length >= 8 && RegExp(r'^[0-9]+$').hasMatch(phone)) {
      return true;
    }
    return false;
  }

  static bool containNumber(String value) {
    return value.contains(RegExp(r'\d'));
  }

  static bool containSpace(String value) {
    return value.contains(' ');
  }

  static bool containLowercase(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }

  static bool containUppercase(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }
}
