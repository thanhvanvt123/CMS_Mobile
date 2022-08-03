import 'dart:async';

import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/club_detail_service.dart';
import 'package:cms_mobile/src/services/api/club_service.dart';
import 'package:cms_mobile/src/services/api/event_detail_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:intl/intl.dart';


class ClubController extends GetxController {
  SharedStates states = Get.find();
  TextEditingController keySearch = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;
  final isSearching = false.obs;
  final clubName = "".obs;
  final clubId = 0.obs;
  var searchValue = "".obs;
  final club = Club().obs;

  // load data of event
  IClubService clubService = Get.find();
  final listClubs = <Club>[].obs;
  final list = <Club>[].obs;

  //IEventDetailService eventDetailService = Get.find();

  Future<void> goToDetail(int? id) async {
    if (id != null) {
      Get.toNamed(Routes.clubDetail, parameters: {"clubId": id.toString()});
    }
  }

  Future<void> getClubs() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listClubs.value = await clubService.getClubs();
    list.value = await clubService.getClubs();
    print("========= hello " + listClubs.string);
  }

  Future<void> searchClubs(String keySearch) async {
    listSearchClubs.clear();
    if (keySearch.isEmpty) {
      listSearchClubs.clear();
      return;
    }
    //for(int i = 0; i <= listEvents.length; i++) {
      if (!isSearching.value) {
        isSearching.value = true;
      for (var item in listClubs) {
        if(item.clubName!.toLowerCase().contains(keySearch)) {
          listSearchClubs.add(item);
        }
        //listNewSearchEvents.value = listSearchEvents;
      }
      Timer(Duration(seconds: 1), () => isSearching.value = false);
      }

      
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   foundEvents.value = listEvents;
  // }

  // @override
  // void onClose() {}
  

   final listSearchClubs = <Club>[].obs;
   final listNewSearchClubs = <Club>[].obs;
  
  
  late IO.Socket socket;
  void connectAndListen() {
    socket = IO.io("http://13.229.73.115:5505", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      //'extraHeaders': {'foo': 'bar'},
    });
    socket.connect();
    print(socket.connected);
    // socket = await IO.io('ip server',
    //     OptionBuilder()
    //         .setTransports(['websocket']).build());
    socket.onConnect((_) => print('connect'));
    socket.on("club-add", (_) => getClubs());
     socket.on("club-add", (_) => print("helo"));
    socket.on("club-update", (_) => getClubs());
    socket.onConnectError((data) => print('error : ' + data.toString()));
  }

    bool initPage() {
    scrollController.addListener(() {
      final fromTop = scrollController.position.pixels;
      if (fromTop > 10) {
        showSlider.value = false;
      } else if (fromTop == 0) {
        showSlider.value = true;
      }
    });
    //eventName.value = states.events.value.eventName!;
    return true;
  }

  TextEditingController controller1 = new TextEditingController();
  
  void filterClub(var choice) {
    listClubs.clear();

    for (var item in list) {
      print("=========== " + item.status.toString());

      if (item.status!.contains(choice)) {
        listClubs.add(item);
      }
    }
    print("12345====== " + listClubs.toString());

    Timer(Duration(seconds: 1), () => isSearching.value = false);
  }

  IClubDetailService clubDetailService = Get.find();
  Future<void> getClubDetail(int? id) async {
    
    print("========== " + clubId.value.toString());
    Club? clubApi = (await clubDetailService.getClubById(clubId.value)) as Club?;
    //var event = await eventService.getEventById(eventId.value);
    // event!.value = event.toString();
    // sharedStates.event = event;
    print("api " + clubApi.toString());
    club.value = clubApi!;
    // if (eventApi != null) {
    //   event.value = eventApi;
    // }
    print("event value " + club.toString());
  }

  @override
  void onInit() {
    super.onInit();
    if (!initPage()) return;
    initPage();
    getClubs();
    connectAndListen();
    
    String? id = Get.parameters['id'];
    if (id == null) return;
    clubId.value = int.parse(id);
    getClubDetail(clubId.value);
    
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }
}
