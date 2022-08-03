import 'dart:convert';

import 'package:cms_mobile/src/data/api_helper.dart';
import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/models/paging_2.dart';
import 'package:cms_mobile/src/models/report.dart';
import 'package:cms_mobile/src/models/reward.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http/utils/body_decoder.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseService<T> {
  final IApiHelper _apiHelper = Get.find();

  /// Set decode function for entity
  T fromJson(Map<String, dynamic> json);

  /// Set api endpoint for entity
  String endpoint();

  Future<T?> getByIdBase(int id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response response = await _apiHelper.getById(endpoint(), id, request: {'Authorization': 'Bearer $token'});
    if (response.isOk) {
      return fromJson(response.body);
    }
  }

  Future<EventDetail> getByIdBase2(int id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response response = await _apiHelper.getById(endpoint(), id, request: {'Authorization': 'Bearer $token'});
    //print("res " + endpoint.toString());
    print("api===== " + _apiHelper.getById1(endpoint(), id, request: {'Authorization': 'Bearer $token'}).toString());
    print("body ======= " + response.body.toString());
    print("=====api " + response.body.runtimeType.toString());

    //Map<String, dynamic>? map = Paging.fromJson(response.body).rawData;
    // EventDetail event = ;
    //print("==== " + map.toString());
    EventDetail event = Paging.fromJson(response.body).convertToListV4(fromJson);
    print("1234" + event.toString());
    // List<Reward> reward = Paging.fromJson(response.body).convertToListV5(fromJson);
    //print("===event " + event.runtimeType.toString());
    //event.reward = reward;
    //print("========= " + event.reward.);
    return event;
    // if (response.statusCode == HttpStatus.ok) {
    //   print("========kkk");
      
    // }
  }

  //club
  Future<ClubDetail> getByIdBase3(int id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    print("token== " + token);
    Response response = await _apiHelper.getById(endpoint(), id, request: {'Authorization': 'Bearer $token'});
    //print("res " + endpoint.toString());
    print("api===== " + _apiHelper.getById(endpoint(), id, request: {'Authorization': 'Bearer $token'}).toString());

    
    
    Map<String, dynamic> club = response.body;
    ClubDetail clubDetail = new ClubDetail();
    club.forEach((key, value) { 
      
      if(key == "data"){
          clubDetail = ClubDetail.fromJson(value); 

        }
    
    });
    return clubDetail;

    // }
  }

  //report
  Future<List<T>> getByIdBase4(int id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    print("token== " + token);
    Response response = await _apiHelper.getById(endpoint(), id, request: {'Authorization': 'Bearer $token'});
    //print("res " + endpoint.toString());
    print("api===== " + _apiHelper.getById(endpoint(), id, request: {'Authorization': 'Bearer $token'}).toString());

    Paging2<T> paging = Paging2.fromJson(response.body);
    List<T>? content = paging.rawContent?.map<T>((x) => fromJson(x)).toList();
    return content ?? [];
    
    // L club = response.body;
    // ClubDetail clubDetail = new ClubDetail();
    // club.forEach((key, value) { 
      
    //   if(key == "data"){
    //       clubDetail = ClubDetail.fromJson(value); 

    //     }
    
    // });
    // return clubDetail;

    // }
  }


  Future<T?> postPure(String uri, Map<String, String> body) async {
    Response res = await _apiHelper.postOne(uri, body);
    if (res.isOk) {
      return fromJson(res.body);
    }
  }

  /// Get paging instance from API with [query]
  Future<Paging<T>> getPagingBase(Map<String, dynamic> query) async {
    Response res = await _apiHelper.getAll(endpoint(), query: query);
    Paging<T> paging = Paging.fromJson(res.body);
    paging.convertToList(fromJson);
    return paging;
  }

  Future<Paging<T>> getPagingBase2(
      Map<String, dynamic> query, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    print("Bearer " + token);

    Response res = await _apiHelper.getAll(endpoint(),
        query: query, request: {'Authorization': 'Bearer $token'});
    if (res.isOk) {
      Paging<T> paging = Paging.fromJson(res.body);
      paging.convertToList(fromJson);
      print("==========" + paging.runtimeType.toString());
      return paging;
    }
    
    return Paging.defaultInstance<T>();

  }

  // Get list instances from API with [query]
  Future<List<T>?> getAllBase(Map<String, dynamic> query) async {
    Response res = await _apiHelper.getAll(endpoint(), query: query);
    Paging<T> paging = Paging.fromJson(res.body);
    paging.convertToList(fromJson);
    return paging.data ?? [];
  }

  // Get list instances from API with [query]
  Future<List<T>> getAllBase2(
      Map<String, dynamic> query, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper.getAll(endpoint(),
        query: query, request: {'Authorization': 'Bearer $token'});
    print("HTTP STATUS CODE: " +
        res.statusCode.toString() +
        "========================================");
    Paging2<T> paging = Paging2.fromJson(res.body);
    List<T>? content = paging.rawContent?.map<T>((x) => fromJson(x)).toList();
    return content ?? [];
  }

  Future<List<T>> getAllBase3(Map<String, dynamic> query) async {
    Paging<T> paging = await getPagingBase2(query, {});
    return paging.data ?? [];
    // Response res = await _apiHelper.getAll(endpoint(),
    //     query: query, request: {'Authorization': 'Bearer $token'});
    // print("HTTP STATUS CODE: " +
    //     res.statusCode.toString() +
    //     "========================================");
    // print("hello " + res.body.toString());
    // print("===========1 " + Paging2.fromJson(res.body).rawContent.toString());
    // Paging2<T> paging = Paging2.fromJson(res.body);
    // //xem lại
    // List<T>? content = paging.rawContent?.map<T>((x) => fromJson(x)).toList();

    // print("=======hello " + content.toString());
    // return content ?? [];
  }

  // Get list instances from API with [query]
  Future<List<T>> getAllBase4(
      Map<String, dynamic> params, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    int accountId = sharedStates.account!.userId!;
    // int eventId = sharedStates.eventId;
    int reportId = sharedStates.reportId;
    print("========== " + accountId.toString());
    Response res = await _apiHelper.getAll(endpoint(),
        query: params = {
          'accountId': '$accountId',
          'roleName': 'moderator',
          // 'eventId': '$eventId',
          // 'id': '$reportId',
        }, request: {'Authorization': 'Bearer $token'});
    print("HTTP STATUS CODE: " +
        res.statusCode.toString() +
        "========================================");
    Paging2<T> paging = Paging2.fromJson(res.body);
    List<T>? content = paging.rawContent?.map<T>((x) => fromJson(x)).toList();
    return content ?? [];
  }

  /// Post an instance with [body]
  Future<Account?> postBase(Map<String, dynamic> body) async {
    Response res = await _apiHelper.postOne(endpoint(), body);
    print("HTTP STATUS CODE: " +
        res.statusCode.toString() +
        "========================================");
    Account account = Paging.fromJson(res.body).convertToListV3(fromJson);
    //Role role = Paging.fromJson(res.body).convertToListV4(fromJson);
    if (res.statusCode == HttpStatus.created) {
      return account;
    }
    if (res.statusCode == HttpStatus.ok) {
      return account;
    }
  }

  /// Put an instance with [id] and [body]
  Future<bool> putBase(dynamic id, Map<String, dynamic> body) async {
    Response res = await _apiHelper.putOne(endpoint(), id, body);
    if (res.statusCode == HttpStatus.noContent) {
      return true;
    }
    return false;
  }

  Future<String?> postBase2(Map<String, dynamic> body) async {
    Response res = await _apiHelper.postOne(endpoint(), body);
    print("HTTP STATUS CODE: " +
        res.statusCode.toString() +
        "========================================");
    String token = Paging.fromJson(res.body).convertToListV2(fromJson);
    if (res.statusCode == HttpStatus.created) {
      return token;
    }
    if (res.statusCode == HttpStatus.ok) {
      return token;
    }
  }

  //read noti
  Future<Paging?> postBase3(Map<String, dynamic> params, Map<String, String> headers) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    int notiId = sharedStates.notiId;
    Response res = await _apiHelper.postOne(endpoint(), {}, query: params = {
          // 'accountId': '$accountId',
          // 'roleName': 'moderator',
          // 'eventId': '$eventId',
          'notificationId': '$notiId',
        }, request: {'Authorization': 'Bearer $token'});
    print("HTTP STATUS CODE read noti: " +
        res.statusCode.toString() +
        "========================================");
        Paging paging = Paging.fromJson(res.body);
        print("notiiiiiiiii===" + paging.message.toString());
        print("endpoint" + notiId.toString());
    // String token = Paging.fromJson(res.body).convertToListV2(fromJson);
    if (res.statusCode == HttpStatus.created) {
      return paging;
    }
    if (res.statusCode == HttpStatus.ok) {
      return paging;
    }
  }

  // Future<Map<String, dynamic>?> postBase4(Map<String, dynamic> body, Map<String, String> request) async {
  //   SharedStates sharedStates = Get.find();
  //   String token = sharedStates.token;
  //   Response res = await _apiHelper.postOne(endpoint(), body, request: {'Authorization': 'Bearer $token'});
  //   print("HTTP STATUS CODE check noti: " +
  //       res.statusCode.toString() +
  //       "========================================");
  //   // String token = Paging.fromJson(res.body).convertToListV2(fromJson);
  //   if (res.statusCode == HttpStatus.created) {
  //     return res.body;
  //   }
  //   if (res.statusCode == HttpStatus.ok) {
  //     return res.body;
  //   }
  // }

 

  /// Delete an instance
  Future<bool> deleteBase(dynamic id) async {
    Response res = await _apiHelper.deleteOne(endpoint(), id);
    return res.statusCode == HttpStatus.noContent;
  }

  Future<T?> postNoAuth(String endpoint, Map<String, String> body) async {
    Response res = await _apiHelper.postOne(endpoint, body);
    if (res.statusCode == HttpStatus.ok) {
      return fromJson(res.body);
    }
  }

  // Future<T?> convertToListBase<T>(body, Function fromJson) async {
  //   List = await _apiHelper.convertToList(body, fromJson);
  //   return (body as List).map<T>((x) => fromJson(x)).toList();
  // }
}
