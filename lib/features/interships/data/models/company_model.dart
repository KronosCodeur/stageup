class CompanyModel {
  int id;
  String name;
  String logo;
  String email;
  String location;

  CompanyModel(
      {required this.id,
      required this.name,
      required this.logo,
      required this.email,
      required this.location});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      email: json['email'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
        'email': email,
        'location': location,
      };
}
