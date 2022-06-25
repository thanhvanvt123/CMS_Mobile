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
    role:  json['roles'] as List,
    club: json['clubs'] as List,
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
