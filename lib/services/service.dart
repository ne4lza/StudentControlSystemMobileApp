import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/models/last_activities_model.dart';
import 'package:kolej_client/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:kolej_client/models/user_model.dart';

class Service {
  Future<LoginModel?> loginCall(
      {required String username, required String password}) async {
    final tokenBox = GetStorage();
    final userNameBox = GetStorage();
    final String url = "http://192.168.1.6:8070/api/Giris/Token";
    Map<String, dynamic> jsonModel = {"UserName": username, "Password": password};
    final response = await http.post(Uri.parse(url),
    headers: {'Content-Type': 'application/json'}, 
    body: jsonEncode(jsonModel)
    );

    if (response.statusCode == 200) {
      print("Başarılı: ${response.body}");
      var result = LoginModel.fromJson(jsonDecode(response.body));
      print("Gelen Response => $result");
      tokenBox.write("token", result.token);
      userNameBox.write("userName",username);
      print(tokenBox.read("token"));
      print(tokenBox.read("userName"));
      return result;
    } else {
      Get.rawSnackbar(
          messageText: Text(
              '${"Hata Kodu => " + response.statusCode.toString()}',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
      return null;
    }
  }

  Future<UserModel?> userCall() async {
    final String token = await GetStorage().read("token");
    final String userName = await GetStorage().read("userName");
    final String url = "http://192.168.1.6:8070/api/WhoIsToken/ValidateToken";
    var response = await http.post(Uri.parse(url), 
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({"Token": token, "UserName": userName})
    );

    if (response.statusCode == 200) {
      var result = UserModel.fromJson(jsonDecode(response.body));
      print(result);
      print(response.body);
      return result;
    } else {
      Grock.snackBar(title: "Hata Kodu", description: "${response.statusCode}");
      return null;
    }
  }

  Future<List<LastActivitiesModel>> getLast() async {
  final String token = await GetStorage().read("token");
  final String url = "products";
  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    }
  );

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