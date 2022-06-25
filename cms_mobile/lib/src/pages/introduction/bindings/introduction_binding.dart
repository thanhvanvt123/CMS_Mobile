
import 'package:cms_mobile/src/pages/introduction/controllers/introduction_controller.dart';
import 'package:get/get.dart';


class IntroductionBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Introduction controller
    Get.lazyPut<IntroductionController>(() => IntroductionController());
  }
}