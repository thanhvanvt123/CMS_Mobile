import 'dart:convert';

import 'package:cms_mobile/src/common/endpoints.dart';
import 'package:cms_mobile/src/models/report.dart';
import 'package:cms_mobile/src/services/api/base_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:cms_mobile/src/models/notification.dart';

mixin IReportService {
  Future<List<Report>> getReports();
  Future<List<Report>> getReportById(int id);
  //Future<List<Event>> searchEvents([String? search]);

}

class ReportService extends BaseService<Report> implements IReportService {
  @override
  String endpoint() {
    return Endpoints.reportDetail;
  }

  @override
  Future<List<Report>> getReports() {
    // final params = {
    //   "accountId": "",
    //   "roleName": "moderator",
    //   "eventId": '',
    // };
    return getAllBase4({}, {});
  }

  @override
  Future<List<Report>> getReportById(int id) {
    // final params = {
    //   "accountId": "",
    //   "roleName": "moderator",
    //   "eventId": '',
    // };
    return getByIdBase4(id, {});
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return Report.fromJson(json);
  }

  
}


