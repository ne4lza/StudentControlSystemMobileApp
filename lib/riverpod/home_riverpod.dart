import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/models/user_model.dart';
import 'package:kolej_client/services/get_user_service.dart';

class HomeRiverpod extends ChangeNotifier {
  late UserModel userData = UserModel();
  final service = GetUserService();
  bool isLoading = false;

  void getData() {
    isLoading = true;
    service.getAuthUser().then((value) {
      if (value != null) {
        userData = value;
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        Grock.snackBar(title: "Hata", description: "Bir sorun oluştu");
      }
    });
  }
}