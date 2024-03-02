import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kolej_client/constants/constants.dart';

class QrService {
  Future<void> sendQrData(String userName, String qrCodeValue) async {
    final String url ="http://192.168.1.6:8070/QRDatas";
    final String token = await GetStorage().read("token");
    Map<String, dynamic> jsonModel = {"UserName": userName, "QRDatas": qrCodeValue};
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
          },
        body: jsonEncode(jsonModel));

    if (response.statusCode == 200) {
      print("Qr Okuma Başarılı: ${response.body}");
    } else {
      print("Qr Okuma Başarısız: ${response.body}");
    }
  }
}
