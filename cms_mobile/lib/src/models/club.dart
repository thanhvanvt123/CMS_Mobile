import 'package:cms_mobile/src/models/role.dart';
import 'package:cms_mobile/src/models/user_fcmtokens.dart';
import 'package:json_annotation/json_annotation.dart';
part 'club.g.dart';

@JsonSerializable()
class Club {
  final int? clubId;
  final String? clubName, shortName, type;

  // factory Club.fromJson(Map<String, dynamic> json) =>
  //     _$AccountFromJson(json);

  Club({
    this.clubId,
    this.clubName,
    this.shortName,
    this.type,
  });

  // Map<String, dynamic> toJson() => _$AccountToJson(this);
}
