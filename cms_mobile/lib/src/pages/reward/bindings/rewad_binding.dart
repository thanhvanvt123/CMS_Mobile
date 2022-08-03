import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:get/get.dart';

class RewardBinding extends Bindings {
  @override
  void dependencies() {
    // Bind reward controller
    Get.lazyPut<EventDetailController>(() => EventDetailController());
  }
}