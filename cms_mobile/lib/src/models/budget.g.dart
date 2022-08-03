// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budgets _$BudgetsFromJson(Map<String, dynamic> json) {
  return Budgets(
    id: json['id'] as int?,
      price: json['price'] as int?,
      // billImage: (json['billImage'] as List<dynamic>?)
      //   ?.map((e) => (e as []))
      //   .toList(),
      billImage: (json['billImage'] as List<dynamic>?)?.map((e) => e as String)
        .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      budget:  json['budget'] == null
        ? null
        : Budget.fromJson(json['budget'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BudgetsToJson(Budgets instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'billImage': instance.billImage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'budget': instance.budget,
    };


//budget
Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return Budget(
    budgetId: json['budgetId'] as int?,
      budgetName: json['budgetName'] as String?,
      contact: json['contact'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      provider: json['provider'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'budgetId': instance.budgetId,
      'budgetName': instance.budgetName,
      'contact': instance.contact,
      'description': instance.description,
      'location': instance.location,
      'provider': instance.provider,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
