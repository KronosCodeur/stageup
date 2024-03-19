import 'package:flutter/material.dart';
import 'package:stage_up/core/errors/failure.dart';
import 'package:stage_up/core/validators/textfield_validator.dart';
import 'package:stage_up/features/security/domain/entities/student.dart';

class SecurityManager extends ChangeNotifier {
  String phone = "";
  String code = "";
  String password = "";
  String lastName = "";
  String firstName = "";
  Failure? failure;
  bool phoneIsValid = false;
  bool passwordIsValid = false;
  bool lastNameIsValid = false;
  bool firstNameIsValid = false;
  bool success = false;
  String message = "";
  bool loading = false;

  Student? student;

  setFirstname(String value) {
    firstName = value;
    firstNameIsValid = lastName.length >= 3;
    notifyListeners();
  }

  setPhone(String value) {
    phone = value.replaceAll(" ", "");
    phoneIsValid = TextFieldValidator.phoneValidator(phone: phone);
    notifyListeners();
  }

  setLastName(String value) {
    lastName = value;
    lastNameIsValid = lastName.length >= 3;
    notifyListeners();
  }

  setPassword(String value) {
    password = value;
    passwordIsValid = TextFieldValidator.passwordValidator(password: password);
    notifyListeners();
  }

  reset() {
    phone = "";
    password = "";
    firstName = "";
    lastName = "";
    phoneIsValid = false;
    passwordIsValid = false;
    notifyListeners();
  }

  void load() {
    loading = true;
    notifyListeners();
  }

  unLoad() {
    loading = false;
    notifyListeners();
  }

  Future<void> register() async {}

  Future<void> login() async {}
}
