import 'dart:io';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:stageup/core/connection/network_info.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/core/validators/textfield_validator.dart';
import 'package:stageup/features/security/data/services/security_service.dart';
import 'package:stageup/features/security/data/sources/remote/user_security_remote_source.dart';
import 'package:stageup/features/security/domain/entities/user.dart';
import 'package:stageup/features/security/domain/usecases/login.dart';
import 'package:stageup/features/security/domain/usecases/register.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class SecurityManager extends ChangeNotifier {
  ParamsLogin paramsLogin = ParamsLogin(phone: "", password: "");
  ParamsRegister paramsRegister = ParamsRegister(
      phone: "",
      password: "",
      firstname: "",
      lastname: "",
      gender: 0,
      address: "",
      dateOfBirth: "",
      school: "",
      profile: "");

  File? profile;
  bool isLogin = false;
  Failure? failure;
  String city = "";
  String neighborhood = "";
  RequestResponse? response;
  bool phoneIsValid = false;
  bool obscure = true;
  bool passwordIsValid = false;
  bool lastNameIsValid = false;
  bool firstNameIsValid = false;
  bool success = false;
  String message = "";
  bool loading = false;
  bool stepOneIsValid = false;
  bool stepTwoIsValid = false;
  bool stepThreeIsValid = false;
  User? user;

  checkStepOne() {
    stepOneIsValid = (paramsRegister.firstname.trim() != "" &&
        paramsRegister.lastname.trim() != "" &&
        paramsRegister.firstname.trim() != "" &&
        paramsRegister.dateOfBirth != "" &&
        paramsRegister.dateOfBirth.length == 10 &&
        DateTime.tryParse(paramsRegister.dateOfBirth) != null &&
        profile != null);
    notifyListeners();
  }

  checkStepTwo() {
    stepTwoIsValid = (city.trim() != "" &&
        neighborhood.trim() != "" &&
        paramsRegister.school.trim() != "");
    notifyListeners();
  }

  checkStepThree() {
    stepThreeIsValid =
        (TextFieldValidator.phoneValidator(phone: paramsRegister.phone) &&
            TextFieldValidator.passwordValidator(
                password: paramsRegister.password));
    notifyListeners();
  }

  setProfile(File file) {
    profile = file;
    checkStepOne();
    notifyListeners();
  }

  resetProfile() {
    profile = null;
    checkStepOne();
    notifyListeners();
  }

  setLoginPhone(String value) {
    paramsLogin.phone = value;
    phoneIsValid = TextFieldValidator.phoneValidator(phone: value);
    notifyListeners();
  }

  setLoginPassword(String value) {
    paramsLogin.password = value;
    notifyListeners();
  }

  setRegisterPhone(String value) {
    paramsRegister.phone = value;
    checkStepThree();
    notifyListeners();
  }

  setRegisterPassword(String value) {
    paramsRegister.password = value;
    passwordIsValid = TextFieldValidator.passwordValidator(password: value);
    checkStepThree();
    notifyListeners();
  }

  setFirstname(String value) {
    paramsRegister.firstname = value;
    checkStepOne();
    notifyListeners();
  }

  setCity(String value) {
    city = value;
    paramsRegister.address = "$neighborhood, $value";
    checkStepTwo();
    notifyListeners();
  }

  setNeighborhood(String value) {
    neighborhood = value;
    paramsRegister.address = "$value, $city";
    checkStepTwo();
    notifyListeners();
  }

  setLastname(String value) {
    paramsRegister.lastname = value;
    checkStepOne();
    notifyListeners();
  }

  setGender(int value) {
    paramsRegister.gender = value;
    checkStepOne();
    notifyListeners();
  }

  setDateOfBirth(String value) {
    paramsRegister.dateOfBirth = value;
    checkStepOne();
    notifyListeners();
  }

  setAddress(String value) {
    paramsRegister.address = value;
    notifyListeners();
  }

  setSchool(String value) {
    paramsRegister.school = value;
    checkStepTwo();
    notifyListeners();
  }

  reset() {
    paramsLogin = ParamsLogin(phone: "", password: "");
    paramsRegister = ParamsRegister(
        phone: "",
        password: "",
        firstname: "",
        lastname: "",
        gender: 0,
        address: "",
        dateOfBirth: "",
        school: "",
        profile: "");
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

  Future<void> uploadProfile() async {
    DataConnectionChecker connectionChecker = DataConnectionChecker();
    INetworkInfo networkInfo = NetworkInfo(connectionChecker);
    UserSecurityRemoteSource userSecurityRemoteSource =
        UserSecurityRemoteSource();
    SecurityService securityService = SecurityService(
      networkInfo: networkInfo,
      userSecurityRemoteSource: userSecurityRemoteSource,
    );
    var res = await securityService.uploadProfile(
      UploadProfileParam(
        file: profile!,
        filename: paramsRegister.profile,
      ),
    );
    res.fold((fail) {
      failure = fail;
      success = false;
      notifyListeners();
    }, (response) async {
      success = true;
      notifyListeners();
    });
  }

  Future<void> register() async {
    DataConnectionChecker connectionChecker = DataConnectionChecker();
    INetworkInfo networkInfo = NetworkInfo(connectionChecker);
    UserSecurityRemoteSource userSecurityRemoteSource =
        UserSecurityRemoteSource();
    SecurityService securityService = SecurityService(
        networkInfo: networkInfo,
        userSecurityRemoteSource: userSecurityRemoteSource);
    Register register = Register(securityRepository: securityService);
    paramsRegister.profile =
        "${paramsRegister.phone}${DateTime.now().millisecondsSinceEpoch}";
    var result = await register.call(paramsRegister);
    result.fold((fail) {
      failure = fail;
      response = RequestResponse(success: false, message: fail.errorMessage);
      notifyListeners();
    }, (res) {
      response = res;
      notifyListeners();
    });
  }

  Future<void> login() async {
    response = null;
    DataConnectionChecker connectionChecker = DataConnectionChecker();
    INetworkInfo networkInfo = NetworkInfo(connectionChecker);
    UserSecurityRemoteSource userSecurityRemoteSource =
        UserSecurityRemoteSource();
    SecurityService securityService = SecurityService(
        networkInfo: networkInfo,
        userSecurityRemoteSource: userSecurityRemoteSource);
    Login login = Login(securityRepository: securityService);
    var result = await login.call(paramsLogin);
    result.fold((fail) {
      failure = failure;
      response = RequestResponse(success: false, message: fail.errorMessage);
      notifyListeners();
    }, (userModel) {
      user = User.fromJson(userModel.toJson());
      response = RequestResponse(
          success: true,
          message: "Hello ${userModel.firstname}, bienvenue sur StageUp.");
      isLogin = true;
      notifyListeners();
    });
  }

  obscureText() {
    obscure = !obscure;
    notifyListeners();
  }
}
