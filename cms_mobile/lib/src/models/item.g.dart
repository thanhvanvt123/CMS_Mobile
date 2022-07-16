// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      item:  json['item'] as Item?,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'item': instance.item,
    };


//item
Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    id: json['id'] as int?,
      quantity: json['quantity'] as int?,
      totalPrice: json['totalPrice'] as double?,
      unitPrice: json['unitPrice'] as double?,
      status: json['status'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'unitPrice': instance.unitPrice,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
    };
