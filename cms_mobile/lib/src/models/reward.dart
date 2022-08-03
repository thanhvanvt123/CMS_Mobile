import 'package:cms_mobile/src/models/account.dart';
import 'package:cms_mobile/src/models/role.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cms_mobile/src/models/club.dart';
part 'reward.g.dart';

@JsonSerializable()
class Rewards {
  int? id, level, quantityOfLevel, quantityOfReward;
  DateTime? updatedAt;
  DateTime? createdAt;
  Reward? reward;

  factory Rewards.fromJson(Map<String, dynamic> json) =>
      _$RewardsFromJson(json);

  Rewards({
    this.id,
    this.level,
    this.quantityOfLevel,
    this.quantityOfReward,
    this.updatedAt,
    this.createdAt,
    this.reward,
  });

   Map<String, dynamic> toJson() => _$RewardsToJson(this);

}

@JsonSerializable()
class Reward {
  final int? rewardId;
  final int? price;
  final String? description, image, rewardName, status;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory Reward.fromJson(Map<String, dynamic> json) =>
      _$RewardFromJson(json);

  Reward({
    this.rewardId,
    this.price,
    this.description,
    this.image,
    this.rewardName,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

   Map<String, dynamic> toJson() => _$RewardToJson(this);

}


