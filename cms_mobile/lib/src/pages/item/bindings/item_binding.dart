import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:get/get.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Item controller
    Get.lazyPut<EventDetailController>(() => EventDetailController());
  }
}