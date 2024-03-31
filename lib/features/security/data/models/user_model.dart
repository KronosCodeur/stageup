class UserModel {
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.address,
    required this.phone,
    required this.dateOfBirth,
    required this.school,
    required this.profile,
  });
  String id;
  String firstname;
  String lastname;
  String gender;
  String address;
  String phone;
  String dateOfBirth;
  String school;
  String profile;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      gender: json['gender'],
      address: json['address'],
      phone: json['phone'],
      dateOfBirth: json['dateOfBirth'],
      school: json['school'],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'gender': gender,
        'address': address,
        'phone': phone,
        'dateOfBirth': dateOfBirth,
        'school': school,
        'profile': profile,
      };
}
