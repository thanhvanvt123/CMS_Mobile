import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  final int? eventId;
  final String? eventName, description, location;
  DateTime? startDate;
  DateTime? updatedAt;
  DateTime? createdAt;
  DateTime? endDate;
  String? status;
  String? reason;
  int? numberOfParticipants;
  int? createdBy;
  Account? created;
  List<dynamic>? budget;
  List<dynamic>? eventItem;
  List<dynamic>? reward;

  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);

  Event({
    this.eventId,
    this.eventName,
    this.description,
    this.location,
    this.startDate,
    this.updatedAt,
    this.createdAt,
    this.endDate,
    this.status,
    this.reason,
    this.numberOfParticipants,
    this.createdBy,
    this.created,
    this.budget,
    this.eventItem,
    this.reward,
  });

   Map<String, dynamic> toJson() => _$EventToJson(this);

}
