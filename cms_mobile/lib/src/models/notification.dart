import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class NotificationEvent {
  final int? notificationId, accountId, eventId, reportId;
  final String? content, roleName, avatarUrl;
  final bool? isCheck, isRead;
  final DateTime? createDate, modifyDate;
  
  // factory Account.fromJson(Map<String, dynamic> json) =>
  //     _$AccountFromJson(json);
  factory NotificationEvent.fromJson(Map<String, dynamic> json) =>
      _$NotificationEventFromJson(json);
    
  NotificationEvent({
    this.notificationId,
    this.content,
    this.roleName,
    this.avatarUrl,
    this.isCheck,
    this.isRead,
    this.accountId,
    this.eventId,
    this.reportId,
    this.modifyDate,
    this.createDate,
  });

  // Map<String, dynamic> toJson() => _$AccountToJson(this);
  Map<String, dynamic> toJson() => _$NotificationEventToJson(this);
  
}
