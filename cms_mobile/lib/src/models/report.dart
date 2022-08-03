import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/document.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'report.g.dart';

@JsonSerializable()
class Report {
  final int? reportId;
  final String? reportName, description, status;
  final int? reportTypeId, clubId;
  final DateTime? createdAt, updatedAt;
  final Account? created, modified;
  final ReportType? reportType;
  final List<Document>? documents;
  final Club? club;

  factory Report.fromJson(Map<String, dynamic> json) =>
      _$ReportFromJson(json);

  Report({
    this.reportId,
    this.reportName,
    this.description,
    this.reportTypeId,
    this.clubId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.created,
    this.modified,
    this.reportType,
    this.documents,
    this.club,
  });

   Map<String, dynamic> toJson() => _$ReportToJson(this);

}

@JsonSerializable()
class ReportType {
  final int? reportTypeId;
  final String? reportType;

  factory ReportType.fromJson(Map<String, dynamic> json) =>
      _$ReportTypeFromJson(json);

  ReportType({
    this.reportTypeId,
    this.reportType,
  });

   Map<String, dynamic> toJson() => _$ReportTypeToJson(this);

}

