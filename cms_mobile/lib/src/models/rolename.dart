import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RoleName {
  String? roleName;

  RoleName({
    this.roleName,
  });

  factory RoleName.fromJson(Map<String, dynamic> json) => RoleName(
        roleName: json['roleName'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'roleName': this.roleName,

      };
}
