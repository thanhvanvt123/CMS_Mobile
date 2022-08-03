// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trouble.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Trouble _$TroubleFromJson(Map<String, dynamic> json) {
  return Trouble(
    //userId: json['accountId'] as int?,
    troubleId: json['troubleId'] as int?,
    troubleContent: json['troubleContent'] as String?,
    eventId: json['eventId'] as int?,
    status: json['status'] as String?,
    datetime: json['datetime'] == null
        ? null
        : DateTime.parse(json['datetime'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$TroubleToJson(Trouble instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'troubleId': instance.troubleId,
      'troubleContent': instance.troubleContent,
      'eventId': instance.eventId,
      'status': instance.status,
      'datetime': instance.datetime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };