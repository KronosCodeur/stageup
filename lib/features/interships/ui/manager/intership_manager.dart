import 'package:flutter/material.dart';
import 'package:stage_up/features/interships/data/models/company_model.dart';
import 'package:stage_up/features/interships/data/models/intership_model.dart';

class InternshipManager extends ChangeNotifier {
  String searchText = "";
  InternshipModel? selectedInternship;
  List<InternshipModel> internships = [
    InternshipModel(
      id: 1,
      title: "Dévéloppeur d'Application Mobile",
      description:
          "Nous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs deNous recherchons un develepeurs de",
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      places: 5,
      company: CompanyModel(
        id: 1,
        name: "Dracarys Technology",
        logo: "logo",
        email: "contact@dracarys.tech",
        location: "Legbassito,Lomé",
      ),
    ),
  ];

  setSearchText(String value) {
    searchText = value;
    notifyListeners();
  }

  void setSelectedInternship(InternshipModel internship) {
    selectedInternship = internship;
    notifyListeners();
  }
}
