import 'package:cms_mobile/src/models/account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'trouble.g.dart';

@JsonSerializable()
class Trouble {
  final int? troubleId, eventId;
  final String? troubleContent, status;
  final DateTime? createdAt, datetime, updatedAt;
  factory Trouble.fromJson(Map<String, dynamic> json) =>
      _$TroubleFromJson(json);

  Trouble({
    this.troubleId,
    this.troubleContent,
    this.eventId,
    this.datetime,
    this.updatedAt,
    this.status,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => _$TroubleToJson(this);
}