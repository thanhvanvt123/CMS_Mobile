import 'package:cms_mobile/src/pages/home/bindings/home_binding.dart';
import 'package:cms_mobile/src/pages/home/views/home_page.dart';
import 'package:cms_mobile/src/pages/introduction/bindings/introduction_binding.dart';
import 'package:cms_mobile/src/pages/introduction/views/introduction_view.dart';
import 'package:cms_mobile/src/pages/login/bindings/login_binding.dart';
import 'package:cms_mobile/src/pages/login/views/login_view.dart';
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
  ];
}