import 'package:stageup/features/interships/data/models/domain_model.dart';

class OptionModel {
  OptionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.domain,
  });

  String id;
  String title;
  String description;
  DomainModel domain;

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      domain: DomainModel.fromJson(json['domain']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'domain': domain.toJson(),
      };
}
