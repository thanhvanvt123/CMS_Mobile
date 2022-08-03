import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/budget.dart';
import 'package:cms_mobile/src/models/comment.dart';
import 'package:cms_mobile/src/models/document.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/event_log.dart';
import 'package:cms_mobile/src/models/gallery.dart';
import 'package:cms_mobile/src/models/item.dart';
import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/models/reward.dart';
import 'package:cms_mobile/src/models/trouble.dart';
import 'package:cms_mobile/src/routes/routes.dart';
import 'package:cms_mobile/src/services/api/event_detail_service.dart';
import 'package:cms_mobile/src/services/api/event_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class EventDetailController extends GetxController {
  final event = Event().obs;
  final ScrollController scrollController = ScrollController();
  final eventDetail = EventDetail().obs;
  final dataEvent = DataEvent().obs;
  final showSlider = true.obs;
  final listItem = <Items>[].obs;
  final listBudget = <Budgets>[].obs;
  final listClub = <ClubEvent>[].obs; 
  final listTrouble = <Trouble>[].obs; 
  final listEventLog = <Log>[].obs;  
  final listComment = <Comment>[].obs;  
  final listReward = <Rewards>[].obs;
  final listGallery = <Gallery>[].obs;
  final listDoc = <Document>[].obs;
  //final listGallery = <>
  final eventId = 0.obs;
  final loading = false.obs;
  final SharedStates sharedStates = Get.find();
  //Event? event;
  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['eventId'];
    if (id == null) return;
    eventId.value = int.parse(id);
    if (!initPage()) return;
    initPage();
    getEventDetail();
    getRewards();
    getBudgets();
    getGallery();
    getDocs();
    getItems();
    getClubs();
    getEventLog();
    getComments();
    getTroubles();
    connectAndListen();
  }

  IEventDetailService eventService = Get.find();
  Future<void> getEventDetail() async {
    print("========== " + eventId.value.toString());
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
     
    dataEvent.value = eventDetail.value.event!;
    print("event value " + eventApi.event.toString());

    print("event value=== " + eventDetail.value.reward.toString());
    print("event value budget === " + eventDetail.value.budget.toString());
    
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
    
    return true;
  }


  Future<void> getRewards() async {
    // loading.value = true;
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listReward.value = eventDetail.value.reward!;
  }

  Future<void> getBudgets() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listBudget.value = eventDetail.value.budget!;
  }

  Future<void> getGallery() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listGallery.value = eventDetail.value.gallery!;
  }

  Future<void> getDocs() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listDoc.value = eventDetail.value.document!;
  }

  Future<void> getItems() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listItem.value = eventDetail.value.eventItem!;
  }

  Future<void> getClubs() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listClub.value = eventDetail.value.club!;
  }

  Future<void> getComments() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listComment.value = eventDetail.value.comment!;
    print("5555 " + listComment.value.toString());
  }

  Future<void> getTroubles() async {
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listTrouble.value = eventDetail.value.trouble!;
    print("5555 " + listTrouble.value.toString());
  }

  Future<void> getEventLog() async {
    print("------");
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    eventDetail.value = eventApi;
    listEventLog.value = eventDetail.value.eventLog!;
    print("5555 " + listEventLog.value.toString());
  }

  Future<void> checkReward() async {
    if(listReward.isEmpty) {
      BotToast.showText(text: "Chưa có phần thưởng nào cho sự kiện này!");
      
    } else {
      Get.toNamed(Routes.reward);
    }
  }

  Future<void> checkBudget() async {
    if(listBudget.isEmpty) {
      BotToast.showText(text: "Chưa có chi phí nào cho sự kiện này!");
      
    } else {
      Get.toNamed(Routes.budget);
    }
  }

  Future<void> checkItem() async {
    if(listItem.isEmpty) {
      BotToast.showText(text: "Chưa có phụ kiện nào cho sự kiện này!");
      
    } else {
      Get.toNamed(Routes.item);
    }
  }

  Future<void> checkEventLog() async {
    if(listEventLog.isEmpty) {
      BotToast.showText(text: "Chưa có lịch sử chỉnh sửa nào!");
      
    } else {
      Get.toNamed(Routes.eventLog);
    }
  }

  Future<void> checkTrouble() async {
    if(listTrouble.isEmpty) {
      BotToast.showText(text: "Chưa có sự cố nào cho sự kiện này!");
      
    } else {
      Get.toNamed(Routes.trouble);
    }
  }

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
    socket.on("event-item-add", (_) => getItems());
    socket.on("event-item-update", (_) => getItems());
    socket.on("budget-add", (_) => getBudgets());
    socket.on("budget-update", (_) => getBudgets());
    socket.on("reward-add", (_) => getRewards());
    socket.on("reward-update", (_) => getRewards());
    socket.on("club-add", (_) => getClubs());
    socket.on("club-update", (_) => getClubs());
    socket.on("report-add", (_) => getDocs());
    socket.on("report-update", (_) => getDocs());
    
    socket.onConnectError((data) => print('error : ' + data.toString()));
  }

}
