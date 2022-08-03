import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/pages/report/controllers/report_list_controller.dart';
import 'package:get/get.dart';

class ReportListBinding extends Bindings {
  @override
  void dependencies() {
    // Bind report controller
    Get.lazyPut<ReportController>(() => ReportController());
  }
}