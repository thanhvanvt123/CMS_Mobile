// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    id: json['id'] as int?,
    status: json['status'] as String?,
    totalPrice: json['totalPrice'] as int?,
    unitPrice: json['unitPrice'] as int?,
    quantity: json['quantity'] as int?,
    item: json['eventItem'] == null
        ? null
        : Item.fromJson(json['eventItem'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'eventItem': instance.item,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

//item
Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    eventItemId: json['eventItemId'] as int?,
    eventItemName: json['eventItemName'] as String?,
    itemType: json['itemType'] as String?,
    status: json['status'] as String?,
    unit: json['unit'] as String?,
    description: json['description'] as String?,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'eventItemId': instance.eventItemId,
      'eventItemName': instance.eventItemName,
      'itemType': instance.itemType,
      'status': instance.status,
      'unit': instance.unit,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
