import 'dart:convert';

import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/reward.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:flutter/material.dart';
import 'package:cms_mobile/src/models/club.dart';

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
  String convertToListV2(Function fromJson) {
    String token = '';
    //Account account = new Account();
    rawData!.forEach((key, value) {
      if (key == "token") {
        token = value;
      }
    });
    return token;
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

  EventDetail convertToListV4(Function fromJson) {
    EventDetail event = new EventDetail();

          event = EventDetail.fromJson(rawData!); 
    return event;
  }

  EventDetail convertToListV5(Function fromJson) {
    EventDetail event = new EventDetail();
    Reward r = new Reward();
    rawData!.forEach((key, value) {
      if(key == "data"){
          event.reward = EventDetail.fromJson(value).reward; 
          
        }
      // if(key == 'rewards'){
      //   event.reward = Rewards.fromJson(value) as List<Rewards>?;
      // }
    });
    //print("event=== " + event.toString());
    return event;
  }

  List<T> convertToListV6(Function fromJson) {
    List<T> r = [];
    rawData!.forEach((key, value) {
      if(key == "rewards"){
          r = EventDetail.fromJson(value).reward!.map<T>((x) => fromJson(x)).toList(); 
        }
    });
    //print("event=== " + event.toString());
    return r;
  }

  // ClubDetail convertToListV5(Function fromJson) {
  //   ClubDetail club = new ClubDetail();
    
  //     if(rawData != null){
        
  //         club = ClubDetail.fromJson(Paging.fromJson()); 

  //       }
    
  //   print("club=== " + club.toString());
  //   return club;
  // }

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
