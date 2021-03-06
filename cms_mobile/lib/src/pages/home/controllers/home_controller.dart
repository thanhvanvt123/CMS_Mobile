import 'dart:async';

import 'package:cms_mobile/src/models/budget.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/item.dart';
import 'package:cms_mobile/src/models/reward.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/event_detail_service.dart';
import 'package:cms_mobile/src/services/api/event_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  SharedStates states = Get.find();
  TextEditingController keySearch = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;
  final isSearching = false.obs;
  final eventName = "".obs;
  final eventId = 0.obs;
  var searchValue = "".obs;
  //var listNewEvent = listSearchEvents.obs;
  // final event = Event().obs;
  // final listItem = <Items>[].obs;
  // final listBudget = <Budgets>[].obs;
  // final listReward = <Rewards>[].obs;
  // //final eventId = 0.obs;

  // load data of event
  IEventService eventService = Get.find();
  final listEvents = <Event>[].obs;

  // Future<void> getEvents() async {
  //   final paging = (await eventService.getEvents());
  //   listEvents.value = paging.data!;
  // }

  IEventDetailService eventDetailService = Get.find();
  // Future<void> getEventDetail(int? id) async {
    
  //   print("========== " + eventId.value.toString());
  //   Event? eventApi = await eventDetailService.getEventById(eventId.value);
  //   //var event = await eventService.getEventById(eventId.value);
  //   // event!.value = event.toString();
  //   // sharedStates.event = event;
  //   print("api " + eventApi.toString());
  //   event.value = eventApi!;
  //   // if (eventApi != null) {
  //   //   event.value = eventApi;
  //   // }
  //   print("event value " + event.toString());
  // }

  Future<void> goToDetail(int? id) async {
    if (id != null) {
      Get.toNamed(Routes.eventDetail, parameters: {"eventId": id.toString()});
    }
  }

  Future<void> getEvents() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listEvents.value = await eventService.getEvents();
    print("========= hello " + listEvents.string);
  }

  Future<void> searchEvents(String keySearch) async {
    if (keySearch.isEmpty) {
      listSearchEvents.clear();
      return;
    }
    //for(int i = 0; i <= listEvents.length; i++) {
      if (!isSearching.value) {
        isSearching.value = true;
      for (var item in listEvents) {
        if(item.eventName!.toLowerCase().contains(keySearch)) {
          listSearchEvents.add(item);
        }
        //listNewSearchEvents.value = listSearchEvents;
      }
      Timer(Duration(seconds: 1), () => isSearching.value = false);
      }
   // }
      // for (dynamic item in listEvents){
      //    if (item. == s) {
      //       BotToast.showText(text: "????ng nh???p th??nh c??ng");
      //       Get.toNamed(Routes.home);
      //     } else {
      //       BotToast.showText(text: "????ng nh???p th???t b???i");
      //     }
      // }
       
      
    //}
    
    // if (!isSearching.value) {
    //   isSearching.value = true;
    //   listSearchEvents.value =
    //       await eventService.searchEvents(keySearch);
    //   Timer(Duration(seconds: 1), () => isSearching.value = false);
    // }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  Rx<List<Event>> foundEvents =
      Rx<List<Event>>([]);

  // @override
  // void onInit() {
  //   super.onInit();
  //   foundEvents.value = listEvents;
  // }

  // @override
  // void onClose() {}
  

   final listSearchEvents = <Event>[].obs;
   final listNewSearchEvents = <Event>[].obs;
  
  
  late IO.Socket socket;
  void connectAndListen() {
    socket = IO.io("http://3.0.93.160:5505", <String, dynamic>{
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
    socket.on("event-add", (_) => getEvents());
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
    eventName.value = states.events.value.eventName!;
    return true;
  }

  TextEditingController controller1 = new TextEditingController();
  
  // void filterPlayer(String eventSearch) {
  //   List<Event> results = [];
  //   if (eventSearch.isEmpty) {
  //     results = listEvents;
  //   } else {
  //     results = listEvents
  //         .where((element) => eventName
  //             .toString()
  //             .toLowerCase()
  //             .contains(eventSearch.toLowerCase()))
  //         .toList();
  //   }
  //   foundEvents.value = results;
  // }

  @override
  void onInit() {
    super.onInit();
    if (!initPage()) return;
    initPage();
    getEvents();
    connectAndListen();
    // controller1.addListener(() {
      
    //     searchValue = controller1.text as RxString;
      
    // });
    
    // getTickets();
    
    // String? id = Get.parameters['id'];
    // if (id == null) return;
    // eventId.value = int.parse(id);
    //getEventDetail(eventId.value);
    
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }
}
