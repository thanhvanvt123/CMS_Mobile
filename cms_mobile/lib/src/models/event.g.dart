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
    budget: json['budgets'] == null ? null : json['budgets'] as List,
    eventItem: json['eventItems'] == null ? null : json['eventItems'] as List,
    reward: json['rewards'] == null ? null : json['rewards'] as List,
    gallery: json['galleries'] == null ? null : json['galleries'] as List,
    document: json['documents'] == null ? null : json['documents'] as List,
    club: json['clubs'] == null ? null : json['clubs'] as List,
    comment: json['comments'] == null ? null : json['comments'] as List,
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
      'galleries': instance.gallery,
      'documents': instance.document,
      'clubs': instance.club,
      'comments': instance.comment,
    };

//Event Detail
EventDetail _$EventDetailFromJson(Map<String,dynamic> json) {
  return EventDetail(
    event: convertMapToList2(json['event']),
    budget: (json['budgets'] as List<dynamic>?)
        ?.map((e) => Budgets.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventItem: (json['eventItems'] as List<dynamic>?)
        ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
        .toList(),
     //reward: Paging().rawData!.convertToListV5(json['rewards']),
    //reward: json['rewards'] == null ? null : json['rewards'] as List,
    reward: (json['rewards'] as List<dynamic>?)
        ?.map((e) => Rewards.fromJson(e as Map<String, dynamic>))
        .toList(),
    gallery: (json['galleries'] as List<dynamic>?)
        ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
        .toList(),
    document: (json['documents'] as List<dynamic>?)
        ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
        .toList(),
    club: (json['clubs'] as List<dynamic>?)
        ?.map((e) => ClubEvent.fromJson(e as Map<String, dynamic>))
        .toList(),
    comment: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    eventLog: (json['eventLogs'] as List<dynamic>?)
        ?.map((e) => Log.fromJson(e as Map<String, dynamic>))
        .toList(),
    trouble: (json['troubles'] as List<dynamic>?)
        ?.map((e) => Trouble.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
  
}
DataEvent convertMapToList2(Map<String, dynamic> mapData) {
  return DataEvent.fromJson(mapData);
}



Map<String, dynamic> _$EventDetailToJson(EventDetail instance) => <String, dynamic>{
      'event': instance.event,
      'budgets': instance.budget,
      'eventItems': instance.eventItem,
      'rewards': instance.reward,
      'galleries': instance.gallery,
      'documents': instance.document,
      'clubs': instance.club,
      'comments': instance.comment,
      'eventLogs': instance.eventLog,
      'troubles': instance.trouble,
    };


    //Event data
DataEvent _$DataEventFromJson(Map<String, dynamic> json) {
  return DataEvent(   
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
    email: json['email'] as String?,
  );
}
// Reward convertMapToList2(List mapData) {
//   return json['rewards'].m
// }



Map<String, dynamic> _$DataEventToJson(DataEvent instance) => <String, dynamic>{
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
      'email': instance.email,
    };

