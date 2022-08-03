import 'dart:ui';
import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/pages/introduction/controllers/introduction_controller.dart';
import 'package:cms_mobile/src/pages/report/controllers/report_list_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPage extends GetView<ReportController> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C9869).withOpacity(0.5),
        foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        // foregroundColor: Color(0xFF0C9869).withOpacity(0.05),
        centerTitle: true,
        title: Text(
          'Báo cáo',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff114B5F),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),

      body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: controller.scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                     margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          Obx(() {
                            var listReport = controller.listReport;
                            if (listReport.isEmpty) {
                              return Center(
                                child:
                                    Text('Chưa có báo cáo nào!!!'),
                              );
                            } else {  
                            return Container(
                              height: screenSize.height * 0.8,
                              margin: const EdgeInsets.only(left: 0, top: 70),
                              child: ListView.builder(
                                addSemanticIndexes: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listReport.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  final report = listReport[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // print("report");
                                      controller.goToDetail(report.reportId);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        //  top: 5,
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 0,
                                        right: 5,
                                        bottom: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color(0xFF0C9869).withOpacity(0.3),
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
                                                //height: 300,
                                                width: 400,
                                                child: ListTile(
                                                  title: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, top: 5),
                                                    child: Text(
                                                      Formatter.shorten(
                                                          report.reportName),
                                                      //'Đổi pin lấy sách cũ'
                                                    ),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            'Loại báo cáo: ' +
                                                                Formatter.shorten(report.reportType!.reportType
                                                                    ),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF0C9869),
                                                            ),
                                                          ),
                                                        ],
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
                                                                Formatter.shorten(report.status
                                                                    ),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF0C9869),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .calendar_today_outlined,
                                                              color: Color(
                                                                  0xFF0C9869),
                                                              size: 18,
                                                            ),
                                                            Text('Ngày tạo: ' +
                                                              Formatter.date(
                                                                  report
                                                                      .createdAt),
                                                              //'12/2/2023'
                                                              //textAlign: TextAlign.right,
                                                            ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 0, top: 5),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.person,
                                                              color: Color(
                                                                  0xFF0C9869),
                                                              size: 20,
                                                            ),
                                                            Text('Người tạo: ' + report.created!
                                                                    .email
                                                                    .toString()
                                                                //'Le Thanh Van'
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
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: const ReportSearchBar(),
              ),
            ],
          ),
        ),
    );
  }
}
