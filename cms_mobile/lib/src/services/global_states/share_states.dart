import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/event.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/models/rolename.dart';
import 'package:cms_mobile/src/util/utils.dart';
import 'package:get/get.dart';


class SharedStates extends GetxService {
  /// selected bottom bar index
  final bottomBarSelectedIndex = 0.obs;

  // User login in app
  Account? account;
  Utils?  utils;
  Event? event;
  Role? role;
  RoleName? rolename;
  String token = '';


}
