import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'item.g.dart';

@JsonSerializable()
class Items {
  final int? id;
  final String? status;
  final int? totalPrice, unitPrice, quantity;
  final DateTime? createdAt, updatedAt;
  final Item? item;

  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Items({
    this.id,
    this.status,
    this.item,
    this.totalPrice,
    this.unitPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

   Map<String, dynamic> toJson() => _$ItemsToJson(this);

}

@JsonSerializable()
class Item {
  final int? eventItemId;
  final String? eventItemName, itemType, status, unit, description;
  DateTime? updatedAt, createdAt;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Item({
    this.eventItemId,
    this.eventItemName,
    this.itemType,
    this.status,
    this.unit,
    this.description,
    this.updatedAt,
    this.createdAt,
  });

   Map<String, dynamic> toJson() => _$ItemToJson(this);

}


