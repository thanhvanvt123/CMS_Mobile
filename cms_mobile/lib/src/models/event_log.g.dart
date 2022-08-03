// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) {
  return Log(
    //userId: json['accountId'] as int?,
    eventLogId: json['eventLogId'] as int?,
    email: json['email'] as String?,
    content: json['content'] as String?,
    eventId: json['eventId'] as int?,
    avatarUrl: json['avatarUrl'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'eventLogId': instance.eventLogId,
      'email': instance.email,
      'content': instance.content,
      'eventId': instance.eventId,
      'avatarUrl': instance.avatarUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };