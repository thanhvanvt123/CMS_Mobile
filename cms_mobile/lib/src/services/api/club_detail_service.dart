import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';

mixin IClubDetailService {
  Future<ClubDetail> getClubById(int id);
}

class ClubDetailService extends BaseService<ClubDetail> implements IClubDetailService {
  @override
  String endpoint() {
    return Endpoints.clubDetail;
  }


  @override
  Future<ClubDetail> getClubById(int id) {
    return getByIdBase3(id, {});
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return ClubDetail.fromJson(json);
  }

}
