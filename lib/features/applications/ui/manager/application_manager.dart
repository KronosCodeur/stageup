import 'dart:io';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:stageup/core/connection/network_info.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/applications/data/services/application_service.dart';
import 'package:stageup/features/applications/data/sources/local/application_local_source.dart';
import 'package:stageup/features/applications/data/sources/remote/application_remote_source.dart';
import 'package:stageup/features/applications/domain/entities/application.dart';
import 'package:stageup/features/applications/domain/usecases/apply.dart';
import 'package:stageup/features/applications/domain/usecases/get_user_applications.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class ApplicationManager extends ChangeNotifier {
  List<Application>? applications;
  Failure? failure;
  String searchText = "";
  RequestResponse response = RequestResponse(success: false, message: "");
  Application? selectedApplication;
  ApplyParams applyParams = ApplyParams(
    internshipId: "internshipId",
    internId: "internId",
    cv: File("path"),
  );

  setInternshipId(String value) {
    applyParams.internshipId = value;
    notifyListeners();
  }

  setInternId(String value) {
    applyParams.internId = value;
    notifyListeners();
  }

  setCv(File value) {
    applyParams.cv = value;
    notifyListeners();
  }

  setMotivation(File value) {
    applyParams.motivation = value;
    notifyListeners();
  }

  setRecommendation(File value) {
    applyParams.recommendation = value;
    notifyListeners();
  }

  void setSelectedApplications(Application application) {
    selectedApplication = application;
    notifyListeners();
  }

  Future<void> fetchApplications() async {
    DataConnectionChecker dataConnectionChecker = DataConnectionChecker();
    INetworkInfo iNetworkInfo = NetworkInfo(dataConnectionChecker);
    ApplicationLocalSource applicationLocalSource = ApplicationLocalSource();
    ApplicationsRemoteSource applicationRemoteSource =
        ApplicationsRemoteSource();
    ApplicationService applicationService = ApplicationService(
        iNetworkInfo: iNetworkInfo,
        applicationLocalSource: applicationLocalSource,
        applicationsRemoteSource: applicationRemoteSource);
    GetUserApplications getUserApplications =
        GetUserApplications(applicationRepository: applicationService);
    var result = await getUserApplications.call(NoParams());
    result.fold((fail) {
      failure = fail;
      notifyListeners();
    }, (data) {
      applications = data.map((e) => Application.fromJson(e.toJson())).toList();
      print(data);
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> apply() async {
    DataConnectionChecker dataConnectionChecker = DataConnectionChecker();
    INetworkInfo iNetworkInfo = NetworkInfo(dataConnectionChecker);
    ApplicationLocalSource applicationLocalSource = ApplicationLocalSource();
    ApplicationsRemoteSource applicationRemoteSource =
        ApplicationsRemoteSource();
    ApplicationService applicationService = ApplicationService(
        iNetworkInfo: iNetworkInfo,
        applicationLocalSource: applicationLocalSource,
        applicationsRemoteSource: applicationRemoteSource);
    Apply apply = Apply(applicationRepository: applicationService);
    var result = await apply.call(applyParams);
    result.fold((failure) {
      response = RequestResponse(success: false, message: failure.errorMessage);
      notifyListeners();
    }, (res) {
      response = res;
      notifyListeners();
    });
  }
}
