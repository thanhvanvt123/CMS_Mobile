import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/models/user_fcmtokens.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  final int? documentId, eventId, reportId;
  final String? file, status;
  final DateTime? createDate, modifyDate;


  // factory Account.fromJson(Map<String, dynamic> json) =>
  //     _$AccountFromJson(json);
  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
    
  Document({
    this.documentId,
    this.eventId,
    this.reportId,
    this.file,
    this.status,
    this.createDate,
    this.modifyDate,
  });

  // Map<String, dynamic> toJson() => _$AccountToJson(this);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
  
}
