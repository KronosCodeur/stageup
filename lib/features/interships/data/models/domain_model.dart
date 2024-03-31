class DomainModel {
  DomainModel({
    required this.id,
    required this.title,
    required this.description,
  });

  String id;
  String title;
  String description;

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
