// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rewards _$RewardsFromJson(Map<String, dynamic> json) {
  return Rewards(
    id: json['id'] as int?,
    level: json['level'] as int?,
    quantityOfLevel: json['quantityOfLevel'] as int?,
    quantityOfReward: json['quantityOfReward'] as int?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    reward: json['reward'] == null
        ? null
        : Reward.fromJson(json['reward'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RewardsToJson(Rewards instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'quantityOfLevel': instance.quantityOfLevel,
      'quantityOfReward': instance.quantityOfReward,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'reward': instance.reward,
    };

// Reward convertMapToList(Map<String, dynamic> mapData) {
//   return Reward.fromJson(mapData);
// }
//reward
Reward _$RewardFromJson(Map<String, dynamic> json) {
  return Reward(
    rewardId: json['rewardId'] as int?,
    price: json['price'] as int?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    rewardName: json['rewardName'] as String?,
    status: json['status'] as String?,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'rewardId': instance.rewardId,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
      'rewardName': instance.rewardName,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
