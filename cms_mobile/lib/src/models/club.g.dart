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

//detail club
ClubDetail _$ClubDetailFromJson(Map<String, dynamic> json) {
  return ClubDetail(
    //userId: json['accountId'] as int?,
    clubId: json['clubId'] as int?,
    clubName: json['clubName'] as String?,
    shortName: json['shortName'] as String?,   
    logo: json['logo'] as String?,
    slogan: json['slogan'] as String?,
    foundingDate: json['foundingDate'] == null
        ? null
        : DateTime.parse(json['foundingDate'] as String),
    type: json['type'] as String?,
    //status: json['status'] as String?,
    
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    
    //accounts: convertMapToList(json['accounts']) as List<Account>,
    accounts: (json['accounts'] as List<dynamic>?)
        ?.map((e) => Accounts.fromJson(e as Map<String, dynamic>))
        .toList(),
    // reports: json['reports'] == null ? null : json['reports'] as List,
  );
}

//  Account convertMapToList(Map<String, dynamic> mapData) {
//   return Account.fromJson(mapData);
// }


Map<String, dynamic> _$ClubDetailToJson(ClubDetail instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'clubId': instance.clubId,
      'clubName': instance.clubName,
      'shortName': instance.shortName,
      'logo': instance.logo,
      'slogan': instance.slogan,
      'foundingDate': instance.foundingDate,
      'type': instance.type,      
      //'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,  
      'accounts': instance.accounts,
      // 'reports': instance.reports,
      // 'events': instance.events,
    };

//club event
ClubEvent _$ClubEventFromJson(Map<String, dynamic> json) {
  return ClubEvent(
    //userId: json['accountId'] as int?,
    id: json['id'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    
    //accounts: convertMapToList(json['accounts']) as List<Account>,
    club: json['club'] == null
        ? null
        : Club.fromJson(json['club'] as Map<String, dynamic>),
    //     ?.map((e) => Cl.fromJson(e as Map<String, dynamic>))
    //     .toList(),
    // reports: json['reports'] == null ? null : json['reports'] as List,
  );
}

//  Account convertMapToList(Map<String, dynamic> mapData) {
//   return Account.fromJson(mapData);
// }


Map<String, dynamic> _$ClubEventToJson(ClubEvent instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,  
      'club': instance.club,
    };

