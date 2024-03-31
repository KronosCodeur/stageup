import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:stage_up/core/constants/api_constants.dart';
import 'package:stage_up/core/helpers/shared_prefs_helper.dart';
import 'package:stage_up/core/params/params.dart';
import 'package:stage_up/features/security/data/models/user_model.dart';
import 'package:stage_up/skeleton/Dto/request_response.dart';

class UserSecurityRemoteSource {
  Future<RequestResponse> register(ParamsRegister paramsRegister) async {
    final url = Uri.parse(ApiConstants.registerEndpoint);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', url);
    request.body = json.encode(paramsRegister.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String jsonString = await utf8.decodeStream(response.stream);
    var jsonData = jsonDecode(jsonString);
    return RequestResponse.fromJson(jsonData);
  }

  Future<Either<RequestResponse, UserModel>> login(
      ParamsLogin paramsLogin) async {
    final url = Uri.parse(ApiConstants.loginEndpoint);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final response = await http.post(url,
        body: json.encode(paramsLogin.toJson()), headers: headers);
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await LocalStorageHelper.removeData('token');
      await LocalStorageHelper.addStringData('token', jsonResponse['token']);
      await LocalStorageHelper.addStringData(
          'user', jsonEncode(UserModel.fromJson(jsonResponse).toJson()));
      return Right(UserModel.fromJson(jsonResponse));
    } else {
      return Left(RequestResponse.fromJson(jsonResponse));
    }
  }

  Future<RequestResponse> uploadProfile(UploadProfileParam param) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.uploadProfileEndpoint));
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        param.file.path,
        filename: param.filename,
      ),
    );
    var res = await request.send();
    if (res.statusCode == 200) {
      String jsonString = await utf8.decodeStream(res.stream);
      Map data = jsonDecode(jsonString);
      return RequestResponse(
        success: true,
        message: data['blob']['name'],
      );
    } else {
      return RequestResponse(
        success: true,
        message: "Ce numéro  est déja utilisé !!!",
      );
    }
  }
}
