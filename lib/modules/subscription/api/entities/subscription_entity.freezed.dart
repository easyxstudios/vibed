// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SubscriptionEntity _$SubscriptionEntityFromJson(
  Map<String, dynamic> json
) {
    return SubscriptionEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$SubscriptionEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id;@JsonKey(name: 'offer_id') String? get offerId;@JsonKey(name: 'product_id') String get skuId;@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? get creationDate;@JsonKey(name: 'last_activity')@TimestampConverter() DateTime? get lastUpdateDate;@JsonKey(name: 'expiration_date')@TimestampConverter() DateTime? get periodEndDate;@JsonKey(name: 'status') SubscriptionStatus get status;
/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionEntityCopyWith<SubscriptionEntity> get copyWith => _$SubscriptionEntityCopyWithImpl<SubscriptionEntity>(this as SubscriptionEntity, _$identity);

  /// Serializes this SubscriptionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.periodEndDate, periodEndDate) || other.periodEndDate == periodEndDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,offerId,skuId,creationDate,lastUpdateDate,periodEndDate,status);

@override
String toString() {
  return 'SubscriptionEntity(id: $id, offerId: $offerId, skuId: $skuId, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, periodEndDate: $periodEndDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $SubscriptionEntityCopyWith<$Res>  {
  factory $SubscriptionEntityCopyWith(SubscriptionEntity value, $Res Function(SubscriptionEntity) _then) = _$SubscriptionEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'offer_id') String? offerId,@JsonKey(name: 'product_id') String skuId,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? creationDate,@JsonKey(name: 'last_activity')@TimestampConverter() DateTime? lastUpdateDate,@JsonKey(name: 'expiration_date')@TimestampConverter() DateTime? periodEndDate,@JsonKey(name: 'status') SubscriptionStatus status
});




}
/// @nodoc
class _$SubscriptionEntityCopyWithImpl<$Res>
    implements $SubscriptionEntityCopyWith<$Res> {
  _$SubscriptionEntityCopyWithImpl(this._self, this._then);

  final SubscriptionEntity _self;
  final $Res Function(SubscriptionEntity) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? offerId = freezed,Object? skuId = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? periodEndDate = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEndDate: freezed == periodEndDate ? _self.periodEndDate : periodEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,
  ));
}

}


/// @nodoc
@JsonSerializable()

class SubscriptionEntityData implements SubscriptionEntity {
  const SubscriptionEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, @JsonKey(name: 'offer_id') this.offerId, @JsonKey(name: 'product_id') required this.skuId, @JsonKey(name: 'creation_date')@TimestampConverter() this.creationDate, @JsonKey(name: 'last_activity')@TimestampConverter() this.lastUpdateDate, @JsonKey(name: 'expiration_date')@TimestampConverter() this.periodEndDate, @JsonKey(name: 'status') required this.status});
  factory SubscriptionEntityData.fromJson(Map<String, dynamic> json) => _$SubscriptionEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override@JsonKey(name: 'offer_id') final  String? offerId;
@override@JsonKey(name: 'product_id') final  String skuId;
@override@JsonKey(name: 'creation_date')@TimestampConverter() final  DateTime? creationDate;
@override@JsonKey(name: 'last_activity')@TimestampConverter() final  DateTime? lastUpdateDate;
@override@JsonKey(name: 'expiration_date')@TimestampConverter() final  DateTime? periodEndDate;
@override@JsonKey(name: 'status') final  SubscriptionStatus status;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionEntityDataCopyWith<SubscriptionEntityData> get copyWith => _$SubscriptionEntityDataCopyWithImpl<SubscriptionEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.periodEndDate, periodEndDate) || other.periodEndDate == periodEndDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,offerId,skuId,creationDate,lastUpdateDate,periodEndDate,status);

@override
String toString() {
  return 'SubscriptionEntity(id: $id, offerId: $offerId, skuId: $skuId, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, periodEndDate: $periodEndDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $SubscriptionEntityDataCopyWith<$Res> implements $SubscriptionEntityCopyWith<$Res> {
  factory $SubscriptionEntityDataCopyWith(SubscriptionEntityData value, $Res Function(SubscriptionEntityData) _then) = _$SubscriptionEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'offer_id') String? offerId,@JsonKey(name: 'product_id') String skuId,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? creationDate,@JsonKey(name: 'last_activity')@TimestampConverter() DateTime? lastUpdateDate,@JsonKey(name: 'expiration_date')@TimestampConverter() DateTime? periodEndDate,@JsonKey(name: 'status') SubscriptionStatus status
});




}
/// @nodoc
class _$SubscriptionEntityDataCopyWithImpl<$Res>
    implements $SubscriptionEntityDataCopyWith<$Res> {
  _$SubscriptionEntityDataCopyWithImpl(this._self, this._then);

  final SubscriptionEntityData _self;
  final $Res Function(SubscriptionEntityData) _then;

/// Create a copy of SubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? offerId = freezed,Object? skuId = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? periodEndDate = freezed,Object? status = null,}) {
  return _then(SubscriptionEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEndDate: freezed == periodEndDate ? _self.periodEndDate : periodEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,
  ));
}


}

// dart format on
