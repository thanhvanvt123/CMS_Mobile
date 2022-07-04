import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Home controller
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}