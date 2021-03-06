import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';

mixin IEventService {
  Future<Event?> getEventById(int id);
  Future<List<Event>> getEvents();
  //Future<List<Event>> searchEvents([String? search]);
  Future<List<Event>> searchEvents(String keySearch);

}

class EventService extends BaseService<Event> implements IEventService {
  @override
  String endpoint() {
    return Endpoints.event;
  }


  @override
  Future<Event?> getEventById(int id) {
    return getByIdBase(id, {});
  }

  @override
  Future<List<Event>> getEvents() {
    return getAllBase2({}, {});
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Event.fromJson(json);
  }

  // @override
  // Future<List<Event>> searchEvents([String? search]) {
  //   final params = {
  //     "pageSize": "5",
  //     //"status": "Active",
  //   };
  //   if (search != null) {
  //     params.putIfAbsent("eventName", () => search);
  //     params.putIfAbsent("isAll", () => "true");
  //   }
  //   return getAllBase2(params, {});
  // }

  @override
  Future<List<Event>> searchEvents(String keySearch) async {
    // var byName = getAllBase2({
    //   "isAll": "true",
    //   "eventName": keySearch,
    // }, {});
    // // var byDescription = getAllBase({
    // //   "isAll": "true",
    // //   "description": keySearch,
    // // });
    // var result = await Future.wait([byName]);
    // var list = result.expand((element) => element).toList();
    // // final ids = list.map((e) => e.id).toSet();
    // //list.retainWhere((x) => ids.remove(x.id));
    // print("========== " + list.runtimeType.toString());
    // print("list ========== " + list.toString());
    // return list;
    return getAllBase2({
      "eventName": keySearch.toLowerCase(),
    }, {});
  }

  // Future<Paging<Store>> getStores(String searchName, int floorPlanId) async {
  //   return getPagingBase({
  //     "name": searchName.toString(),
  //     "floorPlanId": floorPlanId.toString(),
  //   });
  // }
}
