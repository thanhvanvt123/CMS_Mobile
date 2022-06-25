import 'package:cms_mobile/src/pages/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Login controller
    Get.lazyPut<SettingController>(() => SettingController());
  }
}