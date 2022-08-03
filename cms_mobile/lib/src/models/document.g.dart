// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    documentId: json['documentId'] as int?,
    eventId: json['eventId'] as int?,
    reportId: json['reportId'] as int?,
    file: json['file'] as String?,
    status: json['status'] as String?,
    createDate: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    modifyDate: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'eventId': instance.eventId,
      'reportId': instance.reportId,
      'updatedAt': instance.modifyDate,
      'file': instance.file,
      'createdAt': instance.createDate,
      'status': instance.status,
    };
