import 'package:get/get.dart';
import 'package:kolej_client/controllers/network_controller.dart';


class DependencyInjection {
  
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}