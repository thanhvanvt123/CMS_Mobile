import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';

mixin IAccountService {
  Future<Account?> getAccountById(int id);
  Future<Account?> getAccountByEmail(String email, String password);
  Future<Account?> createAccount(Map<String, dynamic> account);
  Future<bool> updateProfile(int id, Map<String, String> data);
  Future<List<dynamic>?> getAccounts();
  Future<Account?> loginWithFirebase(String idToken);
  Future<Account?> refreshToken(String refreshToken);
}

class AccountService extends BaseService<Account> implements IAccountService {
  @override
  String endpoint() {
    return Endpoints.accounts;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Account.fromJson(json);
  }

  @override
  Future<Account?> getAccountById(int id) {
    return getByIdBase(id);
  }

  @override
  Future<Account?> loginWithFirebase(String idToken) async {
    return postNoAuth(Endpoints.loginFirebase, {"idToken": idToken});
  }

  @override
  Future<Account?> refreshToken(String refreshToken) {
    return postNoAuth(Endpoints.refreshToken, {"refreshToken": refreshToken});
  }


  @override
  Future<Account?> getAccountByEmail(String email, String password) {
    return postPure(Endpoints.accounts, {
      "email": email,
      "password": password,
    });
  }

  // @override
  // Future<Account?> createAccount( Map<String, dynamic> account) {
  //   return postBase(account);
  // }

  @override
  Future<Account?> createAccount( Map<String, dynamic> account) {
    
    return postBase(account);
  }

  @override
  Future<bool> updateProfile(int id, Map<String, String> data) {
    return putBase(id ,data);
  }


  @override
  Future<List<Account>?> getAccounts() {
    return getAllBase({});
    //return getAccounts();
  }

}
