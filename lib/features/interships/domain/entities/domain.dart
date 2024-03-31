class Domain {
  Domain({
    required this.id,
    required this.title,
    required this.description,
  });

  String id;
  String title;
  String description;

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
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
