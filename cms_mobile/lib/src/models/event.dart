import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  final String? eventName, description, duration, createdBy, email;
  Role? role;
  DateTime? startDate;
  List<Club>? club;
  // List<Reward>? rewards;
  // List<Budget>? budgets;
  // List<EventIem>? eventItems;
  // List<Gallery>? galleries;
  // List<Document>? documents;


  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);

  Event({
    this.eventName,
    this.description,
    this.duration,
    this.createdBy,
    this.email,
    this.role,
    this.startDate, 
    this.club,
  });

   Map<String, dynamic> toJson() => _$EventToJson(this);

}
