import 'package:cms_mobile/src/pages/budget/bindings/budget_binding.dart';
import 'package:cms_mobile/src/pages/budget/views/budget_view.dart';
import 'package:cms_mobile/src/pages/club/bindings/club_binding.dart';
import 'package:cms_mobile/src/pages/club/views/club_view.dart';
import 'package:cms_mobile/src/pages/club_detail/bindings/club_detail_binding.dart';
import 'package:cms_mobile/src/pages/club_detail/views/club_detail_view.dart';
import 'package:cms_mobile/src/pages/event_detail/bindings/event_detail_binding.dart';
import 'package:cms_mobile/src/pages/event_detail/views/event_detail.dart';
import 'package:cms_mobile/src/pages/event_log/bindings/log_event_binding.dart';
import 'package:cms_mobile/src/pages/event_log/views/event_log.dart';
import 'package:cms_mobile/src/pages/history/bindings/history_binding.dart';
import 'package:cms_mobile/src/pages/history/views/history.dart';
import 'package:cms_mobile/src/pages/home/bindings/home_binding.dart';
import 'package:cms_mobile/src/pages/home/views/home_page.dart';
import 'package:cms_mobile/src/pages/home/views/home_page_1.dart';
import 'package:cms_mobile/src/pages/introduction/bindings/introduction_binding.dart';
import 'package:cms_mobile/src/pages/introduction/views/introduction_view.dart';
import 'package:cms_mobile/src/pages/item/bindings/item_binding.dart';
import 'package:cms_mobile/src/pages/item/views/item.dart';
import 'package:cms_mobile/src/pages/login/bindings/login_binding.dart';
import 'package:cms_mobile/src/pages/login/views/login_view.dart';
import 'package:cms_mobile/src/pages/notification/bindings/notification_binding.dart';
import 'package:cms_mobile/src/pages/notification/views/notification_view.dart';
import 'package:cms_mobile/src/pages/profile_detail/bindings/profile_detail_binding.dart';
import 'package:cms_mobile/src/pages/profile_detail/views/profile_detail_view.dart';
import 'package:cms_mobile/src/pages/report/bindings/report_list_binding.dart';
import 'package:cms_mobile/src/pages/report/views/report_view.dart';
import 'package:cms_mobile/src/pages/report_detail/bindings/report_binding.dart';
import 'package:cms_mobile/src/pages/report_detail/views/report_detail.dart';
import 'package:cms_mobile/src/pages/reward/bindings/rewad_binding.dart';
import 'package:cms_mobile/src/pages/reward/views/reward.dart';
import 'package:cms_mobile/src/pages/setting/bindings/setting_binding.dart';
import 'package:cms_mobile/src/pages/setting/views/setting_view.dart';
import 'package:cms_mobile/src/pages/troubles/bindings/trouble_binding.dart';
import 'package:cms_mobile/src/pages/troubles/views/trouble.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage1(),
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
      name: Routes.clubDetail,
      page: () => ClubDetailPage(),
      binding: ClubDetailBinding(),
    ),

    GetPage(
      name: Routes.notifications,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),

    GetPage(
      name: Routes.budget,
      page: () => Budget(),
      binding: BudgetBinding(),
    ),

    GetPage(
      name: Routes.reward,
      page: () => Reward(),
      binding: RewardBinding(),
    ),

    GetPage(
      name: Routes.item,
      page: () => Item(),
      binding: ItemBinding(),
    ),

    GetPage(
      name: Routes.hisEvent,
      page: () => History(),
      binding: HistoryBinding(),
    ),

    GetPage(
      name: Routes.report,
      page: () => ReportPage(),
      binding: ReportListBinding(),
    ),
    
    GetPage(
      name: Routes.reportDetail,
      page: () => ReportDetailPage(),
      binding: ReportBinding(),
    ),

    GetPage(
      name: Routes.eventLog,
      page: () => EventLogPage(),
      binding: EventLogBinding(),
    ),

    GetPage(
      name: Routes.trouble,
      page: () => TroublePage(),
      binding: TroubleBinding(),
    ),
  ];
}