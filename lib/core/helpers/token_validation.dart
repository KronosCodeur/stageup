import 'package:http/http.dart' as http;
import 'package:stage_up/core/constants/api_constants.dart';
import 'package:stage_up/core/helpers/shared_prefs_helper.dart';

Future<bool> checkIfTokenIsValid() async {
  var token = await LocalStorageHelper.getStringData("token");
  var request = http.Request('GET',
      Uri.parse("${ApiConstants.apiAuthUrl}/IsTokenValid/Bearer $token"));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
