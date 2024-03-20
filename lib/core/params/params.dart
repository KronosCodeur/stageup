class NoParams {}

class TemplateParams {}

class ParamsLogin {
  final String phone;
  final String password;

  Map<String, String> toJson() => {
        'phone': phone,
        'password': password,
      };

  ParamsLogin({required this.phone, required this.password});
}

class ParamOne {
  String id;

  ParamOne({required this.id});
}

class ParamsBooking {
  final String travelId;
  final String userId;

  Map<String, String> toJson() => {
        'travelId': travelId,
        'userId': userId,
      };

  ParamsBooking({required this.travelId, required this.userId});
}
