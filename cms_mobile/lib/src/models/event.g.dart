// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    eventId: json['eventId'] as int?,
      eventName: json['eventName'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      status: json['status'] as String?,
      createdBy: json['createdBy'] as int?,
      reason: json['reason'] as String?,
      numberOfParticipants: json['numberOfParticipants'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      createdAt: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      updatedAt: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      created: convertMapToList(json['created']),
      budget:  json['budgets'] == null ? null : json['budgets'] as List,
      eventItem:  json['eventItems'] == null ? null : json['eventItems'] as List,
      reward:  json['rewards'] == null ? null : json['rewards'] as List,
  );
}

Account convertMapToList(Map<String, dynamic> mapData) {
    return Account.fromJson(mapData); 
  }

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'description': instance.description,
      'location': instance.location,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'reason': instance.reason,
      'numberOfParticipants': instance.numberOfParticipants,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'created': instance.created,
      'budgets': instance.budget,
      'eventItems': instance.eventItem,
      'rewards': instance.reward,
    };
