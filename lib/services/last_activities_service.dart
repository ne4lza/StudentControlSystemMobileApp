import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:kolej_client/models/last_activities_model.dart';
import 'package:http/http.dart' as http;

class LastActivitiesService {
  Future<List<LastActivitiesModel>> getLastActivities() async {
    final String token = await GetStorage().read("token");
    final String url = "products";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });

    List<LastActivitiesModel> lastActivities = [];
    var responseList = jsonDecode(response.body)['products'];
    print(response.body);
    if (response.statusCode == 200) {
      for (var jsondata in responseList) {
        lastActivities.add(LastActivitiesModel.fromJson(jsondata));
      }
      return lastActivities;
    }

    return List.empty();
  }
}
