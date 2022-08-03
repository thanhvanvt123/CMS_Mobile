import 'package:cms_mobile/src/data/api_helper.dart';
import 'package:cms_mobile/src/models/notification.dart';
import 'package:cms_mobile/src/services/api/account_service.dart';
import 'package:cms_mobile/src/services/api/club_detail_service.dart';
import 'package:cms_mobile/src/services/api/club_service.dart';
import 'package:cms_mobile/src/services/api/event_detail_service.dart';
import 'package:cms_mobile/src/services/api/event_service.dart';
import 'package:cms_mobile/src/services/api/notification_check.dart';
import 'package:cms_mobile/src/services/api/notification_read.dart';
import 'package:cms_mobile/src/services/api/notification_service.dart';
import 'package:cms_mobile/src/services/api/report_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AppInit {
  static void init() {
    initMobileAppServices();
    initAlgorithmServices();
    initApiServices();
  }

  /// Init mobile app services
  static void initMobileAppServices() {
    // Get image from file system
    Get.lazyPut<ImagePicker>(() => ImagePicker());
    // Shared states between widget
    Get.lazyPut<SharedStates>(() => SharedStates());
    // Bottom bar
    Get.lazyPut<CustomBottombarController>(() => CustomBottombarController(), fenix: true,
    );
  }

  /// Init algorithms services
  static void initAlgorithmServices() {}

  /// Init api services
  static void initApiServices() {
   // Use for calling api
    Get.lazyPut<IApiHelper>(() => ApiHelper());
    // Calling api at account service
    Get.lazyPut<IAccountService>(() => AccountService(), fenix: true);

    Get.lazyPut<IEventService>(() => EventService(), fenix: true);

    Get.lazyPut<IEventDetailService>(() => EventDetailService(), fenix: true);

    Get.lazyPut<IClubService>(() => ClubService(), fenix: true);

    Get.lazyPut<IClubDetailService>(() => ClubDetailService(), fenix: true);

    Get.lazyPut<INotificationService>(() => NotificationService(), fenix: true);

    // Get.lazyPut<INotificationCheckService>(() => NotificationCheckService(), fenix: true);

    Get.lazyPut<INotificationReadService>(() => NotificationReadService(), fenix: true);

    Get.lazyPut<IReportService>(() => ReportService(), fenix: true);
  }
}
