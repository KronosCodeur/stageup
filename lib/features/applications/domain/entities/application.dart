class Application {
  Application({
    required this.id,
    required this.internId,
    required this.internshipId,
    required this.status,
    required this.appliedAt,
    required this.cv,
    required this.motivation,
    required this.recommendation,
  });

  String id;
  String internId;
  String internshipId;
  String status;
  String appliedAt;
  String cv;
  String motivation;
  String recommendation;

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'],
      internId: json['internId'],
      internshipId: json['internshipId'],
      status: json['status'],
      appliedAt: json['appliedAt'],
      cv: json['cv'],
      motivation: json['motivation'],
      recommendation: json['recommendation'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'internId': internId,
        'internshipId': internshipId,
        'status': status,
        'appliedAt': appliedAt,
        'cv': cv,
        'motivation': motivation,
        'recommendation': recommendation,
      };
}
