import 'package:cms_mobile/src/pages/club_detail/controllers/club_detail_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/animate_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ipsb_visitor_app/src/common/constants.dart';
// import 'package:ipsb_visitor_app/src/utils/utils.dart';
// import 'package:ipsb_visitor_app/src/widgets/animate_wrapper.dart';

class ClubDetailPage extends GetView<ClubDetailController> {
  @override
  Widget build(BuildContext context) {
    SharedStates states = Get.find();
    //final event = states.event;
    //print("1234 " + event.toString());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black45,
          title: Container(
            margin: EdgeInsets.only(left: 35, right: 40),
            child: Text(
              'Thông tin câu lạc bộ',
              style: TextStyle(color: Color(0xFF114B5F)),
            ),
          ),
          // Text('Thông tin sự kiện', style: TextStyle(color: Colors.black45),),
        ),
        // children: [
        body: SingleChildScrollView(
          controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: size.height,
                width: size.width,
                //margin: const EdgeInsets.only(top: 5),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.white),
                // ),
                child: Column(
                  children: [
                    Obx(() {
                      var clubs = controller.clubDetail.value;
                      return Column(
                        children: [
                          // Container(
                          //   margin: const EdgeInsets.only(left: 8, top: 20),
                          //   padding: const EdgeInsets.only(
                          //     top: 10,
                          //     left: 5,
                          //     right: 10,
                          //     bottom: 10,
                          //   ),
                          //   child: Row(
                          //     // mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Expanded(
                          //         child: Text(Formatter.shorten(clubs.clubName),
                          //             style: TextStyle(
                          //               fontSize: 20,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //             textAlign: TextAlign.center),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Container(
                            height: size.height * 0.2,
                            margin: EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              children: [
                                Divider(
                                  height: 3,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: size.width,
                                  margin: EdgeInsets.only(left: 10, top: 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            'Tên câu lạc bộ: ' +
                                                clubs.clubName.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          // left: 5,
                                          right: 10,
                                          bottom: 10,
                                        ),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Tên viết tắt: "),
                                            Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            Text("Slogan: "),
                                            Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            Text("Loại câu lạc bộ: "),
                                            Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            Text("Ngày thành lập: "),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 5,
                                          right: 10,
                                          bottom: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(Formatter.shorten(
                                                clubs.shortName)),
                                            Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              (clubs.slogan.toString() ==
                                                      'null')
                                                  ? 'chưa có'
                                                  : Formatter.shorten(
                                                      clubs.slogan),
                                            ),
                                            Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            Text(Formatter.shorten(clubs.type)),
                                            Divider(
                                              height: 3,
                                              color: Colors.white,
                                            ),
                                            Text(
                                                clubs.foundingDate.toString() ==
                                                        'null'
                                                    ? 'chưa cập nhật'
                                                    : Formatter.date(
                                                        clubs.foundingDate)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // padding:
                            //     EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                          ),
                          Container(
                            height: size.height * 0.7,
                            margin: EdgeInsets.only(left: 10),
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   border: Border.all(color: Colors.white10),
                            // ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  height: 15,
                                  color: Colors.white,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Thành viên',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.white,
                                ),
                                Container(
                                  //margin: const EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white70),
                                  ),
                                  child: Column(
                                    children: [
                                      Obx(() {
                                        var listAcc = controller.listAcc;
                                        return Container(
                                          //height: screenSize.height,
                                          // margin: const EdgeInsets.only(left: 0, top: 80),
                                          child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) => Divider(
                                              height: 5,
                                              thickness: 0.1,
                                              color: Colors.white,
                                              indent: 5,
                                              endIndent: 12,
                                            ),
                                            addSemanticIndexes: true,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listAcc.length,
                                            itemBuilder:
                                                (BuildContext ctx, index) {
                                              final acc = listAcc[index];
                                              // return GestureDetector(
                                              // onTap: () {
                                              //   controller.goToDetail(club.clubId);
                                              // },
                                              return Container(
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

                                                child: Row(
                                                  children: [
                                                    Container(
                                                      //  margin: MainAxisAlignment.start,
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            acc.account!.avatarUrl
                                                                        .toString() ==
                                                                    'null'
                                                                ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqN0tXLehHgPnrz8SKXMhPLU5Q7Dozwg04xwxx0kaGOrrSxU5R6qo-wv374BBgXI32p20&usqp=CAU"
                                                                : acc.account!
                                                                    .avatarUrl
                                                                    .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            // 'Vũ Hoàng Phát',
                                                            Formatter.shorten(
                                                                acc.account!
                                                                    .fullName),
                                                            style: TextStyle(
                                                              // fontFamily:
                                                              //     'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          Divider(
                                                              height: 3,
                                                              color:
                                                                  Colors.white),
                                                          Text(
                                                            // 'phatvhse140209@fpt.edu.vn',
                                                            Formatter.shorten(
                                                                acc.account!
                                                                    .email),
                                                            style: TextStyle(
                                                              // fontFamily:
                                                              //     'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                // ],
                                                // ),
                                                //   ],
                                                // ),
                                              );
                                              // );
                                            },
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0, 15, 0, 0),
                                //   child: Container(
                                //     width: 375,
                                //     height: 460,
                                //     decoration: BoxDecoration(
                                //       color: FlutterFlowTheme.of(context)
                                //           .secondaryBackground,
                                //     ),
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.max,
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       children: [
                                //         Padding(
                                //           padding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   20, 0, 15, 0),
                                //           child: Row(
                                //             mainAxisSize: MainAxisSize.max,
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.start,
                                //             children: [
                                //               Container(
                                //                 width: 40,
                                //                 height: 40,
                                //                 decoration: BoxDecoration(
                                //                   color: FlutterFlowTheme.of(
                                //                           context)
                                //                       .alternate,
                                //                   shape: BoxShape.circle,
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: EdgeInsetsDirectional
                                //                     .fromSTEB(20, 0, 0, 0),
                                //                 child: Column(
                                //                   mainAxisSize:
                                //                       MainAxisSize.max,
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     Text(
                                //                       'Vũ Hoàng Phát',
                                //                       style:
                                //                           FlutterFlowTheme.of(
                                //                                   context)
                                //                               .bodyText1
                                //                               .override(
                                //                                 fontFamily:
                                //                                     'Roboto',
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .normal,
                                //                               ),
                                //                     ),
                                //                     Text(
                                //                       'phatvhse140209@fpt.edu.vn',
                                //                       style:
                                //                           FlutterFlowTheme.of(
                                //                                   context)
                                //                               .bodyText1
                                //                               .override(
                                //                                 fontFamily:
                                //                                     'Roboto',
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .normal,
                                //                               ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ],
      ),
    );
    // );
  }
}
