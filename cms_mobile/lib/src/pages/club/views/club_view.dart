import 'dart:ui';
import 'package:cms_mobile/src/pages/club/controllers/club_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/util/utils.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:cms_mobile/src/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class ClubPage extends GetView<ClubController> {
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
          'Câu lạc bộ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              // fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  Container(
                    //margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        Obx(() {
                          var listClub = controller.listClubs;
                          return Container(
                            height: screenSize.height,
                            margin: const EdgeInsets.only(left: 0, top: 80),
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                height: 5,
                                thickness: 0.1,
                                color: Colors.white,
                                indent: 5,
                                endIndent: 12,
                              ),
                              addSemanticIndexes: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listClub.length,
                              itemBuilder: (BuildContext ctx, index) {
                                final club = listClub[index];
                                return GestureDetector(
                                  onTap: () {
                                    controller.goToDetail(club.clubId);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      // top: 5,
                                      left: 10,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    padding: const EdgeInsets.only(
                                      //top: 10,
                                      left: 10,
                                      right: 5,
                                      bottom: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0C9869).withOpacity(0.3),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          // margin: MainAxisAlignment.center,
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                club.logo.toString() == 'null' ?
                                                'https://library.kissclipart.com/20180915/buw/kissclipart-multiple-user-icon-clipart-computer-icons-user-702f9ec9b0451114.jpg'
                                                : club.logo.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //color: Color(0xFF0C9869),
                                          height: 80,
                                          width: 300,
                                          child: ListTile(
                                            title: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, top: 5),
                                              child: Text(
                                                Formatter.shorten(
                                                    club.clubName),
                                                //'Đổi pin lấy sách cũ'
                                              ),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 0, top: 5),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .bookmark_border,
                                                            color: Color(
                                                                0xFF0C9869),
                                                            size: 20,
                                                          ),
                                                          Text(
                                                            'Loại câu lạc bộ: ' +
                                                                club.type
                                                                    .toString(),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF0C9869),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        height: 5,
                                                        thickness: 0.1,
                                                        color: Colors.white,
                                                        indent: 5,
                                                        endIndent: 12,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .check_circle_outline_outlined,
                                                            color: Color(
                                                                0xFF0C9869),
                                                            size: 20,
                                                          ),
                                                          Text(
                                                            'Trạng thái: ' +
                                                                Formatter.shorten(club.status
                                                                    ),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF0C9869),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 0, top: 5),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // ],
                                    // ),
                                    //   ],
                                    // ),
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: ClubSearchBar(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}
