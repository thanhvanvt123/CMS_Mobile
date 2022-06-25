import 'dart:ui';
import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final SharedStates sharedStates = Get.find();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xff114B5F),
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
      body: Text('hello : ' + sharedStates.account!.role.toString()),
      
      // body: Obx(() {
      //   final events = controller.listEvents;
      //   if (events.isEmpty) {
      //     return Center(
      //       child: LoadingBouncingLine.circle(
      //         borderColor: Colors.cyan,
      //         borderSize: 3.0,
      //         size: 30.0,
      //         backgroundColor: Colors.pink,
      //         duration: Duration(milliseconds: 500),
      //       ),
      //     );
      //   } else {
      //     return SingleChildScrollView(
      //       child: Stack(
      //         children: [
      //           Container(
      //             margin: EdgeInsets.only(top: 25),
      //             color: Colors.green.shade600,
      //             width: screenSize.width,
      //             height: screenSize.height * 0.2,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                   width: screenSize.width * 0.85,
      //                   child: FloatingSearchBar(
      //                     hint: 'Tìm kiếm sự kiện...',
      //                     scrollPadding: const EdgeInsets.only(bottom: 56),
      //                     transitionDuration: const Duration(milliseconds: 800),
      //                     transitionCurve: Curves.easeInOut,
      //                     physics: const BouncingScrollPhysics(),
      //                     openAxisAlignment: 0.0,
      //                     debounceDelay: const Duration(milliseconds: 500),
      //                     onQueryChanged: (valueSearch) {
      //                       // ĐANG BỊ LỖI UI HMMMM, MONG MUỐN CHUYỂN THÀNH STACK
      //                       controller.searchEvents(events, valueSearch);
      //                     },
      //                     transition: CircularFloatingSearchBarTransition(),
      //                     backdropColor: Colors.black.withOpacity(0.1),
      //                     automaticallyImplyBackButton: false,
      //                     builder: (context, transition) {
      //                       return Material(
      //                         color: Colors.white,
      //                         elevation: 4.0,
      //                         borderRadius: BorderRadius.circular(10),
      //                         child: Container(
      //                           child: Obx(() {
      //                             final listSearchEvent =
      //                                 controller.listSearchEvents;
      //                             if (controller.isSearching.value)
      //                               return Container(
      //                                   padding: const EdgeInsets.only(
      //                                       left: 20, top: 10, bottom: 10),
      //                                   child: Center(
      //                                       child:
      //                                           CircularProgressIndicator()));
      //                             if (listSearchEvent.isEmpty) {
      //                               return Container(
      //                                   padding: const EdgeInsets.only(
      //                                       left: 20, top: 10, bottom: 20),
      //                                   child: Text("No events found!"));
      //                             } else {
      //                               int count = listSearchEvent.length > 5
      //                                   ? 5
      //                                   : listSearchEvent.length;
      //                               return ListView.separated(
      //                                 shrinkWrap: true,
      //                                 itemCount: count,
      //                                 separatorBuilder: (context, index) =>
      //                                     Divider(
      //                                   indent: 15,
      //                                   endIndent: 15,
      //                                   height: 0,
      //                                   color: Colors.black38,
      //                                 ),
      //                                 itemBuilder: (context, index) {
      //                                   final event = listSearchEvent[index];
      //                                   final img = event.imageUrl ?? '';
      //                                   final title =
      //                                       Formatter.shorten(event.eventName);
      //                                   String location = event.location ?? '';
      //                                   return Container(
      //                                     height: 85,
      //                                     child: TextButton(
      //                                       onPressed: () {},
      //                                       child: ListTile(
      //                                         contentPadding:
      //                                             const EdgeInsets.all(0),
      //                                         leading: CircleAvatar(
      //                                           radius: 25,
      //                                           backgroundImage:
      //                                               NetworkImage(img),
      //                                         ),
      //                                         title: Text(title),
      //                                         subtitle: Text(location),
      //                                         trailing: OutlinedButton.icon(
      //                                           onPressed: () {
      //                                             // controller.goToEventDetails(coupon);
      //                                           },
      //                                           icon: Icon(
      //                                             Icons.local_activity,
      //                                             size: 24,
      //                                           ),
      //                                           label: Text("Chi Tiết"),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   );
      //                                 },
      //                               );
      //                             }
      //                           }),
      //                         ),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //                 IconButton(
      //                   onPressed: () {
      //                     if (_sharedStates.account == null) {
      //                       Get.toNamed(Routes.login);
      //                     } else {
      //                       Get.toNamed(Routes.profile);
      //                     }
      //                   },
      //                   icon: CircleAvatar(
      //                     radius: 35,
      //                     backgroundColor: Colors.grey[100],
      //                     child: Icon(
      //                       Icons.person,
      //                       size: 30,
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(top: screenSize.height * 0.13),
      //             width: screenSize.width,
      //             height: screenSize.height * 0.4,
      //             child: Obx(() {
      //               if (!controller.showSlider.value) {
      //                 return Container();
      //               }
      //               final images = controller.listEvents
      //                   .map((element) => element.imageUrl!)
      //                   .toList();
      //               if (images.isEmpty)
      //                 return Container(
      //                   color: Colors.grey.shade200,
      //                 );
      //               return CarouselSlider(
      //                 options: CarouselOptions(
      //                   aspectRatio: 2.0,
      //                   enlargeCenterPage: true,
      //                   enableInfiniteScroll: false,
      //                   initialPage: 2,
      //                   autoPlay: true,
      //                 ),
      //                 items: images.map((i) {
      //                   return Builder(
      //                     builder: (BuildContext context) {
      //                       return Container(
      //                         width: screenSize.width * 1.2,
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(12),
      //                           boxShadow: [
      //                             BoxShadow(
      //                               color: Colors.grey.withOpacity(0.5),
      //                               spreadRadius: 1,
      //                               blurRadius: 7,
      //                               offset: Offset(
      //                                   0, 3), // changes position of shadow
      //                             ),
      //                           ],
      //                           image: DecorationImage(
      //                             alignment: Alignment.topCenter,
      //                             image: NetworkImage(i),
      //                             fit: BoxFit.fitWidth,
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                   );
      //                 }).toList(),
      //               );
      //             }),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(top: screenSize.height * 0.53),
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               border: Border.all(color: Colors.grey.shade200),
      //             ),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Container(
      //                       padding: EdgeInsets.only(left: 10),
      //                       alignment: Alignment.centerLeft,
      //                       child: Text(
      //                         'Ticket nổi bật',
      //                         style: TextStyle(
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.w600,
      //                           color: Colors.black54,
      //                         ),
      //                       ),
      //                     ),
      //                     Container(
      //                       child: TextButton(
      //                         onPressed: () {},
      //                         child: Text(
      //                           'Xem thêm >>',
      //                           style: TextStyle(
      //                             fontSize: 14,
      //                             color: Colors.grey,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Container(
      //                   margin: const EdgeInsets.symmetric(vertical: 10),
      //                   child: Obx(() {
      //                     var listTicket = controller.listEvents;
      //                     int ticketCount = listTicket.length >= 6 ? 6 : 3;
      //                     return SingleChildScrollView(
      //                       child: Column(
      //                         children: [
      //                           Wrap(
      //                             spacing: 18,
      //                             children: List.generate(ticketCount, (index) {
      //                               final ticket = listTicket[index];
      //                               return GestureDetector(
      //                                 onTap: () {
      //                                   // controller.goToStoreDetails(store.id);
      //                                 },
      //                                 child: Column(
      //                                   children: [
      //                                     Container(
      //                                       margin: const EdgeInsets.only(
      //                                           right: 5, bottom: 10),
      //                                       padding: EdgeInsets.symmetric(
      //                                           horizontal: 6, vertical: 2),
      //                                       decoration: BoxDecoration(
      //                                         border: Border.all(
      //                                             color: Colors.black12),
      //                                         borderRadius:
      //                                             BorderRadius.circular(8),
      //                                       ),
      //                                       child: Column(
      //                                         children: [
      //                                           Container(
      //                                             width: 100,
      //                                             height: 100,
      //                                             child: Image.network(
      //                                               ticket.imageUrl ?? '',
      //                                               fit: BoxFit.cover,
      //                                             ),
      //                                           ),
      //                                           Container(
      //                                             margin:
      //                                                 EdgeInsets.only(top: 10),
      //                                             width: 100,
      //                                             height: 35,
      //                                             child: Text(
      //                                               ticket.eventName.toString(),
      //                                               textAlign: TextAlign.center,
      //                                               style: TextStyle(
      //                                                   fontWeight:
      //                                                       FontWeight.w700),
      //                                             ),
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               );
      //                             }),
      //                           ),
      //                         ],
      //                       ),
      //                     );
      //                   }),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(top: screenSize.height * 0.73),
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               border: Border.all(color: Colors.grey.shade200),
      //             ),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Container(
      //                       padding: EdgeInsets.only(left: 10),
      //                       alignment: Alignment.centerLeft,
      //                       child: Text(
      //                         'Sự kiện nổi bật',
      //                         style: TextStyle(
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.w600,
      //                           color: Colors.black54,
      //                         ),
      //                       ),
      //                     ),
      //                     Container(
      //                       child: TextButton(
      //                         onPressed: () {},
      //                         child: Text(
      //                           'Xem thêm >>',
      //                           style: TextStyle(
      //                             fontSize: 14,
      //                             color: Colors.grey,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Obx(() {
      //                   var listEvent = controller.listEvents;
      //                   return Container(
      //                     height: 290,
      //                     margin: const EdgeInsets.only(left: 5),
      //                     child: ListView.builder(
      //                       addSemanticIndexes: true,
      //                       shrinkWrap: true,
      //                       scrollDirection: Axis.horizontal,
      //                       itemCount: listEvent.length,
      //                       itemBuilder: (BuildContext ctx, index) {
      //                         final event = listEvent[index];
      //                         return GestureDetector(
      //                           onTap: () {
      //                             // controller.goToCouponDetails(coupon);
      //                           },
      //                           child: Container(
      //                             margin: const EdgeInsets.only(
      //                               right: 20,
      //                               bottom: 15,
      //                             ),
      //                             padding: const EdgeInsets.only(
      //                               top: 15,
      //                               left: 10,
      //                               right: 10,
      //                               bottom: 5,
      //                             ),
      //                             decoration: BoxDecoration(
      //                               border: Border.all(
      //                                 color: Colors.grey.shade300,
      //                               ),
      //                               borderRadius: BorderRadius.circular(8),
      //                             ),
      //                             child: Column(
      //                               children: [
      //                                 Container(
      //                                   height: 150,
      //                                   width: 280,
      //                                   margin:
      //                                       const EdgeInsets.only(bottom: 10),
      //                                   decoration: BoxDecoration(
      //                                     boxShadow: [
      //                                       BoxShadow(
      //                                         color:
      //                                             Colors.grey.withOpacity(0.5),
      //                                         spreadRadius: 1,
      //                                         blurRadius: 7,
      //                                         offset: Offset(0,
      //                                             3), // changes position of shadow
      //                                       ),
      //                                     ],
      //                                     image: DecorationImage(
      //                                       image: NetworkImage(
      //                                         event.imageUrl ?? '',
      //                                       ),
      //                                       fit: BoxFit.fitWidth,
      //                                       alignment: Alignment.topCenter,
      //                                     ),
      //                                     borderRadius:
      //                                         BorderRadius.circular(4),
      //                                   ),
      //                                 ),
      //                                 Column(
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: <Widget>[
      //                                     Container(
      //                                       width: 295,
      //                                       child: ListTile(
      //                                         title: Text(
      //                                           Formatter.shorten(
      //                                               event.eventName),
      //                                         ),
      //                                         subtitle: Column(
      //                                           crossAxisAlignment:
      //                                               CrossAxisAlignment.start,
      //                                           children: [
      //                                             Text('Địa chỉ: ' +
      //                                                 event.location
      //                                                     .toString()),
      //                                             Container(
      //                                               margin:
      //                                                   const EdgeInsets.only(
      //                                                       left: 50, top: 5),
      //                                               padding:
      //                                                   const EdgeInsets.all(5),
      //                                               decoration: BoxDecoration(
      //                                                 border: Border.all(
      //                                                   color: Colors.grey,
      //                                                   width: 1.2,
      //                                                 ),
      //                                                 borderRadius:
      //                                                     BorderRadius.circular(
      //                                                         4),
      //                                               ),
      //                                               child: Text(
      //                                                 "Thời gian: " +
      //                                                     Formatter.date(
      //                                                         event.timeOccur),
      //                                                 style: TextStyle(
      //                                                     color: Colors.red),
      //                                               ),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         );
      //                       },
      //                     ),
      //                   );
      //                 }),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   }
      // }),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}
