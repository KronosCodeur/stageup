class Student {
  String lastName;
  String firstName;
  DateTime dateOfBirth;
  String phone;
  String profile;
  String gender;

  Student({
    required this.lastName,
    required this.firstName,
    required this.dateOfBirth,
    required this.phone,
    required this.profile,
    required this.gender,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      lastName: json['lastName'],
      firstName: json['firstName'],
      profile: json['profile'],
      dateOfBirth: json['dateOfBirth'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
        'dateOfBirth': dateOfBirth,
        'phone': phone,
        'profile': profile,
        'gender': gender,
      };
}
