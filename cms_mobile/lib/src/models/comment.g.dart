// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    //userId: json['accountId'] as int?,
    commentId: json['commentId'] as int?,
    content: json['content'] as String?,
    accountId: json['accountId'] as int?,
    eventId: json['eventId'] as int?,
    account: json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>),
    status: json['status'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      //'accountId': instance.userId,
      'commentId': instance.commentId,
      'content': instance.content,
      'accountId': instance.accountId,
      'eventId': instance.eventId,
      'account': instance.account,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };