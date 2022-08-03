// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEvent _$NotificationEventFromJson(Map<String, dynamic> json) {
  return NotificationEvent(
    notificationId: json['notificationId'] as int?,
    content: json['content'] as String?,
    roleName: json['roleName'] as String?,
    avatarUrl: json['avatar'] as String?,
    isCheck: json['isCheck'] as bool?,
    isRead: json['isRead'] as bool?,
    accountId: json['accountId'] as int?,
    eventId: json['eventId'] as int?,
    reportId: json['reportId'] as int?,
    createDate: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modifyDate: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$NotificationEventToJson(NotificationEvent instance) => <String, dynamic>{
      'notificationId': instance.notificationId,
      'content': instance.content,
      'roleName': instance.roleName,
      'avatar': instance.avatarUrl,
      'isCheck': instance.isCheck,
      'isRead': instance.isRead,
      'createdAt': instance.createDate,
      'accountId': instance.accountId,
      'eventId': instance.eventId,
      'reportId': instance.reportId,
      'createdAt': instance.createDate,
      'updatedAt': instance.modifyDate,
    };
