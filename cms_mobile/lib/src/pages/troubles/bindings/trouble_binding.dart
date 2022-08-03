import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:get/get.dart';

class TroubleBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Trouble controller
    Get.lazyPut<EventDetailController>(() => EventDetailController());
  }
}