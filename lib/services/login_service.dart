import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:kolej_client/constants/constants.dart';
import 'package:kolej_client/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<LoginModel?> loginUser(
      {required String username, required String password}) async {
    final tokenBox = GetStorage();
    final userNameBox = GetStorage();
    final String url = "${Constants.testBaseUrl}Giris/Token";
    Map<String, dynamic> jsonModel = {
      "UserName": username,
      "Password": password
    };
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(jsonModel));

    if (response.statusCode == 200) {
      print("Başarılı: ${response.body}");
      var result = LoginModel.fromJson(jsonDecode(response.body));
      print("Gelen Response => $result");
      tokenBox.write("token", result.token);
      userNameBox.write("userName", username);
      print(tokenBox.read("token"));
      print(tokenBox.read("userName"));
      return result;
    }
    else{
      print(response.body);
    }
    return null;
  }
}
