class StudentModel {
  int id;
  String lastName;
  String firstName;
  DateTime dateOfBirth;
  String phone;
  String gender;

  StudentModel({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.dateOfBirth,
    required this.phone,
    required this.gender,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      dateOfBirth: json['dateOfBirth'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'dateOfBirth': dateOfBirth,
        'phone': phone,
        'gender': gender,
      };
}
