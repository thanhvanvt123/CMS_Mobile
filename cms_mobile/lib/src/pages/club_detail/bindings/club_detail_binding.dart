import 'package:cms_mobile/src/pages/club_detail/controllers/club_detail_controller.dart';
import 'package:get/get.dart';


class ClubDetailBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Club Detail controller
    Get.lazyPut<ClubDetailController>(() => ClubDetailController(), fenix: true);
  }
}