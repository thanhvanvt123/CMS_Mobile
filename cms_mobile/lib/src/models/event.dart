import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/budget.dart';
import 'package:cms_mobile/src/models/comment.dart';
import 'package:cms_mobile/src/models/document.dart';
import 'package:cms_mobile/src/models/event_log.dart';
import 'package:cms_mobile/src/models/gallery.dart';
import 'package:cms_mobile/src/models/item.dart';
import 'package:cms_mobile/src/models/paging.dart';
import 'package:cms_mobile/src/models/paging_2.dart';
import 'package:cms_mobile/src/models/reward.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/models/trouble.dart';
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
  final DataEvent? event;
  List<Budgets>? budget;
  List<Items>? eventItem;
  List<Rewards>? reward;
  List<Gallery>? gallery;
  List<Document>? document;
  List<ClubEvent>? club;
  List<Comment>? comment;
  List<Trouble>? trouble;
  List<Log>? eventLog;

  factory EventDetail.fromJson(Map<String, dynamic> json) =>
      _$EventDetailFromJson(json);

  EventDetail({
    this.event,
    this.budget,
    this.eventItem,
    this.reward,
    this.gallery,
    this.document,
    this.club,
    this.comment,
    this.trouble,
    this.eventLog, 
  });

   Map<String, dynamic> toJson() => _$EventDetailToJson(this);

  //  void convertToList(Function fromJson) {
  //   List<Rewards>? data;
  //   data = reward?.map<Rewards>((x) => fromJson(x)).toList();
  //   //rawContent = null;
  // }
}


@JsonSerializable()
class DataEvent {
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

  factory DataEvent.fromJson( Map<String, dynamic> json) =>
      _$DataEventFromJson(json);

  DataEvent({
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
  });

   Map<String, dynamic> toJson() => _$DataEventToJson(this);

  //  void convertToList(Function fromJson) {
  //   List<Rewards>? data;
  //   data = reward?.map<Rewards>((x) => fromJson(x)).toList();
  //   //rawContent = null;
  // }
}