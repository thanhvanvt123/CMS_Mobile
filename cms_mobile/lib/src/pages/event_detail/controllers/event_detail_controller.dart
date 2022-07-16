import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:cms_mobile/src/models/budget.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/item.dart';
import 'package:cms_mobile/src/models/reward.dart';
import 'package:cms_mobile/src/services/api/event_detail_service.dart';
import 'package:cms_mobile/src/services/api/event_service.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  final event = Event().obs;
  final eventDetail = EventDetail().obs;
  final listItem = <Items>[].obs;
  final listBudget = <Budgets>[].obs;
  final listReward = <Rewards>[].obs;
  final eventId = 0.obs;
  final SharedStates sharedStates = Get.find();
  //Event? event;
  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['eventId'];
    if (id == null) return;
    eventId.value = int.parse(id);
    getEventDetail();
  }

  IEventDetailService eventService = Get.find();
  Future<void> getEventDetail() async {
    print("========== " + eventId.value.toString());
    EventDetail eventApi = await eventService.getEventById(eventId.value);
    //var event = await eventService.getEventById(eventId.value);
    // event!.value = event.toString();
    eventDetail.value = eventApi;
     //sharedStates.eventDetail = eventApi;
    // print("api " + eventApi.toString());
    //event.value = sharedStates.event.toString();
    // if (eventApi != null) {
    //   event.value = eventApi;
    // }
    print("event value " + event.toString());
  }

  // IProductService productService = Get.find();
  // Future<void> getProducts() async {
  //   listProduct.value =
  //       await productService.getProductsByStoreId(storeId.value);
  // }

  // ICouponService couponService = Get.find();
  // Future<void> getCoupons() async {
  //   listCoupon.value = await couponService.getCouponsByStoreId(storeId.value);
  // }

}
