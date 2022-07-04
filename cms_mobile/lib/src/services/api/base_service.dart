import 'dart:convert';

import 'package:cms_mobile/src/data/api_helper.dart';
import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/club.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/models/paging_2.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/services/global_states/share_states.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http/utils/body_decoder.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:flutter/foundation.dart'; 


abstract class BaseService<T> {
  final IApiHelper _apiHelper = Get.find();

  /// Set decode function for entity
  T fromJson(Map<String, dynamic> json);


  /// Set api endpoint for entity
  String endpoint();

  Future<T?> getByIdBase(int id) async {
    Response response = await _apiHelper.getById(endpoint(), id);

    if (response.isOk) {
      return fromJson(response.body);
    }
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
