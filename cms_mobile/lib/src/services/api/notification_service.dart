import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:cms_mobile/src/models/notification.dart';

mixin INotificationService {
  Future<List<NotificationEvent>> getNoti();
  //Future<List<Event>> searchEvents([String? search]);

}

class NotificationService extends BaseService<NotificationEvent> implements INotificationService {
  @override
  String endpoint() {
    return Endpoints.notifications;
  }

  @override
  Future<List<NotificationEvent>> getNoti() {
    // final params = {
    //   "accountId": "",
    //   "roleName": "moderator",
    //   "eventId": '',
    // };
    return getAllBase4({}, {});
  }

  // @override
  // Future<List<NotificationEvent>> getNotiById() {
  //   // final params = {
  //   //   "accountId": "",
  //   //   "roleName": "moderator",
  //   //   "eventId": '',
  //   // };
  //   return getAllBase4({}, {});
  // }

  @override
  fromJson(Map<String, dynamic> json) {
    return NotificationEvent.fromJson(json);
  }

  
}


