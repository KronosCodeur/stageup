import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stageup/core/constants/api_constants.dart';
import 'package:stageup/core/errors/exceptions.dart';
import 'package:stageup/core/helpers/shared_prefs_helper.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/applications/data/models/application_model.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class ApplicationsRemoteSource {
  Future<List<ApplicationModel>> getUserApplications(NoParams params) async {
    var token = await LocalStorageHelper.getStringData('token');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "$token",
    };
    final response = await http.get(
        Uri.parse(ApiConstants.getUserApplicationsEndpoint),
        headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ApplicationModel> applications = [];
      applications =
          jsonResponse.map((e) => ApplicationModel.fromJson(e)).toList();
      return applications;
    } else {
      throw ServerException();
    }
  }

  Future<RequestResponse> apply(ApplyParams params) async {
    var token = await LocalStorageHelper.getStringData('token');
    var headers = {'accept': '*/*', 'Authorization': '$token'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://localhost:5149/api/v1/Application/Create?InternshipId=${params.internshipId}'));
    request.files.add(await http.MultipartFile.fromPath('Cv', params.cv.path,
        filename:
            "${params.internshipId}CV${params.internId}${DateTime.now().millisecondsSinceEpoch}"));
    if (params.motivation != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'Motivation', params.motivation!.path,
          filename:
              "${params.internshipId}Motivation${params.internId}${DateTime.now().millisecondsSinceEpoch}"));
    }
    if (params.recommendation != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'Recommendation', params.recommendation!.path,
          filename:
              "${params.internshipId}Recommendation${params.internId}${DateTime.now().millisecondsSinceEpoch}"));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      String jsonString = await utf8.decodeStream(response.stream);
      Map<String, dynamic> data = jsonDecode(jsonString);
      return RequestResponse.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
