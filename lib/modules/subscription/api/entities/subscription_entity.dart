// ignore_for_file: invalid_annotation_target, constant_identifier_names

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_entity.freezed.dart';
part 'subscription_entity.g.dart';

enum SubscriptionStatus {
  ACTIVE,
  PAUSED,
  EXPIRED,
  LIFETIME,
  CANCELLED,
}


@freezed
sealed class SubscriptionEntity with _$SubscriptionEntity {
  const factory SubscriptionEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    @JsonKey(name: 'offer_id') String? offerId,
    @JsonKey(name: 'product_id') required String skuId,
    @JsonKey(name: 'creation_date')
    @TimestampConverter()
    DateTime? creationDate,
    @JsonKey(name: 'last_activity')
    @TimestampConverter()
    DateTime? lastUpdateDate,
    @JsonKey(name: 'expiration_date')
    @TimestampConverter()
    DateTime? periodEndDate,
    @JsonKey(name: 'status') required SubscriptionStatus status,
  }) = SubscriptionEntityData;

  factory SubscriptionEntity.fromJson(String id, Map<String, Object?> json) =>
      _$SubscriptionEntityFromJson(json..['id'] = id);
}

