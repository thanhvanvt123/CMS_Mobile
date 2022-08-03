import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/services/api/club_detail_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ClubDetailController extends GetxController {
  //final club = Club().obs;
  final clubDetail = ClubDetail().obs;
  final club = Club().obs;
  final ScrollController scrollController = ScrollController();
  // final listItem = <Items>[].obs;
  // final listBudget = <Budgets>[].obs;
  // final listReward = <Rewards>[].obs;
  final clubId = 0.obs;
  final SharedStates sharedStates = Get.find();
  final listAcc = <Accounts>[].obs;
  //Event? event;
  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['clubId'];
    if (id == null) return;
    clubId.value = int.parse(id);
    getClubDetail();
    getAcc();
    // getRewards();
    // getBudgets();
  }

  IClubDetailService clubService = Get.find();
  Future<void> getClubDetail() async {
    print("========== " + clubId.value.toString());
    ClubDetail clubApi = await clubService.getClubById(clubId.value);
    //print("van dien");
    //var event = await eventService.getEventById(eventId.value);
    //print("van dien " + clubService.getClubById(clubId.value).toString());
    // event!.value = event.toString();
    // List m =  clubApi!.accounts!;
    // clubDetail.value.accounts = m.asMap() as List<Account>;
    clubDetail.value = clubApi;
    
    print("cluaipi====== " + clubApi.toString());
     //sharedStates.eventDetail = eventApi;
    // print("api " + eventApi.toString());
    //event.value = sharedStates.event.toString();
    if (clubApi != null) {
      print("lalala");
      clubDetail.value = clubApi;
    }
    print('club1234' + clubApi.clubName.toString());
    print("club value " + clubDetail.value.toString());
  }

  Future<void> getAcc() async {
    // loading.value = true;
    ClubDetail clubApi = await clubService.getClubById(clubId.value);
    clubDetail.value = clubApi;
    listAcc.value = clubDetail.value.accounts!;
    print("1111 " + listAcc.value.toString());
    print(listAcc.value.toString());
  }

 
}