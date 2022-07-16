import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'item.g.dart';

@JsonSerializable()
class Items {
  DateTime? createdAt;
  Item? item;

  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Items({
    this.createdAt,
    this.item
  });

   Map<String, dynamic> toJson() => _$ItemsToJson(this);

}

@JsonSerializable()
class Item {
  final int? id, quantity;
  final double? totalPrice, unitPrice;
  final String? status;
  DateTime? updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Item({
    this.id,
    this.quantity,
    this.totalPrice,
    this.unitPrice,
    this.status,
    this.updatedAt,
  });

   Map<String, dynamic> toJson() => _$ItemToJson(this);

}


