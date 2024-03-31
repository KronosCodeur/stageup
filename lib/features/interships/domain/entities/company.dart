class Company {
  Company({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.address,
    required this.email,
    required this.verified,
    required this.contact,
  });

  String id;
  String name;
  String description;
  String logo;
  String address;
  String email;
  bool verified;
  String contact;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      address: json['address'],
      email: json['email'],
      verified: json['verified'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'logo': logo,
        'address': address,
        'email': email,
        'verified': verified,
        'contact': contact,
      };
}
