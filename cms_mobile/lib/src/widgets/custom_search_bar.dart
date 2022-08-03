import 'package:cms_mobile/src/pages/club/controllers/club_controller.dart';
import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:cms_mobile/src/pages/report/controllers/report_list_controller.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomeSearchBar extends GetView<HomeController> {
  final String? search;
  final String? selected;
  const HomeSearchBar({
    Key? key,
    this.search,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return FloatingSearchBar(
      hint: 'Tìm kiếm sự kiện..',
      scrollPadding: const EdgeInsets.only(top: 10, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: 390,
      debounceDelay: const Duration(milliseconds: 500),
      onSubmitted: (query) => controller.searchEvents(query),
      transition: CircularFloatingSearchBarTransition(),
      backdropColor: Colors.black.withOpacity(0.1),
      automaticallyImplyBackButton: false,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 1.3,
                  color: Colors.grey.shade300,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 10),
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 'đang hoạt động',
                          child: Text("Đang hoạt động")),
                      // PopupMenuItem(
                      //     value: 'chờ duyệt', child: Text("Chờ duyệt")),
                      PopupMenuItem(
                          value: 'đang diễn ra', child: Text("Đang diễn ra")),
                      // PopupMenuItem(
                      //     value: 'chờ góp ý', child: Text("Chờ góp ý")),
                      // PopupMenuItem(
                      //     value: 'hoàn thành', child: Text("Hoàn thành")),
                    ],
                    onCanceled: () => print("You have canceled the menu."),
                    onSelected: (value) {
                      print("value:$value");
                      controller.filterEvents(value);
                    },
                    icon: Icon(
                      FontAwesomeIcons.slidersH,
                      //Icons.sort,
                      color: Colors.black45,
                    ),
                  ),

                  //child: FilterPage(),
                ),

              ],
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Material(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Obx(() {
              final listEvents = controller.listSearchEvents;
              print("search=== " + controller.isSearching.value.toString());
              if (controller.isSearching.value)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Center(child: CircularProgressIndicator()));
              if (listEvents.isEmpty)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: Text("No events found!"));
              int count = listEvents.length;
              //> 5 ? 5 : listEvents.length;
              print("==== " + listEvents.toString());
              return ListView.separated(
                shrinkWrap: true,
                itemCount: count,
                separatorBuilder: (context, index) => Divider(
                  indent: 15,
                  endIndent: 15,
                  height: 0,
                  color: Colors.black38,
                ),
                itemBuilder: (context, index) {
                  final event = listEvents[index];
                  //final img = coupon.imageUrl ?? "";
                  final title = Formatter.shorten(event.eventName);
                  //+ " - " +
                  //Formatter.shorten(ev.name);
                  final description = Formatter.shorten(event.description);
                  return Container(
                    height: 85,
                    child: TextButton(
                      onPressed: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        // leading: CircleAvatar(
                        //   radius: 25,
                        //   backgroundImage: NetworkImage(img),
                        // ),
                        title: Text(title),
                        subtitle: Text(description),
                        trailing: OutlinedButton.icon(
                          onPressed: () => controller.goToDetail(event.eventId),
                          icon: Icon(
                            Icons.local_activity,
                            size: 24,
                          ),
                          label: Text("Chi Tiết"),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}

class ClubSearchBar extends GetView<ClubController> {
  final String? search;
  final String? selected;
  const ClubSearchBar({
    Key? key,
    this.search,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return FloatingSearchBar(
      hint: 'Tìm kiếm câu lạc bộ...',
      scrollPadding: const EdgeInsets.only(top: 10, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: 390,
      debounceDelay: const Duration(milliseconds: 500),
      onSubmitted: (query) => controller.searchClubs(query),
      transition: CircularFloatingSearchBarTransition(),
      backdropColor: Colors.black.withOpacity(0.1),
      automaticallyImplyBackButton: false,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 1.3,
                  color: Colors.grey.shade300,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 10),
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 'Thử nghiệm',
                          child: Text("Thử nghiệm")),
                      PopupMenuItem(
                          value: 'Đang hoạt động', child: Text("Đang hoạt động")),
                      PopupMenuItem(
                          value: 'Ngừng hoạt động', child: Text("Ngừng hoạt động")),
                    ],
                    onCanceled: () => print("You have canceled the menu."),
                    onSelected: (value) {
                      print("value:$value");
                      controller.filterClub(value);
                      // switch (value) {
                      //   case 1:
                      //     Get.toNamed('/home');
                      //     break;
                      //   case 2:
                      //     Get.toNamed('/dashboard');
                      //     break;
                      //   default:
                      // }
                      // controller.filterEvents(value);
                    },
                    icon: Icon(
                      FontAwesomeIcons.slidersH,
                      //Icons.sort,
                      color: Colors.black45,
                    ),
                  ),

                  //child: FilterPage(),
                ),
                // Text(
                //   Formatter.shorten(eve, 10),
                //   style: TextStyle(
                //     color: Colors.black54,
                //     fontSize: 15,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Material(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Obx(() {
              final listClubs = controller.listSearchClubs;
              print("search=== " + controller.isSearching.value.toString());
              if (controller.isSearching.value)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Center(child: CircularProgressIndicator()));
              if (listClubs.isEmpty)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: Text("No clubs found!"));
              int count = listClubs.length;
              //> 5 ? 5 : listEvents.length;
              print("==== " + listClubs.toString());
              return ListView.separated(
                shrinkWrap: true,
                itemCount: count,
                separatorBuilder: (context, index) => Divider(
                  indent: 15,
                  endIndent: 15,
                  height: 0,
                  color: Colors.black38,
                ),
                itemBuilder: (context, index) {
                  final club = listClubs[index];
                  //final img = coupon.imageUrl ?? "";
                  final title = Formatter.shorten(club.clubName);
                  //+ " - " +
                  //Formatter.shorten(ev.name);
                  final description = Formatter.shorten(club.shortName);
                  return Container(
                    height: 85,
                    child: TextButton(
                      onPressed: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        // leading: CircleAvatar(
                        //   radius: 25,
                        //   backgroundImage: NetworkImage(img),
                        // ),
                        title: Text(title),
                        subtitle: Text(description),
                        trailing: OutlinedButton.icon(
                          onPressed: () => controller.goToDetail(club.clubId),
                          icon: Icon(
                            Icons.local_activity,
                            size: 24,
                          ),
                          label: Text("Chi Tiết"),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}

class HistoryEventSearchBar extends GetView<HomeController> {
  final String? search;
  final String? selected;
  const HistoryEventSearchBar({
    Key? key,
    this.search,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return FloatingSearchBar(
      hint: 'Tìm kiếm sự kiện..',
      scrollPadding: const EdgeInsets.only(top: 10, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: 390,
      debounceDelay: const Duration(milliseconds: 500),
      onSubmitted: (query) => controller.searchHisEvents(query),
      transition: CircularFloatingSearchBarTransition(),
      backdropColor: Colors.black.withOpacity(0.1),
      automaticallyImplyBackButton: false,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 1.3,
                  color: Colors.grey.shade300,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 10),
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      // PopupMenuItem(
                      //     value: 'đang hoạt động',
                      //     child: Text("Đang hoạt động")),
                      PopupMenuItem(
                          value: 'chờ duyệt', child: Text("Chờ duyệt")),
                      PopupMenuItem(
                          value: 'không duyệt', child: Text("Không duyệt")),
                      PopupMenuItem(
                          value: 'chờ góp ý', child: Text("Chờ góp ý")),
                      PopupMenuItem(
                          value: 'hoàn thành', child: Text("Hoàn thành")),
                    ],
                    onCanceled: () => print("You have canceled the menu."),
                    onSelected: (value) {
                      print("value:$value");
                      controller.filterHisEvents(value);
                    },
                    icon: Icon(
                      FontAwesomeIcons.slidersH,
                      //Icons.sort,
                      color: Colors.black45,
                    ),
                  ),

                  //child: FilterPage(),
                ),

              ],
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Material(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Obx(() {
              final listHisEvents = controller.listSearchHisEvents;
              print("search=== " + controller.isHisSearching.value.toString());
              if (controller.isSearching.value)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Center(child: CircularProgressIndicator()));
              if (listHisEvents.isEmpty)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: Text("No events found!"));
              int count = listHisEvents.length;
              //> 5 ? 5 : listEvents.length;
              print("==== " + listHisEvents.toString());
              return ListView.separated(
                shrinkWrap: true,
                itemCount: count,
                separatorBuilder: (context, index) => Divider(
                  indent: 15,
                  endIndent: 15,
                  height: 0,
                  color: Colors.black38,
                ),
                itemBuilder: (context, index) {
                  final event = listHisEvents[index];
                  //final img = coupon.imageUrl ?? "";
                  final title = Formatter.shorten(event.eventName);
                  //+ " - " +
                  //Formatter.shorten(ev.name);
                  final description = Formatter.shorten(event.description);
                  return Container(
                    height: 85,
                    child: TextButton(
                      onPressed: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        // leading: CircleAvatar(
                        //   radius: 25,
                        //   backgroundImage: NetworkImage(img),
                        // ),
                        title: Text(title),
                        subtitle: Text(description),
                        trailing: OutlinedButton.icon(
                          onPressed: () => controller.goToDetail(event.eventId),
                          icon: Icon(
                            Icons.local_activity,
                            size: 24,
                          ),
                          label: Text("Chi Tiết"),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}
//report search
class ReportSearchBar extends GetView<ReportController> {
  final String? search;
  final String? selected;
  const ReportSearchBar({
    Key? key,
    this.search,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return FloatingSearchBar(
      hint: 'Tìm kiếm báo cáo..',
      scrollPadding: const EdgeInsets.only(top: 10, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: 390,
      debounceDelay: const Duration(milliseconds: 500),
      onSubmitted: (query) => controller.searchReports(query),
      transition: CircularFloatingSearchBarTransition(),
      backdropColor: Colors.black.withOpacity(0.1),
      automaticallyImplyBackButton: false,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 1.3,
                  color: Colors.grey.shade300,
                ),
                // Container(
                //   margin: const EdgeInsets.only(left: 8, right: 10),
                //   child: PopupMenuButton(
                //     itemBuilder: (context) => [
                //       // PopupMenuItem(
                //       //     value: 'đang hoạt động',
                //       //     child: Text("Đang hoạt động")),
                //       PopupMenuItem(
                //           value: 'chờ duyệt', child: Text("Chờ duyệt")),
                //       // PopupMenuItem(
                //       //     value: 'đang diễn ra', child: Text("Đang diễn ra")),
                //       PopupMenuItem(
                //           value: 'chờ góp ý', child: Text("Chờ góp ý")),
                //       PopupMenuItem(
                //           value: 'hoàn thành', child: Text("Hoàn thành")),
                //     ],
                //     onCanceled: () => print("You have canceled the menu."),
                //     onSelected: (value) {
                //       print("value:$value");
                //       controller.filterHisEvents(value);
                //     },
                //     icon: Icon(
                //       FontAwesomeIcons.slidersH,
                //       //Icons.sort,
                //       color: Colors.black45,
                //     ),
                //   ),

                //   //child: FilterPage(),
                // ),

              ],
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Material(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Obx(() {
              final listReports = controller.listSearchReport;
              print("search=== " + controller.isSearching.value.toString());
              if (controller.isSearching.value)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Center(child: CircularProgressIndicator()));
              if (listReports.isEmpty)
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: Text("No reports found!"));
              int count = listReports.length;
              //> 5 ? 5 : listEvents.length;
              print("==== " + listReports.toString());
              return ListView.separated(
                shrinkWrap: true,
                itemCount: count,
                separatorBuilder: (context, index) => Divider(
                  indent: 15,
                  endIndent: 15,
                  height: 0,
                  color: Colors.black38,
                ),
                itemBuilder: (context, index) {
                  final report = listReports[index];
                  //final img = coupon.imageUrl ?? "";
                  final title = Formatter.shorten(report.reportName);
                  //+ " - " +
                  //Formatter.shorten(ev.name);
                  final description = Formatter.shorten(report.description);
                  return Container(
                    height: 85,
                    child: TextButton(
                      onPressed: () {},
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        // leading: CircleAvatar(
                        //   radius: 25,
                        //   backgroundImage: NetworkImage(img),
                        // ),
                        title: Text(title),
                        subtitle: Text(description),
                        trailing: OutlinedButton.icon(
                          onPressed: () => controller.goToDetail(report.reportId),
                          icon: Icon(
                            Icons.local_activity,
                            size: 24,
                          ),
                          label: Text("Chi Tiết"),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}
