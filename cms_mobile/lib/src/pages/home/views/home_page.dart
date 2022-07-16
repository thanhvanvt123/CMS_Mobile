import 'dart:async';
import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/event_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:cms_mobile/src/widgets/custom_search_bar.dart';
import 'package:cms_mobile/src/widgets/text_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:rxdart/rxdart.dart';

StreamController<String> streamController = BehaviorSubject();


class HomePage extends GetView<HomeController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //late Future<List<Event>?> eventsFound = EventService.getAllEvent('');

  // void mySetState(String search) {
  //   setState(() {
  //     eventsFound = EventService.getAllEvent(search);
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    //String valueSearch = ''
    // var textEditingController = TextEditingController(text: valueSearch);
    
    final searchController = TextEditingController();
    TextEditingController txt = TextEditingController();
    bool isSearchAll = true;
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
          'Sự kiện',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        // bottom: PreferredSize(
        //   child: HomeSearchBar(),
        //   preferredSize: Size.fromHeight(5),
        // ),
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
            controller: controller.scrollController,
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Container(
                 margin: EdgeInsets.only(top: 5),
                  // //color: Colors.green.shade600,
                  width: screenSize.width,
                  height: screenSize.height,
                  // child: HomeSearchBar(),
                  //margin: const EdgeInsets.only(top: 55),
                  child: const HomeSearchBar(),
                  //child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  // children: [
                  //   Container(
                  //child: HomeSearchBar(),
                  //width: screenSize.width,
                  // child: TextField(
                  //   enableSuggestions: true,
                  //   controller: searchController,
                  //   // onFieldSubmitted: (searchValue) {
                  //   //   searchController.clear();
                  //   //   // streamController.add(text);

                  //   //   controller.filterPlayer(searchController.text);
                  //   // },
                  //   onChanged: (value) => controller.searchEvents(value),
                    
                  //   style: TextStyle(color: Color(0xFF96A7AF), fontSize: 18),
                  //   textAlign: TextAlign.left,
                  //   decoration: InputDecoration(
                  //     hintStyle:
                  //         TextStyle(color: Color(0xFF96A7AF), fontSize: 18),
                  //     hoverColor: Color(0xFF96A7AF),
                  //     contentPadding: EdgeInsets.only(top: 5),
                  //     hintText: "Search event",
                  //     prefixIcon: Icon(
                  //       Icons.search,
                  //       color: Color(0xFF96A7AF),
                  //     ),
                  //     border: UnderlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //   ),
                  // ),
                  // child: FloatingSearchBar(

                  //   automaticallyImplyBackButton: false,
                  //   controller: FloatingSearchBarController(),
                  //   clearQueryOnClose: true,
                  //   hint: 'Tìm kiếm sự kiện...',
                  //   scrollPadding: const EdgeInsets.only(bottom: 56),
                  //   transitionDuration: const Duration(milliseconds: 800),
                  //   transitionCurve: Curves.easeInOut,
                  //   physics: const BouncingScrollPhysics(),
                  //   openAxisAlignment: 0.0,
                  //   debounceDelay: const Duration(milliseconds: 500),
                  //   //scrollPadding: EdgeInsets.zero,
                  //   // onQueryChanged: (query) {

                  //   //     controller.searchEvents(query);
                  //   // },

                  //   onQueryChanged: (query) => controller.searchEvents(txt.text),
                  //   //onFieldSubmitted: (query) => onFieldSubmitted,
                  //   //onKeyEvent: (value) => controller.searchEvents(value.logicalKey.toString()),
                  //   //controller.searchEvents(valueSearch);

                  //   transition: CircularFloatingSearchBarTransition(),
                  //   backdropColor: Colors.black.withOpacity(0.1),
                  //   // actions: [
                  //   //   FloatingSearchBarAction(
                  //   //     showIfOpened: false,
                  //   //     child: GestureDetector(
                  //   //       //onTap: () => controller.searchEvents(valueSearch),
                  //   //       child: Row(
                  //   //         children: [
                  //   //           Container(
                  //   //             height: 34,
                  //   //             width: 1.3,
                  //   //             color: Colors.grey.shade300,
                  //   //           ),
                  //   //           Container(
                  //   //             margin: const EdgeInsets.only(
                  //   //                 left: 8, right: 10),
                  //   //             child: Icon(Icons.apartment_rounded,
                  //   //                 color: Colors.black45),
                  //   //           ),
                  //   //           // Text(
                  //   //           //   Formatter.shorten(ev, 10),
                  //   //           //   style: TextStyle(
                  //   //           //     color: Colors.black54,
                  //   //           //     fontSize: 15,
                  //   //           //     fontWeight: FontWeight.w400,
                  //   //           //   ),
                  //   //           // ),
                  //   //         ],
                  //   //       ),
                  //   //     ),
                  //   //   ),
                  //   //   FloatingSearchBarAction.searchToClear(
                  //   //     showIfClosed: false,
                  //   //   ),
                  //   // ],
                  //   builder: (context, transition) {
                  //     return Material(
                  //       color: Colors.white,
                  //       elevation: 4.0,
                  //       borderRadius: BorderRadius.circular(10),
                  //       child: Container(
                  //         child: Obx(() {
                  //           final listSearchEvent =
                  //               controller.listSearchEvents;
                  //           print("search====" +
                  //               listSearchEvent.toString());
                  //           if (controller.isSearching.value)
                  //             return Container(
                  //                 padding: const EdgeInsets.only(
                  //                     left: 20, top: 10, bottom: 10),
                  //                 child: Center(
                  //                     child:
                  //                         CircularProgressIndicator()));
                  //           if (listSearchEvent.isEmpty)
                  //             return Container(
                  //                 padding: const EdgeInsets.only(
                  //                     left: 20, top: 10, bottom: 20),
                  //                 child: Text("No events found!"));
                  //           int count = listSearchEvent.length > 5
                  //               ? 5
                  //               : listSearchEvent.length;
                  //           return ListView.separated(
                  //             shrinkWrap: true,
                  //             itemCount: count,
                  //             separatorBuilder: (context, index) =>
                  //                 Divider(
                  //               indent: 15,
                  //               endIndent: 15,
                  //               height: 0,
                  //               color: Colors.black38,
                  //             ),
                  //             itemBuilder: (context, index) {
                  //               final event = listSearchEvent[index];
                  //               //final img = event.imageUrl ?? '';
                  //               final title =
                  //                   Formatter.shorten(event.eventName);
                  //               String location = event.location ?? '';
                  //               return Container(
                  //                 height: 85,
                  //                 child: TextButton(
                  //                   onPressed: () {},
                  //                   child: ListTile(
                  //                     contentPadding:
                  //                         const EdgeInsets.all(0),
                  //                     // leading: CircleAvatar(
                  //                     //   radius: 25,
                  //                     //   backgroundImage: NetworkImage(img),
                  //                     // ),
                  //                     title: Text(title),
                  //                     subtitle: Text(location),
                  //                     trailing: OutlinedButton.icon(
                  //                       onPressed: () {
                  //                         controller
                  //                             .goToDetail(event.eventId);
                  //                       },
                  //                       icon: Icon(
                  //                         Icons.local_activity,
                  //                         size: 24,
                  //                       ),
                  //                       label: Text("Chi Tiết"),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           );
                  //         }),
                  //       ),
                  //     );
                  //   },
                  // ),
                  //   ),
                  // ],
                  //),
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
                          height: screenSize.height * 0.7,
                          margin: const EdgeInsets.only(left: 0),
                          child: ListView.builder(
                            addSemanticIndexes: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listEvent.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final event = listEvent[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.goToDetail(event.eventId);
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
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            //color: Color(0xFF0C9869),
                                            // height: 300,
                                            width: 400,
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
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color:
                                                              Color(0xFF0C9869),
                                                          size: 20,
                                                        ),
                                                        Expanded(
                                                            child: Container(
                                                          child: Text(
                                                            event.location
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 10,
                                                            textWidthBasis:
                                                                TextWidthBasis
                                                                    .parent,
                                                          ),
                                                        )),
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
