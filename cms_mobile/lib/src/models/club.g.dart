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
    slogan: json['slogan'] as String?,
    status: json['status'] as String?,
    logo: json['logo'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    foundingDate: json['foundingDate'] == null
        ? null
        : DateTime.parse(json['foundingDate'] as String),
  );
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'clubId': instance.clubId,
      'clubName': instance.clubName,
      'shortName': instance.shortName,
      'type': instance.type,
      'slogan': instance.slogan,
      'status': instance.status,
      'logo': instance.logo,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'foundingDate': instance.foundingDate,
    };
