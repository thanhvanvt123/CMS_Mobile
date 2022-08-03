import 'dart:io';
import 'dart:ui';
import 'package:cached_video_preview/cached_video_preview.dart';
import 'package:cms_mobile/src/pages/event_detail/controllers/event_detail_controller.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:cms_mobile/src/util/formatters.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:ipsb_visitor_app/src/common/constants.dart';
// import 'package:ipsb_visitor_app/src/utils/utils.dart';
// import 'package:ipsb_visitor_app/src/widgets/animate_wrapper.dart';

class EventDetailPage extends GetView<EventDetailController> {
  bool isDownloading = true;
  ScrollController tcontroller = ScrollController();
  ScrollPhysics t = ScrollPhysics();
  @override
  Widget build(BuildContext context) {
    SharedStates states = Get.find();
    //final event = states.event;
    //print("1234 " + event.toString());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      // child: SingleChildScrollView(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black45,
            title: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Text(
                'Thông tin sự kiện',
                style: TextStyle(color: Color(0xFF114B5F)),
              ),
            ),
            // Text('Thông tin sự kiện', style: TextStyle(color: Colors.black45),),
            actions: <Widget>[
              PopupMenuButton<String>(
                // color: Colors.black,
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {
                    'Phần thưởng',
                    'Chi phí',
                    'Phụ kiện',
                    'Lịch sử sự kiện',
                    'Sự cố'
                  }.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Obx(() {
                var event = controller.dataEvent.value;
                // return SingleChildScrollView(
                // scrollDirection: Axis.vertical,
                // physics: t,
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 20),
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        children: [
                          Divider(
                            // indent: 50,
                            height: 10,
                            color: Colors.white,
                          ),
                          Container(
                            width: size.width,
                            margin: EdgeInsets.only(left: 15, top: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      'Tên sự kiện: ' +
                                          event.eventName.toString(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Expanded(child: Container()),
                                Container(
                                  width: size.width * 0.3,
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 5,
                                    right: 20,
                                    // bottom: 10,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text("Tên sự kiện: "),
                                      // Divider(
                                      //   height: 3,
                                      //   color: Colors.white,
                                      // ),
                                      Text("Ngày bắt đầu: "),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text("Ngày kết thúc: "),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text("Người tạo: "),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text("Trạng thái: "),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text(" Lí do: "),
                                    ],
                                  ),
                                ),
                                Container(
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
                                        Formatter.date(event.startDate),
                                      ),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text(Formatter.date(event.endDate)),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text(Formatter.shorten(event.email)),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text(Formatter.shorten(event.status)),
                                      Divider(
                                        height: 3,
                                        color: Colors.white,
                                      ),
                                      Text(event.reason.toString() == 'null'
                                          ? 'không có'
                                          : Formatter.shorten(event.reason)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //club
                          Container(
                            margin: EdgeInsets.only(left: 17),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width * 0.23,
                                  child: Text("Câu lạc bộ: "),
                                ),
                                Obx(() {
                                  var listClub = controller.listClub;
                                  return Container(
                                    width: size.width * 0.6,
                                    // height: 60,
                                    // height: screenSize.height,
                                    // margin: const EdgeInsets.only(
                                    //     left: 0, top: 80),
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        height: 3,
                                        thickness: 0.1,
                                        color: Colors.white,
                                        indent: 5,
                                        endIndent: 10,
                                      ),
                                      addSemanticIndexes: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listClub.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        final club = listClub[index];
                                        return Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              VerticalDivider(width: 20),
                                              Text(
                                                Formatter.shorten(
                                                    club.club!.clubName),
                                                //'Đổi pin lấy sách cũ'
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          Divider(),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                'Mô tả: ' + event.description.toString(),
                                //'Đại học FPT',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                maxLines: 10,
                                textWidthBasis: TextWidthBasis.parent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                //margin: const EdgeInsets.only(bottom: 5, right: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
                  ),
                ),
                child: TabBar(
                  //automaticIndicatorColorAdjustment: true,
                  indicatorColor: Colors.green.shade100,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: TextStyle(overflow: TextOverflow.clip),
                  // indicator: BoxDecoration(
                  //   border: Border.all(color: Colors.white),
                  //   borderRadius: BorderRadius.circular(10),
                  //   color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.shade200,
                  //       blurRadius: 4.0,
                  //       offset: Offset(0, 0),
                  //     ),
                  //   ],
                  // ),
                  //indicatorWeight: 10,
                  tabs: [
                    Container(
                      width: 100,
                      child: Tab(
                        text: "Tệp",
                        // icon: Icon(
                        //   Icons.file_copy_outlined,
                        //   color: Colors.grey,
                        // ),
                        //child: Expanded(child: Text),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Tab(
                        // icon: Icon(
                        //   Icons.image_outlined,
                        //   color: Colors.grey,
                        // ),
                        text: Formatter.shorten("Hình ảnh"),
                        //child: Text('Hình ảnh và video')),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Tab(
                        text: "Nhận xét",
                        // icon: Icon(
                        //   Icons.paste_outlined,
                        //   color: Colors.grey,
                        // ),
                      ),
                    ),
                  ],
                  labelColor: Color(0xFF0C9869),
                  indicatorPadding: const EdgeInsets.all(10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  //padding: EdgeInsetsGeometry.lerp(EdgeInsets.only(left: 10), EdgeInsets.only(left: 10), 30),

                  indicator: MaterialIndicator(
                    height: 5,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    horizontalPadding: 30,
                    tabPosition: TabPosition.bottom,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildReports(),
                    _buildGalleries(),
                    _buildComment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReports() {
    return Container(
      //child: PDFViewer(),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          // SourceToggleButtons(
          //   onChanged: (index) => isDownloading = index == 0,
          // ),
          SingleChildScrollView(
            controller: controller.scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  // height: sc.height,
                  // width: size.width,
                  //margin: const EdgeInsets.only(top: 5),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   border: Border.all(color: Colors.white),
                  // ),
                  child: Column(
                    children: [
                      Obx(() {
                        var listDocs = controller.listDoc.value;
                        if (listDocs.isEmpty) {
                          return Center(child: Text("Chưa có tài liệu nào!"));
                        } else {
                          return Container(
                            //height: screenSize.height,
                            // margin: const EdgeInsets.only(left: 0, top: 80),
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
                              itemCount: listDocs.length,
                              itemBuilder: (BuildContext ctx, index) {
                                final doc = listDocs[index];
                                return Card(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black.withOpacity(0.2)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                        Size.fromHeight(80),
                                      ),
                                    ),
                                    //clipBehavior: Clip.hardEdge,
                                    onPressed: () {
                                      openFile(
                                        url: doc.file.toString() == 'null'
                                            ? 'Chưa có tệp nào!'
                                            : doc.file.toString(),
                                        // opt. fileName: file.pdf
                                      );
                                      //showViewer(_document);
                                      //OpenFile.open("/sdcard/example.pptx");
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.description_outlined),
                                      title: Text(doc.file!
                                          .substring(
                                              doc.file!.lastIndexOf('/') + 1)
                                          .toString()),
                                      subtitle:
                                          Text(Formatter.date(doc.createDate)),
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
        ],
      ),
    );
  }

  Widget _buildGalleries() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Obx(() {
              final gallery = controller.listGallery.value;
              print("gallery==" + gallery.toString());
              if (gallery.isEmpty) {
                return Center(child: Text("Chưa có hình ảnh và video!"));
              } else {
                // gridDelegate:
                // SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: gallery.length);
                return
                    // AnimationLimiter(
                    GridView.count(
                  crossAxisCount: 3,
                  //   spacing: 15,
                  // runSpacing: 15,
                  children: List.generate(
                    gallery.length,
                    (int index) {
                      final img = gallery[index];
                      return Card(
                        elevation: 10,
                        child: GestureDetector(
                          child: Container(
                            // child: Hero(
                            //   tag: "customBackground",
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(5),
                            //     // child: imagPr
                            //     child: HtmlWwidget(
                            //       // 'https://png.pngtree.com/element_our/md/20180517/md_5afd56a7b8054.jpg',
                            //       img.media.toString(),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                            child: CachedVideoPreviewWidget(
                              path: img.media.toString(),
                              type: SourceType.remote,
                              remoteImageBuilder: (BuildContext context, url) =>
                                  Image.network(url),
                            ),
                          ),
                          onTap: () {
                            openFile(
                              url: img.media.toString(),
                              // opt. fileName: file.pdf
                            );
                            //showViewer(_document);
                            //OpenFile.open("/sdcard/example.pptx");
                          },
                        ),
                      );
                      // return Card(
                      //   elevation: 10,
                      //   child: FullScreenWidget(
                      //     backgroundColor: Colors.black,
                      //     child: Center(
                      //       child: Hero(
                      //         tag: "customBackground",
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(5),
                      //           // child: imagPr
                      //           // child: Image.network(
                      //           //   // 'https://png.pngtree.com/element_our/md/20180517/md_5afd56a7b8054.jpg',
                      //           //   img.media.toString(),
                      //           //   fit: BoxFit.cover,
                      //           // ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                );
                // );
              }
            }),
          ),
        ],
      ),
    );

    // return container;
  }

  Widget _buildComment() {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 10),
      child: Column(
        children: [
          Obx(() {
            var listComment = controller.listComment;
            if (listComment.isEmpty) {
              return Center(child: Text("Chưa có nhận xét nào!"));
            } else {
              return Container(
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
                  itemCount: listComment.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final cmt = listComment[index];
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
                                cmt.account!.avatarUrl.toString() == 'null'
                                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqN0tXLehHgPnrz8SKXMhPLU5Q7Dozwg04xwxx0kaGOrrSxU5R6qo-wv374BBgXI32p20&usqp=CAU"
                                    : cmt.account!.avatarUrl.toString(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Column(
                                        children: [
                                          Text(
                                            Formatter.shorten(
                                                cmt.account!.email),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      //'24/06/2020',
                                      Formatter.date(cmt.createdAt),
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
                                margin: EdgeInsets.only(left: 15, right: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      // child: DescriptionTextWidget(text: log.content.toString()),
                                      child: Text(cmt.content.toString()),
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
            }
          }),
        ],
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

  void handleClick(String value) {
    switch (value) {
      case 'Phần thưởng':
        controller.checkReward();
        break;
      case 'Chi phí':
        controller.checkBudget();
        break;
      case 'Phụ kiện':
        controller.checkItem();
        break;
      case 'Lịch sử sự kiện':
        controller.checkEventLog();
        break;
      case 'Sự cố':
        controller.checkTrouble();
        break;
    }
  }
}
