import 'package:stage_up/features/interships/data/models/company_model.dart';

class InternshipModel {
  int id;
  String title;
  String description;
  DateTime startDate;
  DateTime endDate;
  int places;
  CompanyModel company;

  InternshipModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.places,
    required this.company,
  });

  factory InternshipModel.fromJson(Map<String, dynamic> json) {
    return InternshipModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      places: json['places'],
      company: CompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
        'places': places,
        'company': company.toJson(),
      };
}
