import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/models/user_fcmtokens.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final int? userId;
  final String? fullName, avatarUrl, phone;
  final String? email;
  final DateTime? createDate, modifyDate;
  final String? accountStatus;
  final List<dynamic>? role ;
  final UserFcmtokens? userFcmtokens;
  final List<dynamic>? club;


  // factory Account.fromJson(Map<String, dynamic> json) =>
  //     _$AccountFromJson(json);
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
    
  Account({
    this.userId,
    this.fullName,
    this.avatarUrl,
    this.email,
    this.phone,
    this.role,
    this.userFcmtokens,
    this.modifyDate,
    this.createDate,
    this.accountStatus,
    this.club
  });

  // Map<String, dynamic> toJson() => _$AccountToJson(this);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
  
}

@JsonSerializable()
class Accounts {
  final int? accountId, clubId, id;
  final Account? account;
  final DateTime? createDate, modifyDate;
  final String? status;



  // factory Account.fromJson(Map<String, dynamic> json) =>
  //     _$AccountFromJson(json);
  factory Accounts.fromJson(Map<String, dynamic> json) =>
      _$AccountsFromJson(json);
    
  Accounts({
    this.accountId,
    this.clubId,
    this.id,
    this.account,
    this.createDate,
    this.status,
    this.modifyDate,
  });

  // Map<String, dynamic> toJson() => _$AccountToJson(this);
  Map<String, dynamic> toJson() => _$AccountsToJson(this);
  
}
