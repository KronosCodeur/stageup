import 'dart:convert';

import 'package:stageup/core/helpers/shared_prefs_helper.dart';
import 'package:stageup/features/interships/data/models/intership_model.dart';

class InternshipLocalSource {
  Future<void> cacheInternships(List<InternshipModel> internships) async {
    final jsonList = internships
        .map((internship) => jsonEncode(internship.toJson()))
        .toList();
    await LocalStorageHelper.addStringListData('internships', jsonList);
  }

  Future<List<InternshipModel>> getCachedInternships() async {
    final jsonStringList =
        await LocalStorageHelper.getStringListData('internships') ?? [];
    final cachedInternships = jsonStringList
        .map((jsonString) => InternshipModel.fromJson(jsonDecode(jsonString)))
        .toList();
    return cachedInternships.cast<InternshipModel>();
  }
}
