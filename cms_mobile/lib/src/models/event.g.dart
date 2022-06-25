// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    //userId: json['accountId'] as int?,
    eventName: json['eventName'] as String?,
    description: json['description'] as String?,
    duration: json['duration'] as String?,
    createdBy: json['createdBy'] as String?,
    email: json['email'] as String?,
    role: json['role'] as Role?,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    club: json['clubs'] as List<Club>,
    // reward: json['rewards'] as List<Reward>,
    // budget: json['budgets'] as List<Budget>,
    // eventItem: json['eventItems'] as List<EventItem>,
    // gallery: json['galleries'] as List<Gallery>,
    // document: json['documents'] as List<Document>,

  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'eventName': instance.eventName,
      'description': instance.description,
      'duration': instance.duration,
      'createdBy': instance.createdBy,
      'email': instance.email,
      'role': instance.role,
      'startDate': instance.startDate,
      'clubs': instance.club,
      // 'rewards': instance.club.toList(),
      // 'budgets': instance.club.toList(),
      // 'eventItems': instance.club.toList(),
      // 'galleries': instance.club.toList(),
      // 'documents': instance.club.toList(),

    };
