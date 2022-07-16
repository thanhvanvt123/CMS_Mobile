import 'package:cms_mobile/src/pages/club/controllers/club_controller.dart';
import 'package:get/get.dart';

class ClubBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Club controller
    Get.lazyPut<ClubController>(() => ClubController());
  }
}