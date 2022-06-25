import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';

mixin IEventService {
  Future<Event?> getEventById(int id);
  Future<List<dynamic>?> getEvents();
}

class EventService extends BaseService<Event> implements IEventService {
  @override
  String endpoint() {
    return Endpoints.event;
  }


  @override
  Future<Event?> getEventById(int id) {
    return getByIdBase(id);
  }

  @override
  Future<List?> getEvents() {
    return getAllBase({});
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Event.fromJson(json);
  }

}
