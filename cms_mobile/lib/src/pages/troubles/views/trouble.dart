import 'dart:ui';
import 'package:cms_mobile/src/pages/club/controllers/club_controller.dart';
import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/util/utils.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:cms_mobile/src/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class TroublePage extends GetView<EventDetailController> {
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
          'Sự cố',
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
              var listTrouble = controller.listTrouble;
              print("123" + listTrouble.toString());
              return Container(
                height: screenSize.height * 0.78,
                width: screenSize.width,
                margin: const EdgeInsets.only(left: 0, top: 5),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 30,
                    thickness: 0.5,
                    color: Colors.grey,
                    indent: 10,
                    endIndent: 12,
                  ),
                  addSemanticIndexes: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listTrouble.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final trouble = listTrouble[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: screenSize.width * 0.25,
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 0,
                                    // right: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // Formatter.date(event.startDate),
                                        'Ngày xảy ra: '
                                      ),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text('Nội dung: '),
                                    ],
                                  ),
                                ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 0,
                                    // right: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Formatter.date(trouble.datetime),
                                        // 'Ngày xảy ra: '
                                      ),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        width: screenSize.width * 0.6,
                                        child: Expanded(child: Text(trouble.troubleContent.toString())),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                          ],
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
