import 'dart:convert';

import 'package:stageup/core/helpers/shared_prefs_helper.dart';
import 'package:stageup/features/applications/data/models/application_model.dart';

class ApplicationLocalSource {
  Future<void> cacheApplications(List<ApplicationModel> applications) async {
    final jsonList = applications
        .map((application) => jsonEncode(application.toJson()))
        .toList();
    await LocalStorageHelper.addStringListData('applications', jsonList);
  }

  Future<List<ApplicationModel>> getCachedApplications() async {
    final jsonStringList =
        await LocalStorageHelper.getStringListData('applications') ?? [];
    final cachedApplications = jsonStringList
        .map((jsonString) => ApplicationModel.fromJson(jsonDecode(jsonString)))
        .toList();
    return cachedApplications.cast<ApplicationModel>();
  }
}
