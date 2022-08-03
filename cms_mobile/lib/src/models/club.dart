import 'package:cms_mobile/src/models/account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'club.g.dart';

@JsonSerializable()
class Club {
  final int? clubId;
  final String? clubName, shortName, type, slogan, logo, status;
  final DateTime? createdAt, foundingDate, updatedAt;
  factory Club.fromJson(Map<String, dynamic> json) =>
      _$ClubFromJson(json);

  Club({
    this.clubId,
    this.clubName,
    this.shortName,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.foundingDate,
    this.logo,
    this.slogan,
    this.status,
  });

  Map<String, dynamic> toJson() => _$ClubToJson(this);
}

@JsonSerializable()
class ClubDetail {
  final int? clubId;
  final String? clubName, shortName, type, slogan, logo;
  final DateTime? createdAt, foundingDate, updatedAt;
  List<Accounts>? accounts;
  factory ClubDetail.fromJson(Map<String, dynamic> json) =>
      _$ClubDetailFromJson(json);

  ClubDetail({
    this.clubId,
    this.clubName,
    this.shortName,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.foundingDate,
    this.logo,
    this.slogan,
    this.accounts,
  });

  Map<String, dynamic> toJson() => _$ClubDetailToJson(this);
}

@JsonSerializable()
class ClubEvent {
  final int? id;
  final DateTime? createdAt, updatedAt;
  final Club? club;
  factory ClubEvent.fromJson(Map<String, dynamic> json) =>
      _$ClubEventFromJson(json);

  ClubEvent({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.club,
  });

  Map<String, dynamic> toJson() => _$ClubEventToJson(this);
}
