import 'package:cms_mobile/src/pages/club/bindings/club_binding.dart';
import 'package:cms_mobile/src/pages/club/views/club_view.dart';
import 'package:cms_mobile/src/pages/event_detail/bindings/event_detail_binding.dart';
import 'package:cms_mobile/src/pages/event_detail/views/event_detail.dart';
import 'package:cms_mobile/src/pages/home/bindings/home_binding.dart';
import 'package:cms_mobile/src/pages/home/views/home_page.dart';
import 'package:cms_mobile/src/pages/home/views/home_page_1.dart';
import 'package:cms_mobile/src/pages/introduction/bindings/introduction_binding.dart';
import 'package:cms_mobile/src/pages/introduction/views/introduction_view.dart';
import 'package:cms_mobile/src/pages/login/bindings/login_binding.dart';
import 'package:cms_mobile/src/pages/login/views/login_view.dart';
import 'package:cms_mobile/src/pages/notification/bindings/notification_binding.dart';
import 'package:cms_mobile/src/pages/notification/views/notification_view.dart';
import 'package:cms_mobile/src/pages/profile_detail/bindings/profile_detail_binding.dart';
import 'package:cms_mobile/src/pages/profile_detail/views/profile_detail_view.dart';
import 'package:cms_mobile/src/pages/setting/bindings/setting_binding.dart';
import 'package:cms_mobile/src/pages/setting/views/setting_view.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.introduction,
      page: () => IntroductionPage(),
      binding: IntroductionBinding(),
    ),

    GetPage(
      name: Routes.settings,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),

    GetPage(
      name: Routes.profileDetail,
      page: () => ProfileDetailPage(),
      binding: ProfileDetailBinding(),
    ),

    GetPage(
      name: Routes.eventDetail,
      page: () => EventDetailPage(),
      binding: EventDetailBinding(),
    ),

    GetPage(
      name: Routes.clubs,
      page: () => ClubPage(),
      binding: ClubBinding(),
    ),

    GetPage(
      name: Routes.notifications,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),
  ];
}