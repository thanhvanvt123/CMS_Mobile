import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    String valueSearch = '';
    var textEditingController = TextEditingController(text: valueSearch);
    final user = FirebaseAuth.instance.currentUser;
    var listEvent = controller.listEvents;
    Size screenSize = MediaQuery.of(context).size;
    final SharedStates sharedStates = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C9869).withOpacity(0.5),
        foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        centerTitle: true,
        title: Text(
          'Home',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        final events = controller.listEvents;
        if (events.isEmpty) {
          return Center(
            child: LoadingBouncingLine.circle(
              borderColor: Colors.cyan,
              borderSize: 3.0,
              size: 30.0,
              backgroundColor: Color(0xFF0C9869),
              duration: Duration(milliseconds: 500),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  //color: Colors.green.shade600,
                  width: screenSize.width,
                  height: screenSize.height,
                  child: Row(
                    children: [
                      Container(
                        width: screenSize.width,
                        child: FloatingSearchBar(
                          hint: 'Tìm kiếm sự kiện...',
                          scrollPadding: const EdgeInsets.only(bottom: 56),
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionCurve: Curves.easeInOut,
                          physics: const BouncingScrollPhysics(),
                          openAxisAlignment: 0.0,
                          debounceDelay: const Duration(milliseconds: 500),
                          onQueryChanged: (valueSearch) {
                            // ĐANG BỊ LỖI UI HMMMM, MONG MUỐN CHUYỂN THÀNH STACK
                            //controller: textEditingController,
                            textEditingController:
                            valueSearch;
                            //controller.searchEvents(valueSearch);
                          },
                          transition: CircularFloatingSearchBarTransition(),
                          backdropColor: Colors.black.withOpacity(0.1),
                          automaticallyImplyBackButton: false,
                          builder: (context, transition) {
                            return Material(
                              color: Colors.white,
                              elevation: 4.0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                child: Obx(() {
                                  final listSearchEvent =
                                      controller.listSearchEvents;
                                  if (controller.isSearching.value)
                                    return Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 10),
                                        child: Center(
                                            child:
                                                CircularProgressIndicator()));
                                  if (listSearchEvent.isEmpty)
                                    return Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 20),
                                        child: Text("No events found!"));
                                  int count = listSearchEvent.length > 5
                                      ? 5
                                      : listSearchEvent.length;
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: count,
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                      indent: 15,
                                      endIndent: 15,
                                      height: 0,
                                      color: Colors.black38,
                                    ),
                                    itemBuilder: (context, index) {
                                      final event = listSearchEvent[index];
                                      //final img = event.imageUrl ?? '';
                                      final title =
                                          Formatter.shorten(event.eventName);
                                      String location = event.location ?? '';
                                      return Container(
                                        height: 85,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            // leading: CircleAvatar(
                                            //   radius: 25,
                                            //   backgroundImage: NetworkImage(img),
                                            // ),
                                            title: Text(title),
                                            subtitle: Text(location),
                                            trailing: OutlinedButton.icon(
                                              onPressed: () {
                                                // controller.goToEventDetails(coupon);
                                              },
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
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      Obx(() {
                        var listEvent = controller.listEvents;
                        return Container(
                          height: screenSize.height,
                          margin: const EdgeInsets.only(left: 5),
                          child: ListView.builder(
                            addSemanticIndexes: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listEvent.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final event = listEvent[index];
                              return GestureDetector(
                                onTap: () {
                                  // controller.goToCouponDetails(coupon);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 0,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    left: 0,
                                    right: 5,
                                    bottom: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0C9869).withOpacity(0.3),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   height: 150,
                                      //   width: 280,
                                      //   margin:
                                      //       const EdgeInsets.only(bottom: 10),
                                      //   decoration: BoxDecoration(
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //         color:
                                      //             Colors.grey.withOpacity(0.5),
                                      //         spreadRadius: 1,
                                      //         blurRadius: 7,
                                      //         offset: Offset(0,
                                      //             3), // changes position of shadow
                                      //       ),
                                      //     ],
                                      //     image: DecorationImage(
                                      //       image: NetworkImage(
                                      //         event.imageUrl ?? '',
                                      //       ),
                                      //       fit: BoxFit.fitWidth,
                                      //       alignment: Alignment.topCenter,
                                      //     ),
                                      //     borderRadius:
                                      //         BorderRadius.circular(4),
                                      //   ),
                                      // ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            //color: Color(0xFF0C9869),
                                            width: 350,
                                            child: ListTile(
                                              title: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, top: 5),
                                                child: Text(
                                                  Formatter.shorten(
                                                      event.eventName),
                                                ),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, top: 5),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .local_attraction_outlined,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          event.reward!.length
                                                                  .toString() +
                                                              ' giải thưởng',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF0C9869),
                                                          ),
                                                        ),
                                                        const VerticalDivider(
                                                          width: 20,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .price_change_outlined,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          event.budget!.length
                                                                  .toString() +
                                                              ' chi phí',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF0C9869),
                                                          ),
                                                        ),
                                                        const VerticalDivider(
                                                          width: 20,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .category_outlined,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 20,
                                                        ),
                                                        Text(
                                                          event.eventItem!
                                                                  .length
                                                                  .toString() +
                                                              ' phụ kiện',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF0C9869),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, top: 5),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 20,
                                                        ),
                                                        Text(event.location
                                                            .toString()),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, top: 5),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.person,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 20,
                                                        ),
                                                        Text(event
                                                            .created!.fullName
                                                            .toString()),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, top: 5),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    // decoration: BoxDecoration(
                                                    //   border: Border.all(
                                                    //     color: Colors.grey,
                                                    //     width: 1.2,
                                                    //   ),
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //           4),
                                                    // ),
                                                    child: Row(
                                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.hourglass_top,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 18,
                                                        ),
                                                        Text(
                                                          Formatter.date(
                                                              event.startDate),
                                                        ),
                                                        const VerticalDivider(
                                                          width: 100,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .hourglass_bottom,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 18,
                                                        ),
                                                        Text(
                                                          Formatter.date(
                                                              event.endDate),
                                                          //textAlign: TextAlign.right,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}
