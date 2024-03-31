import 'package:stageup/features/interships/domain/entities/company.dart';
import 'package:stageup/features/interships/domain/entities/option.dart';

class Internship {
  Internship({
    required this.id,
    required this.title,
    required this.description,
    required this.skills,
    required this.responsibilities,
    required this.company,
    required this.option,
    required this.startAt,
    required this.endAt,
    required this.createdAt,
    required this.updateAt,
    required this.published,
    required this.publishedAt,
    required this.numbersOfApplications,
  });

  String id;
  String title;
  String description;
  String skills;
  String responsibilities;
  Company company;
  Option option;
  String startAt;
  String endAt;
  String createdAt;
  String updateAt;
  bool published;
  String publishedAt;
  int numbersOfApplications;

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        skills: json['skills'],
        responsibilities: json['responsibilities'],
        company: Company.fromJson(json['company']),
        option: Option.fromJson(json['option']),
        startAt: json['startAt'],
        endAt: json['endAt'],
        createdAt: json['createdAt'],
        updateAt: json['updateAt'],
        published: json['published'],
        publishedAt: json['publishedAt'],
        numbersOfApplications: json['numbersOfApplications']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'skills': skills,
        'responsibilities': responsibilities,
        'company': company.toJson(),
        'option': option.toJson(),
        'startAt': startAt,
        'endAt': endAt,
        'createdAt': createdAt,
        'updateAt': updateAt,
        'published': published,
        'publishedAt': publishedAt,
        'numbersOfApplications': numbersOfApplications
      };
}
