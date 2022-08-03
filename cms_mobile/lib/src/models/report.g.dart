// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) {
  return Report(
    reportId: json['reportId'] as int?,
    status: json['status'] as String?,
    reportName: json['reportName'] as String?,
    description: json['description'] as String?,
    reportTypeId: json['reportTypeId'] as int?,
    clubId: json['clubId'] as int?,
    created: json['created'] == null
        ? null
        : Account.fromJson(json['created'] as Map<String, dynamic>),
    modified: json['modified'] == null
        ? null
        : Account.fromJson(json['modified'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    reportType: json['reportType'] == null
        ? null
        : ReportType.fromJson(json['reportType'] as Map<String, dynamic>),
    documents: (json['documents'] as List<dynamic>?)
        ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
        .toList(),
    club: json['club'] == null
        ? null
        : Club.fromJson(json['club'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'reportId': instance.reportId,
      'status': instance.status,
      'reportName': instance.reportName,
      'description': instance.description,
      'reportTypeId': instance.reportTypeId,
      'clubId': instance.clubId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'modified': instance.modified,
      'created': instance.created,
      'reportType': instance.reportType,
      'documents': instance.documents,
      'club': instance.club,
    };

//report type
ReportType _$ReportTypeFromJson(Map<String, dynamic> json) {
  return ReportType(
    reportTypeId: json['reportTypeId'] as int?,
    reportType: json['reportType'] as String?,
  );
}

Map<String, dynamic> _$ReportTypeToJson(ReportType instance) => <String, dynamic>{
      'reportTypeId': instance.reportTypeId,
      'reportType': instance.reportType,
    };


