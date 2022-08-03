import 'package:cms_mobile/src/models/account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int? commentId, accountId, eventId;
  final String? content, status;
  final DateTime? createdAt, updatedAt;
  Account? account;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Comment({
    this.commentId,
    this.content,
    this.accountId,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.account,
  });

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}