import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/services/api/event_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  SharedStates states = Get.find();
  TextEditingController keySearch = TextEditingController();

  final showSlider = true.obs;
  final isSearching = false.obs;


  // load data of event
  IEventService eventService = Get.find(); 
  final listEvents = <Event>[].obs;
  
  // Future<void> getEvents() async {
  //   final paging = (await eventService.getEvents());
  //   listEvents.value = paging.data!;
  // }

  Future<void> getEvents() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listEvents.value = await eventService.getEvents(); 
    print("========= hello " +listEvents.value.toString());
  }

  //final isSearching = false.obs;
  // Future<void> searchEvents(keySearch) async {
  //   if (keySearch.isEmpty) {
  //     listEvents.clear();
  //     return;
  //   }
  //   //int? bId = buildingId.value;

  //   if (!isSearching.value) {
  //     isSearching.value = true;
  //     listSearchEvents.value =
  //         await eventService.searchEvents(keySearch);
  //     Timer(Duration(seconds: 1), () => isSearching.value = false);
  //   }
  //   print("hello ===========" + listSearchEvents.toString());
  // }
  

  final listSearchEvents = <Event>[].obs;
  // Future<void> searchEvents(List<Event> list, String keySearch) async {
  //   if (keySearch.isEmpty) {
  //     listEvents.clear();
  //     return;
  //   }
  //   List<Event> listSearch = [];
  //   for (int i = 0; i < list.length; i++) {
  //     if (list[i].eventName!.contains(keySearch)) {
  //       listSearch.add(list[i]);
  //     }
  //   }

  //   if (listSearch.length > 0 || listSearch.isNotEmpty) {
  //     isSearching.value = true;
  //     listSearchEvents.value = listSearch;
  //     Timer(Duration(seconds: 1), () => isSearching.value = false);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    getEvents();
    // getTickets();
  }
}