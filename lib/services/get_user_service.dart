import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:kolej_client/constants/constants.dart';
import 'package:kolej_client/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetUserService {
  Future<UserModel?> getAuthUser() async {
    final String token = await GetStorage().read("token");
    final String userName = await GetStorage().read("userName");
    final String url = "${Constants.testBaseUrl}WhoIsToken/ValidateToken";
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({"Token": token, "UserName": userName}));

    if (response.statusCode == 200) {
      var result = UserModel.fromJson(jsonDecode(response.body));
      print(result);
      print(response.body);
      return result;
    }
    return null;
  }
}
