import 'package:cms_mobile/src/pages/home/controllers/home_controller.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';


// class HomeSearchBar extends StatefulWidget {
//   @override
//   _HomeSearchBarState createState() => _HomeSearchBarState();
// }

class HomeSearchBar extends GetView<HomeController> {
  
  final String? search;
   const HomeSearchBar({
    Key? key,
    this.search,
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
                  child: Icon(Icons.apartment_rounded, color: Colors.black45),
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

// import 'dart:async';
// import 'dart:isolate';
// import 'package:cms_mobile/src/models/event.dart';
// import 'package:cms_mobile/src/pages/home/views/home_page.dart';
// import 'package:cms_mobile/src/services/api/event_service.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:ticket_box/src/common/themes.dart';
// import 'package:ticket_box/src/models/group.dart';
// import 'package:ticket_box/src/pages/home/views/event_list.dart';
// import 'package:ticket_box/src/services/api/group_service.dart';

// class HomeSearchBar extends StatefulWidget {
//   @override
//   _HomeSearchBarState createState() => _HomeSearchBarState();
// }

// class _HomeSearchBarState extends State<HomeSearchBar> {
//   final searchController = TextEditingController();
//   bool isSearchAll = true;
//   IEventService eventService = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return FutureBuilder<List<Event>?>(
//         future: eventService.getEvents(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 5),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.only(bottom: 25),
//                         height: size.height * 0.068,
//                         child: TextFormField(
//                           enableSuggestions: true,
//                           controller: searchController,
//                           textInputAction: TextInputAction.done,
//                             keyboardType: TextInputType.text,
//                           onFieldSubmitted: (text) {
//                             searchController.clear();
//                             streamController.add(text);
//                           },
//                           style:
//                               TextStyle(//color: secondary_color, 
//                               fontSize: 18),
//                           textAlign: TextAlign.left,
//                           decoration: InputDecoration(
//                             hintStyle:
//                                 TextStyle(//color: secondary_color, 
//                                 fontSize: 18),
//                             //hoverColor: secondary_color,
//                             contentPadding: EdgeInsets.only(top: 5),
//                             hintText: "Search event",
//                             prefixIcon: Icon(
//                               Icons.search,
//                               //color: secondary_color,
//                             ),
//                             border: UnderlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     PopupMenuButton(
//                         padding: EdgeInsets.only(right: 10),
//                         color: Color(0xF030444E),
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20))),
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 //color: accent_green,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(7))),
//                             padding: EdgeInsets.all(7),
//                             child: Icon(
//                               FontAwesomeIcons.slidersH,
//                               size: 25,
//                               color: Colors.white,
//                             )),
//                         itemBuilder: (context) => [
//                               for (var i = 0; i < snapshot.data!.length; i++)
//                                 PopupMenuItem(
//                                     child: Row(children: [
//                                       // CircleAvatar(
//                                       //   backgroundImage: NetworkImage(snapshot
//                                       //       .data![i].groupImageUrl
//                                       //       .toString()),
//                                       // ),
//                                       //Expanded(child: SizedBox()),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         snapshot.data![i].eventName.toString(),
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ]),
//                                     value: snapshot.data![i].eventId,
//                                     onTap: () {
//                                       setState(() {
//                                         isSearchAll = false;
//                                       });
//                                       streamController.add(
//                                           snapshot.data![i].description.toString());
//                                     }),
//                               PopupMenuItem(
//                                   child: Row(children: [
//                                     Checkbox(
                                      
//                                       value: isSearchAll,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           isSearchAll = value!;
//                                         });
//                                         streamController.add('');
//                                       },
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(5))),
                                      
//                                     ),
//                                     //Expanded(child: SizedBox()),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text(
//                                       'All club',
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ]),
//                                   onTap: () {
//                                     setState(() {
//                                       isSearchAll = true;
//                                     });
//                                     streamController.add('');
//                                   })
//                             ]),
//                     SizedBox(
//                       width: 15,
//                     )
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Center(
//               child: LinearProgressIndicator(),
//             );
//           }
//         });
//   }
// }
