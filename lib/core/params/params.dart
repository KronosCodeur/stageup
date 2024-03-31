import 'dart:io';

class NoParams {}

class TemplateParams {}

class ParamsLogin {
  String phone;
  String password;

  Map<String, String> toJson() => {
        'phone': phone,
        'password': password,
      };

  ParamsLogin({required this.phone, required this.password});
}

class ParamsRegister {
  String phone;
  String password;
  String firstname;
  String lastname;
  int gender;
  String address;
  String dateOfBirth;
  String school;
  String profile;

  ParamsRegister({
    required this.phone,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.address,
    required this.dateOfBirth,
    required this.school,
    required this.profile,
  });

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
        'firstname': firstname,
        'lastname': lastname,
        'gender': gender,
        'address': address,
        'dateOfBirth': DateTime.parse(dateOfBirth).toIso8601String(),
        'school': school,
        'profile': profile,
      };
}

class ParamOne {
  String id;

  ParamOne({required this.id});
}

class UploadProfileParam {
  File file;
  String filename;

  UploadProfileParam({required this.file, required this.filename});
}

class ApplyParams {
  String internshipId;
  String internId;
  File cv;
  File? motivation;
  File? recommendation;

  ApplyParams({
    required this.internshipId,
    required this.internId,
    required this.cv,
    this.motivation,
    this.recommendation,
  });
}
