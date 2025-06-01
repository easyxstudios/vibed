// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_vote_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserFeatureVoteEntity _$UserFeatureVoteEntityFromJson(
  Map<String, dynamic> json
) {
    return UserFeatureVoteEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$UserFeatureVoteEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id;@JsonKey(name: 'creation_date')@TimestampConverter() DateTime get creationDate; String get userId; String get featureId;
/// Create a copy of UserFeatureVoteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFeatureVoteEntityCopyWith<UserFeatureVoteEntity> get copyWith => _$UserFeatureVoteEntityCopyWithImpl<UserFeatureVoteEntity>(this as UserFeatureVoteEntity, _$identity);

  /// Serializes this UserFeatureVoteEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFeatureVoteEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.featureId, featureId) || other.featureId == featureId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,userId,featureId);

@override
String toString() {
  return 'UserFeatureVoteEntity(id: $id, creationDate: $creationDate, userId: $userId, featureId: $featureId)';
}


}

/// @nodoc
abstract mixin class $UserFeatureVoteEntityCopyWith<$Res>  {
  factory $UserFeatureVoteEntityCopyWith(UserFeatureVoteEntity value, $Res Function(UserFeatureVoteEntity) _then) = _$UserFeatureVoteEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime creationDate, String userId, String featureId
});




}
/// @nodoc
class _$UserFeatureVoteEntityCopyWithImpl<$Res>
    implements $UserFeatureVoteEntityCopyWith<$Res> {
  _$UserFeatureVoteEntityCopyWithImpl(this._self, this._then);

  final UserFeatureVoteEntity _self;
  final $Res Function(UserFeatureVoteEntity) _then;

/// Create a copy of UserFeatureVoteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = null,Object? userId = null,Object? featureId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,featureId: null == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class UserFeatureVoteEntityData extends UserFeatureVoteEntity {
  const UserFeatureVoteEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, @JsonKey(name: 'creation_date')@TimestampConverter() required this.creationDate, required this.userId, required this.featureId}): super._();
  factory UserFeatureVoteEntityData.fromJson(Map<String, dynamic> json) => _$UserFeatureVoteEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override@JsonKey(name: 'creation_date')@TimestampConverter() final  DateTime creationDate;
@override final  String userId;
@override final  String featureId;

/// Create a copy of UserFeatureVoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFeatureVoteEntityDataCopyWith<UserFeatureVoteEntityData> get copyWith => _$UserFeatureVoteEntityDataCopyWithImpl<UserFeatureVoteEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFeatureVoteEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFeatureVoteEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.featureId, featureId) || other.featureId == featureId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,userId,featureId);

@override
String toString() {
  return 'UserFeatureVoteEntity(id: $id, creationDate: $creationDate, userId: $userId, featureId: $featureId)';
}


}

/// @nodoc
abstract mixin class $UserFeatureVoteEntityDataCopyWith<$Res> implements $UserFeatureVoteEntityCopyWith<$Res> {
  factory $UserFeatureVoteEntityDataCopyWith(UserFeatureVoteEntityData value, $Res Function(UserFeatureVoteEntityData) _then) = _$UserFeatureVoteEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime creationDate, String userId, String featureId
});




}
/// @nodoc
class _$UserFeatureVoteEntityDataCopyWithImpl<$Res>
    implements $UserFeatureVoteEntityDataCopyWith<$Res> {
  _$UserFeatureVoteEntityDataCopyWithImpl(this._self, this._then);

  final UserFeatureVoteEntityData _self;
  final $Res Function(UserFeatureVoteEntityData) _then;

/// Create a copy of UserFeatureVoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = null,Object? userId = null,Object? featureId = null,}) {
  return _then(UserFeatureVoteEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,featureId: null == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
