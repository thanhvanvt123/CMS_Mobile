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
