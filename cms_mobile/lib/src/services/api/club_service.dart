import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';

mixin IClubService {
  Future<List<Club>> getClubs();
  //Future<List<Event>> searchEvents([String? search]);
  Future<List<Club>> searchClubs(String keySearch);

}

class ClubService extends BaseService<Club> implements IClubService {
  @override
  String endpoint() {
    return Endpoints.club;
  }

  @override
  Future<List<Club>> getClubs() {
    return getAllBase2({}, {});
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Club.fromJson(json);
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
  Future<List<Club>> searchClubs(String keySearch) async {
    
    return getAllBase2({
      "clubName": keySearch.toLowerCase(),
    }, {});
  }

  // Future<Paging<Store>> getStores(String searchName, int floorPlanId) async {
  //   return getPagingBase({
  //     "name": searchName.toString(),
  //     "floorPlanId": floorPlanId.toString(),
  //   });
  // }
}
