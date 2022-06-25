// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(
    //userId: json['accountId'] as int?,
    clubId: json['clubId'] as int?,
    clubName: json['clubName'] as String?,
    shortName: json['shortName'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'clubId': instance.clubId,
      'clubName': instance.clubName,
      'shortName': instance.shortName,
      'type': instance.type,
    };
