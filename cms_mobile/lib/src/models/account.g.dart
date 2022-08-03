// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    userId: json['accountId'] as int?,
    email: json['email'] as String?,
    phone: json['phoneNumber'] as String?,
    fullName: json['fullname'] as String?,
    avatarUrl: json['avatarUrl'] as String?,
    accountStatus: json['status'] as String?,
    createDate: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modifyDate: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    role:  json['roles'] == null ? null : json['roles'] as List,
    club: json['clubs'] == null ? null : json['clubs'] as List,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.userId,
      'fullname': instance.fullName,
      'avatarUrl': instance.avatarUrl,
      'updatedAt': instance.modifyDate,
      'email': instance.email,
      'phoneNumber': instance.phone,
      'createdAt': instance.createDate,
      'status': instance.accountStatus,
      'roles': instance.role,
      'clubs': instance.club,
    };

  Accounts _$AccountsFromJson(Map<String, dynamic> json) {
  return Accounts(
    accountId: json['accountId'] as int?,
    clubId: json['clubId'] as int?,
    id: json['id'] as int?,
    status: json['status'] as String?,
    createDate: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modifyDate: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    account:  json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>),
  );
}
// Account convertMapToList(Map<String, dynamic> mapData) {
//   return Account.fromJson(mapData);
// }

Map<String, dynamic> _$AccountsToJson(Accounts instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'clubId': instance.clubId,
      'id': instance.id,
      'updatedAt': instance.modifyDate,
      'status': instance.status,
      'createdAt': instance.createDate,
      'account': instance.account,
    };
