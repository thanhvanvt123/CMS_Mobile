import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';

mixin IEventDetailService {
  Future<EventDetail> getEventById(int id);
}

class EventDetailService extends BaseService<EventDetail> implements IEventDetailService {
  @override
  String endpoint() {
    return Endpoints.eventDetail;
  }


  @override
  Future<EventDetail> getEventById(int id) {
    return getByIdBase2(id, {});
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    return EventDetail.fromJson(json);
  }

}
