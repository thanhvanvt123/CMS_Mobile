import 'dart:convert';

import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:flutter/material.dart';

class Paging<T> {
  final String? message;
  final bool? success;
  late final List<T>? data;
  List<dynamic>? content;
  final Map<String,dynamic>? rawData;

  static Paging<T> defaultInstance<T>() {
    final paging = Paging<T>();
    paging.content = null;
    return paging;
  }

  Paging({
    this.success,
    this.message,
    this.rawData,
  });

  // Convert json array to list
  void convertToList(Function fromJson) {
    data = content?.map<T>((x) => fromJson(x)).toList();
    content = null;
  }
  // Convert json array to list
  Account convertToListV2(Function fromJson) {
    Account account = new Account();
    rawData!.forEach((key, value) {
      if(key == "account"){
          account = Account.fromJson(value); 
        }
     });
    return account;
  }

  Account convertToListV3(Function fromJson) {
    Account account = new Account();
    Role role = new Role();
    rawData!.forEach((key, value) {
      if(key == "account"){
          account = Account.fromJson(value); 

        }
    });
    return account;
  }

  Role convertToListV4(Function fromJson) {
    Role role = new Role();
    rawData!.forEach((key, value) {
      if(key == "roles"){
          role = Role.fromJson(value); 

        }
    });
    return role;
  }

  factory Paging.fromJson(Map<String, dynamic> json) => Paging<T>(
        message: json['message'] as String?,
        success: json['success'] as bool?,
        rawData: json['data'] as Map<String,dynamic>?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'success': this.success,
        'message': this.message,
        'data': this.data,
      };

      
}
