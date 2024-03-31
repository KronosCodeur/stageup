import 'package:stageup/features/interships/domain/entities/domain.dart';

class Option {
  Option({
    required this.id,
    required this.title,
    required this.description,
    required this.domain,
  });

  String id;
  String title;
  String description;
  Domain domain;

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      domain: Domain.fromJson(json['domain']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'domain': domain.toJson(),
      };
}
