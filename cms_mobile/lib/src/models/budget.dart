import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'budget.g.dart';

@JsonSerializable()
class Budgets {
  final int? id;
  final int? price;
  final List<String>? billImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  Budget? budget;

  factory Budgets.fromJson(Map<String, dynamic> json) =>
      _$BudgetsFromJson(json);

  Budgets({
    this.id,
    this.price,
    this.billImage,
    this.updatedAt,
    this.createdAt,
    this.budget,
  });

   Map<String, dynamic> toJson() => _$BudgetsToJson(this);

}

@JsonSerializable()
class Budget {
  final int? budgetId;
  final String? budgetName, contact, description, location, provider, status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Budget.fromJson(Map<String, dynamic> json) =>
      _$BudgetFromJson(json);

  Budget({
    this.budgetId,
    this.budgetName,
    this.contact,
    this.description,
    this.location,
    this.provider,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

   Map<String, dynamic> toJson() => _$BudgetToJson(this);

}


