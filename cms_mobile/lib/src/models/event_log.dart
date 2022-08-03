import 'package:json_annotation/json_annotation.dart';
part 'event_log.g.dart';

@JsonSerializable()
class Log {
  final int? eventLogId, eventId;
  final String? email, content, avatarUrl;
  final DateTime? createdAt, updatedAt;

  factory Log.fromJson(Map<String, dynamic> json) =>
      _$LogFromJson(json);

  Log({
    this.eventLogId,
    this.email,
    this.content,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.avatarUrl,
  });

  Map<String, dynamic> toJson() => _$LogToJson(this);
}