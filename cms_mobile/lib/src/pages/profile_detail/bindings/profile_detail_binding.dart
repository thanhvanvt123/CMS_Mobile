import 'package:cms_mobile/src/pages/profile_detail/controllers/profile_detail_controller.dart';
import 'package:get/get.dart';


class ProfileDetailBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Introduction controller
    Get.lazyPut<ProfileDetailController>(() => ProfileDetailController());
  }
}