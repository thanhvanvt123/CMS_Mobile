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
  List<dynamic>? gallery;
  List<dynamic>? document;
  List<dynamic>? club;
  List<dynamic>? comment;

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
    this.gallery,
    this.document,
    this.club,
    this.comment,
  });

   Map<String, dynamic> toJson() => _$EventToJson(this);

}

@JsonSerializable()
class EventDetail {
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
  String? email;
  List<dynamic>? budget;
  List<dynamic>? eventItem;
  List<dynamic>? reward;
  List<dynamic>? gallery;
  List<dynamic>? document;
  List<dynamic>? club;
  List<dynamic>? comment;
  List<dynamic>? trouble;

  factory EventDetail.fromJson(Map<String, dynamic> json) =>
      _$EventDetailFromJson(json);

  EventDetail({
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
    this.email,
    this.budget,
    this.eventItem,
    this.reward,
    this.gallery,
    this.document,
    this.club,
    this.comment,
    this.trouble,
  });

   Map<String, dynamic> toJson() => _$EventDetailToJson(this);

}

