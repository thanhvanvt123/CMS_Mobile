// import 'dart:convert';

// import 'package:cms_mobile/src/common/endpoints.dart';
// import 'package:cms_mobile/src/services/api/base_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:cms_mobile/src/models/notification.dart';

// mixin INotificationCheckService {
//   Future<dynamic> checkNoti(Map<String, dynamic> noti);
//   //Future<List<Event>> searchEvents([String? search]);

// }

// class NotificationCheckService extends BaseService<NotificationEvent> implements INotificationCheckService {
//   @override
//   String endpoint() {
//     return Endpoints.checkNoti;
//   }

//   @override
//   Future<dynamic> checkNoti(Map<String, dynamic> noti) {
//     return postBase4(noti, {});
//   }

//   @override
//   fromJson(Map<String, dynamic> json) {
//     return NotificationEvent.fromJson(json);
//   }
  
// }


