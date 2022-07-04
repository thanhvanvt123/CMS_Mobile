import 'dart:convert';

import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:flutter/material.dart';

// Paging2 cartFromJson(String str) => Paging2.fromJson(json.decode(str));
// String cartToJson(Paging2 data) => json.encode(data.toJson());
class Paging2<T> {
  final String? message;
  final int? totalCount;
  final bool? success;
  late final List<T>? data;
  final int? pageSize, pageIndex;
  //List<dynamic>? content;
  List<dynamic>? rawContent;

  // static Paging2<T> defaultInstance<T>() {
  //   final paging = Paging2<T>();
  //   paging.data = null;
  //   return paging;
  // }
  Paging2({
    this.totalCount,
    this.success,
    this.message,
    this.rawContent,
    this.pageIndex,
    this.pageSize,
  });

  // Convert json array to list
  void convertToList(Function fromJson) {
    data = rawContent?.map<T>((x) => fromJson(x)).toList();
    rawContent = null;
  }


  factory Paging2.fromJson(Map<String, dynamic> json) => Paging2<T>(
        message: json['message'] as String?,
        success: json['success'] as bool?,
        rawContent: json['data'] as List?,
        totalCount: json['totalCount'] as int?,
        pageIndex: json['pageIndex'] as int?,
        pageSize: json['pageSize'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'success': this.success,
        'message': this.message,
        'data': this.data,
        'pageIndex': this.pageIndex,
        'pageSize': this.pageSize,
      };
}
