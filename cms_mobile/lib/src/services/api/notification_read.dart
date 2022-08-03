import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:cms_mobile/src/models/notification.dart';

mixin INotificationReadService {
  Future<Paging?> readNoti();
  //Future<List<Event>> searchEvents([String? search]);

}

class NotificationReadService extends BaseService<Paging> implements INotificationReadService {
  @override
  String endpoint() {
    return Endpoints.readNoti;
  }

  @override
  Future<Paging?> readNoti() {

    return postBase3({}, {});
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Paging.fromJson(json);
  }

  
}


