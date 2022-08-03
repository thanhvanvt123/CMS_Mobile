import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:cms_mobile/src/pages/notification/controllers/notification_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/custom_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NotificationPage extends GetView<NotificationController> {
  final SharedStates sharedData = Get.find();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        // foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        centerTitle: true,
        title: Text(
          'Thông báo',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              // fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     backgroundColor: Color(0xFF0C9869).withOpacity(0.7),
      //     onPressed: () {
      //       controller.checkNoti();
      //       BadgeAnimationType.fade;
      //       // Alert(
      //       //   context: context,
      //       //   type: AlertType.warning,
      //       //   title: "Thông báo mới",
      //       //   desc: "Thông báo chưa đọc...",
      //       //   // content: "",
      //       //   buttons: [
      //       //     DialogButton(
      //       //       child: Text(
      //       //         "Ok",
      //       //         style: TextStyle(color: Colors.white, fontSize: 18),
      //       //       ),
      //       //       onPressed: () => Navigator.pop(context),
      //       //       color: Color.fromRGBO(0, 179, 134, 1.0),
      //       //     ),
      //       //   ],

      //       // ).show();
      //     },
      //     label: Badge(
      //       // padding: EdgeInsets.all(6),
      //       // badgeColor: Colors.white,          
      //       badgeContent: Text(             
      //         sharedData.count.toString(),
      //         style: TextStyle(fontSize: 10, color: Colors.white),
      //       ),
      //       child: Icon(FontAwesomeIcons.bell),
      //     )),
      body: Container(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 10),
        child: Column(
          children: [
            Obx(() {
              var listNoti = controller.listNoti;
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
                  itemCount: listNoti.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final noti = listNoti[index];
                    if (noti.isRead == false) {
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
                                  noti.avatarUrl.toString() == 'null'
                                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqN0tXLehHgPnrz8SKXMhPLU5Q7Dozwg04xwxx0kaGOrrSxU5R6qo-wv374BBgXI32p20&usqp=CAU"
                                      : noti.avatarUrl.toString(),
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
                                  child: Text(
                                    //'Bạn có một event sắp kết thúc!',
                                    noti.content.toString(),
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      //'24/06/2020',
                                      Formatter.date(noti.createDate),
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        controller.readNoti(noti.notificationId);
                                        if (noti.eventId != null) {
                                          controller
                                              .goToEventDetail(noti.eventId);
                                          noti.isRead == true;
                                        } else {
                                          controller
                                              .goToReportDetail(noti.reportId);
                                          
                                        }
                                      },
                                      icon: Icon(Icons.info),
                                      label: Text('Xem chi tiết', style: TextStyle(fontWeight: FontWeight.w900),),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
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
                                  noti.avatarUrl.toString() == 'null'
                                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqN0tXLehHgPnrz8SKXMhPLU5Q7Dozwg04xwxx0kaGOrrSxU5R6qo-wv374BBgXI32p20&usqp=CAU"
                                      : noti.avatarUrl.toString(),
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
                                  child: Text(
                                    //'Bạn có một event sắp kết thúc!',
                                    noti.content.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      //'24/06/2020',
                                      Formatter.date(noti.createDate),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {
                                        controller.readNoti(noti.notificationId);
                                        if (noti.eventId != null) {
                                          controller
                                              .goToEventDetail(noti.eventId);
                                          
                                        } else {
                                          controller
                                              .goToReportDetail(noti.reportId);
                                        }
                                      },
                                      icon: Icon(Icons.info),
                                      label: Text('Xem chi tiết'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}
