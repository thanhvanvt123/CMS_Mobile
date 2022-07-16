import 'package:cms_mobile/src/pages/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Notification controller
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}