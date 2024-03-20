import 'package:stage_up/features/interships/data/models/option_model.dart';

class DomainModel {
  int id;
  String title;
  List<OptionModel> options;

  DomainModel({
    required this.id,
    required this.title,
    required this.options,
  });

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(
      id: json['id'],
      title: json['title'],
      options: json['options'] == null
          ? List<OptionModel>.from([])
          : List<OptionModel>.from(
              json['options'].map((x) => OptionModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'options': options.map((e) => e.toJson()).toList(),
      };
}
