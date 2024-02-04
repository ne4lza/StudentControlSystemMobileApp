import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'package:kolej_client/components/loading_popup.dart';
import 'package:kolej_client/services/service.dart';
import 'package:kolej_client/views/scan_qr_code.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void fetch() {
    loadingPopup();
    service.loginCall(username: usernameController.text, password: passwordController.text).then((value) {
      print(value);
      if (value != null) {
        Grock.back();
        Grock.toRemove(ScanQrCode());
      } else {
        Grock.back();
         Get.rawSnackbar(
          messageText: const Text(
            'Lütfen kullanıcı adınızı veya şifrenizi kontrol edin.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14
            )
          ),
          isDismissible: false,
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.red[400]!,
          icon : const Icon(Icons.lock, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.FLOATING
        );
      }
    });
  }
}
