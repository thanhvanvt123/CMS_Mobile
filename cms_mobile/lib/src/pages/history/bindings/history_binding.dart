import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:get/get.dart';


class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Event history controller
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}