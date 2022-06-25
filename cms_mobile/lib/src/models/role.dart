import 'package:cms_mobile/src/models/rolename.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  final int? roleId;
  final RoleName? role;

  factory Role.fromJson(Map<String, dynamic> json) =>
      _$RoleFromJson(json);

  Role( {
    this.roleId,
    this.role,
  });

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
