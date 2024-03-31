import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:stageup/core/connection/network_info.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/interships/data/services/internship_service.dart';
import 'package:stageup/features/interships/data/sources/local/internships_local_source.dart';
import 'package:stageup/features/interships/data/sources/remote/internships_remote_source.dart';
import 'package:stageup/features/interships/domain/entities/intership.dart';
import 'package:stageup/features/interships/domain/usecases/get_all_internships.dart';

class InternshipManager extends ChangeNotifier {
  String searchText = "";
  Failure? failure;
  Internship? selectedInternship;
  List<Internship>? internships;

  setSearchText(String value) {
    searchText = value;
    notifyListeners();
  }

  void setSelectedInternship(Internship internship) {
    selectedInternship = internship;
    notifyListeners();
  }

  Future<void> fetchInternships() async {
    failure = null;
    internships = null;
    DataConnectionChecker dataConnectionChecker = DataConnectionChecker();
    INetworkInfo iNetworkInfo = NetworkInfo(dataConnectionChecker);
    InternshipLocalSource internshipLocalSource = InternshipLocalSource();
    InternshipsRemoteSource internshipRemoteSource = InternshipsRemoteSource();
    InternshipService internshipService = InternshipService(
      iNetworkInfo: iNetworkInfo,
      internshipLocalSource: internshipLocalSource,
      internshipsRemoteSource: internshipRemoteSource,
    );
    GetAllInternships getAllInternships =
        GetAllInternships(internshipRepository: internshipService);
    var result = await getAllInternships.call(NoParams());
    result.fold((fail) {
      failure = fail;
      notifyListeners();
    }, (data) {
      internships = data.map((e) => Internship.fromJson(e.toJson())).toList();
      notifyListeners();
    });
    notifyListeners();
  }
}
