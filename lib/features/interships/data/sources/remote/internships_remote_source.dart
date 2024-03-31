import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stageup/core/constants/api_constants.dart';
import 'package:stageup/core/errors/exceptions.dart';
import 'package:stageup/core/helpers/shared_prefs_helper.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/interships/data/models/intership_model.dart';

class InternshipsRemoteSource {
  Future<List<InternshipModel>> getAll(NoParams params) async {
    var token = await LocalStorageHelper.getStringData('token');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "$token",
    };
    final response = await http.get(
        Uri.parse(ApiConstants.getAllInternshipsEndpoint),
        headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<InternshipModel> internships = [];
      internships =
          jsonResponse.map((e) => InternshipModel.fromJson(e)).toList();
      return internships;
    } else {
      throw ServerException();
    }
  }
}
