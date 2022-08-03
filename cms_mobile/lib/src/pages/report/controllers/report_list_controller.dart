import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/report.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/report_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final listReport = <Report>[].obs;
  final listSearchReport = <Report>[].obs;
  final reportId = 0.obs;
  final isSearching = false.obs;
  final SharedStates sharedStates = Get.find();
  //Event? event;
  @override
  void onInit() {
    super.onInit();
    getReport();
    String? id = Get.parameters['id'];
    if (id == null) return;
    reportId.value = int.parse(id);
    // getReportDe(clubId.value);
    
    // getRewards();
    // getBudgets();
  }

  IReportService reportService = Get.find();
  Future<void> getReport() async {
    print('report====');
    // print("========== " + reportId.value.toString());
    listReport.value = await reportService.getReports() ;
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

  Future<void> goToDetail(int? id) async {
    print("report" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.reportDetail, parameters: {"reportId": id.toString()});
    }
  }

  Future<void> searchReports(String keySearch) async {
    listSearchReport.clear();
    if (keySearch.isEmpty) {
      listSearchReport.clear();
      return;
    }
    //for(int i = 0; i <= listEvents.length; i++) {
      if (!isSearching.value) {
        isSearching.value = true;
      for (var item in listReport) {
        if(item.reportName!.toLowerCase().contains(keySearch)) {
          listSearchReport.add(item);
        }
        //listNewSearchEvents.value = listSearchEvents;
      }
      Timer(Duration(seconds: 1), () => isSearching.value = false);
      }  
  }

  

}