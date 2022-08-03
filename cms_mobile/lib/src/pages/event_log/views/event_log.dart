import 'dart:ui';
import 'package:cms_mobile/src/pages/club/controllers/club_controller.dart';
import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/util/utils.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:cms_mobile/src/widgets/custom_search_bar.dart';
import 'package:cms_mobile/src/widgets/description_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class EventLogPage extends GetView<EventDetailController> {
  final SharedStates sharedData = Get.find();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        centerTitle: true,
        title: Text(
          'Lịch sử chỉnh sửa',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              // fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 10),
        child: Column(
          children: [
            Obx(() {
              var listEventLog = controller.listEventLog;
              print("123" + listEventLog.toString());
              return Container(
                height: screenSize.height * 0.78,
                width: screenSize.width,
                margin: const EdgeInsets.only(left: 0, top: 5),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 30,
                    thickness: 0.5,
                    color: Colors.white,
                    indent: 10,
                    endIndent: 12,
                  ),
                  addSemanticIndexes: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listEventLog.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final log = listEventLog[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                //'https://raw.githubusercontent.com/thehienvnag/beauty-at-home-mobile/main/public/img/notification.PNG'),
                                log.avatarUrl.toString() == 'null'
                                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqN0tXLehHgPnrz8SKXMhPLU5Q7Dozwg04xwxx0kaGOrrSxU5R6qo-wv374BBgXI32p20&usqp=CAU"
                                    : log.avatarUrl.toString(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: screenSize.width * 0.5,
                                      child: Column(
                                        children: [
                                          Text(                                        
                                            Formatter.shorten(log.email),
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      //'24/06/2020',
                                      Formatter.date(log.createdAt),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 5,
                                color: Colors.white,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 5),
                                child: Row(
                                  children: [
                                     Expanded(
                                  // child: DescriptionTextWidget(text: log.content.toString()),
                                  child: Text(log.content.toString()),
                                ),
                                  ],
                                 
                                ),
                                
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
