import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/pages/report_detail/controllers/report_controller.dart';
import 'package:get/get.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    // Bind report controller
    Get.lazyPut<ReportDetailController>(() => ReportDetailController());
  }
}