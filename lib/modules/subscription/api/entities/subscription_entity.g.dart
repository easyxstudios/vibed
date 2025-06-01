// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionEntityData _$SubscriptionEntityDataFromJson(Map json) =>
    SubscriptionEntityData(
      id: json['id'] as String?,
      offerId: json['offer_id'] as String?,
      skuId: json['product_id'] as String,
      creationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['creation_date'],
        const TimestampConverter().fromJson,
      ),
      lastUpdateDate: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['last_activity'],
        const TimestampConverter().fromJson,
      ),
      periodEndDate: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['expiration_date'],
        const TimestampConverter().fromJson,
      ),
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$SubscriptionEntityDataToJson(
  SubscriptionEntityData instance,
) => <String, dynamic>{
  if (Converters.id(instance.id) case final value?) 'id': value,
  'offer_id': instance.offerId,
  'product_id': instance.skuId,
  'creation_date': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.creationDate,
    const TimestampConverter().toJson,
  ),
  'last_activity': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.lastUpdateDate,
    const TimestampConverter().toJson,
  ),
  'expiration_date': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.periodEndDate,
    const TimestampConverter().toJson,
  ),
  'status': _$SubscriptionStatusEnumMap[instance.status]!,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.ACTIVE: 'ACTIVE',
  SubscriptionStatus.PAUSED: 'PAUSED',
  SubscriptionStatus.EXPIRED: 'EXPIRED',
  SubscriptionStatus.LIFETIME: 'LIFETIME',
  SubscriptionStatus.CANCELLED: 'CANCELLED',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
