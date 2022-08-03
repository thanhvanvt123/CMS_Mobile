import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/document.dart';
import 'package:cms_mobile/src/models/report.dart';
import 'package:cms_mobile/src/services/api/report_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReportDetailController extends GetxController {
  final listReport = <Report>[].obs;
  final listDoc = <Document>[].obs;
  final reportId = 0.obs;
  final SharedStates sharedStates = Get.find();
  final ScrollController scrollController = ScrollController();
  //Event? event;
  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['reportId'];
    print("helo123 " + id.toString());
    if (id == null) return;
    sharedStates.reportId = int.parse(id);
    print("id=== " + reportId.value.toString());
    getReportDetail();
    getDoc();
    // getRewards();
    // getBudgets();
  }

  IReportService reportService = Get.find();
  Future<void> getReportDetail() async {
    print("========== " + reportId.value.toString());
    listReport.value = await reportService.getReportById(sharedStates.reportId);
    //print("van dien");
    //var event = await eventService.getEventById(eventId.value);
    //print("van dien " + clubService.getClubById(clubId.value).toString());
    // event!.value = event.toString();
    // List m =  clubApi!.accounts!;
    // clubDetail.value.accounts = m.asMap() as List<Account>;
    
    print("report====== " + listReport.toString());
     //sharedStates.eventDetail = eventApi;
    // print("api " + eventApi.toString());
    //event.value = sharedStates.event.toString();
  }

  Future<void> getDoc() async {
    // loading.value = true;
    listReport.value = await reportService.getReportById(sharedStates.reportId);
    
    for (var item in listReport) {
      for (var item2 in item.documents!.toList()) {
        listDoc.add(item2);
      }
    }
    print("1111 " + listDoc.value.toString());
    // print(listAcc.value.toString());
  }

 
}