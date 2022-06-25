
import 'package:cms_mobile/src/pages/login/controllers/login_controller.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Login controller
    Get.lazyPut<LoginController>(() => LoginController());
  }
}