import 'dart:io';
import 'dart:ui';
import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/pages/introduction/controllers/introduction_controller.dart';
import 'package:cms_mobile/src/pages/report_detail/controllers/report_controller.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:cms_mobile/src/widgets/source_toggle_buttons.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ReportDetailPage extends GetView<ReportDetailController> {
  bool isDownloading = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // children: [
        body: SingleChildScrollView(
          controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          // child: Column(
          //   children: [
          // Container(
          //   color: Colors.white,
          //   height: size.height,
          //   width: size.width,
          //margin: const EdgeInsets.only(top: 5),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   border: Border.all(color: Colors.white),
          // ),
          child: Column(
            children: [
              Obx(() {
                var reportList = controller.listReport;
                return Column(
                  children: [
                    ListView.builder(
                      addSemanticIndexes: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: reportList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final report = reportList[index];

                        //  return Column(
                        //   children: [
                        // return Container(
                        //   height: size.height,
                        //   width: size.width,
                        //   margin: const EdgeInsets.only(
                        //       left: 14, top: 5),
                        //   // padding: const EdgeInsets.only(
                        //   //   top: 10,
                        //   //   left: 5,
                        //   //   right: 10,
                        //   //   bottom: 10,
                        //   // ),
                        //   child: Row(
                        //     // mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        // children: [
                        return Container(
                          height: size.height,
                          margin: const EdgeInsets.only(left: 8, top: 20),
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 5,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          Formatter.shorten(report.reportName),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.white,
                                ),
                                // Row(
                                //   mainAxisSize: MainAxisSize.max,
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Text(
                                //       'Thông tin báo cáo',
                                //       style: TextStyle(
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Divider(
                                  height: 10,
                                  color: Colors.white,
                                ),
                                Container(
                                  height: size.height * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        height: 10,
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Thông tin báo cáo',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
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
                                                  // Text("Mô tả: "),
                                                  // Divider(
                                                  //   height: 3,
                                                  //   color: Colors.white,
                                                  // ),
                                                  Text("Loại báo cáo: "),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text("Trạng thái: "),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text("Người tạo: "),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text("Người sửa: "),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text("Câu lạc bộ: "),
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
                                                  Text(Formatter.shorten(report
                                                      .reportType!.reportType)),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text(Formatter.shorten(
                                                      report.status)),
                                                  // Text(
                                                  //   (clubs.slogan.toString() ==
                                                  //           'null')
                                                  //       ? 'chưa có'
                                                  //       : Formatter.shorten(
                                                  //           clubs.slogan),
                                                  // ),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text(Formatter.shorten(
                                                      report.created!.email)),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text(Formatter.shorten(
                                                      report.modified!.email)),
                                                  Divider(
                                                    height: 3,
                                                    color: Colors.white,
                                                  ),
                                                  Text(Formatter.shorten(
                                                      report.club!.clubName)),
                                                  // Text(clubs.foundingDate
                                                  //             .toString() ==
                                                  //         'null'
                                                  //     ? 'chưa cập nhật'
                                                  //     : Formatter.date(
                                                  //         clubs.foundingDate)),
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
                                  // margin: const EdgeInsets.only(top: 5),
                                  height: size.height * 0.4,
                                  // decoration: BoxDecoration(
                                  //   color: Colors.white,
                                  //   border: Border.all(color: Colors.white70),
                                  // ),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: [
                                      // SourceToggleButtons(
                                      //   onChanged: (index) =>
                                      //       isDownloading = index == 0,
                                      // ),
                                      SingleChildScrollView(
                                        controller: controller.scrollController,
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              //height: size.height * 0.6,
                                              // width: size.width,
                                              //margin: const EdgeInsets.only(top: 5),
                                              // decoration: BoxDecoration(
                                              //   color: Colors.white,
                                              //   border: Border.all(color: Colors.white),
                                              // ),
                                              child: Column(
                                                children: [
                                                  Obx(() {
                                                    var listDocs = controller.listDoc;
                                                    return Container(
                                                      //height: screenSize.height,
                                                      // margin: const EdgeInsets.only(left: 0, top: 80),
                                                      child: ListView.builder(
                                                        // separatorBuilder:
                                                        //     (context, index) =>
                                                        //         Divider(
                                                        //   height: 5,
                                                        //   thickness: 0.1,
                                                        //   color: Colors.white,
                                                        //   indent: 5,
                                                        //   endIndent: 12,
                                                        // ),
                                                        addSemanticIndexes:
                                                            true,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listDocs.length,
                                                        itemBuilder:
                                                            (BuildContext ctx,
                                                                index) {
                                                          final doc =
                                                              listDocs[index];
                                                          return Card(
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all(Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.2)),
                                                                shape:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                ),
                                                                fixedSize:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  Size.fromHeight(
                                                                      80),
                                                                ),
                                                              ),
                                                              //clipBehavior: Clip.hardEdge,
                                                              onPressed: () {
                                                                openFile(
                                                                  url: doc.file
                                                                              .toString() ==
                                                                          'null'
                                                                      ? 'Chưa có tệp nào!'
                                                                      : doc.file
                                                                          .toString(),
                                                                  // opt. fileName: file.pdf
                                                                );
                                                                //showViewer(_document);
                                                                //OpenFile.open("/sdcard/example.pptx");
                                                              },
                                                              child: ListTile(
                                                                leading: Icon(Icons
                                                                    .description_outlined),
                                                                title: Text(doc
                                                                    .file!
                                                                    .substring(doc
                                                                            .file!
                                                                            .lastIndexOf('/') +
                                                                        1)
                                                                    .toString()),
                                                                // subtitle: Text(
                                                                //     Formatter
                                                                //         .date(doc
                                                                //             .createDate)),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   border: Border.all(color: Colors.white10),
                          // ),
                        );
                        //   ],
                        // ),
                        // );
                        //   ],
                        // );
                      },
                    ),
                  ],
                );
                //     ),
                //   ],
                // );
              }),
            ],
          ),
          // ),
          //   ],
          // ),
        ),

        // ],
      ),
    );
  }


  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await (isDownloading ? downloadFile(url, name) : pickFile());
    if (file == null) return;

    print('Path: ${file.path}');
    print('Length: ${file.lengthSync()}');

    OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;

    return File(result.files.first.path!);
  }

  /// Download file into private folder not visible to user
  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      print('---------------------');
      return null;
    }
  }
}






                    
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
