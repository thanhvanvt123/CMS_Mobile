
import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:get/get.dart';


class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Event Detail controller
    Get.lazyPut<EventDetailController>(() => EventDetailController(), fenix: true);
  }
}