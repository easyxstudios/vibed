// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_feature_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserFeatureRequestEntity _$UserFeatureRequestEntityFromJson(
  Map<String, dynamic> json
) {
    return UserFeatureRequestEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$UserFeatureRequestEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id;@JsonKey(name: 'creation_date')@TimestampConverter() DateTime get creationDate; String get title; String get description; String get userId;
/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFeatureRequestEntityCopyWith<UserFeatureRequestEntity> get copyWith => _$UserFeatureRequestEntityCopyWithImpl<UserFeatureRequestEntity>(this as UserFeatureRequestEntity, _$identity);

  /// Serializes this UserFeatureRequestEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFeatureRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,title,description,userId);

@override
String toString() {
  return 'UserFeatureRequestEntity(id: $id, creationDate: $creationDate, title: $title, description: $description, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserFeatureRequestEntityCopyWith<$Res>  {
  factory $UserFeatureRequestEntityCopyWith(UserFeatureRequestEntity value, $Res Function(UserFeatureRequestEntity) _then) = _$UserFeatureRequestEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime creationDate, String title, String description, String userId
});




}
/// @nodoc
class _$UserFeatureRequestEntityCopyWithImpl<$Res>
    implements $UserFeatureRequestEntityCopyWith<$Res> {
  _$UserFeatureRequestEntityCopyWithImpl(this._self, this._then);

  final UserFeatureRequestEntity _self;
  final $Res Function(UserFeatureRequestEntity) _then;

/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = null,Object? title = null,Object? description = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class UserFeatureRequestEntityData extends UserFeatureRequestEntity {
  const UserFeatureRequestEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, @JsonKey(name: 'creation_date')@TimestampConverter() required this.creationDate, required this.title, required this.description, required this.userId}): super._();
  factory UserFeatureRequestEntityData.fromJson(Map<String, dynamic> json) => _$UserFeatureRequestEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override@JsonKey(name: 'creation_date')@TimestampConverter() final  DateTime creationDate;
@override final  String title;
@override final  String description;
@override final  String userId;

/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFeatureRequestEntityDataCopyWith<UserFeatureRequestEntityData> get copyWith => _$UserFeatureRequestEntityDataCopyWithImpl<UserFeatureRequestEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFeatureRequestEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFeatureRequestEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,title,description,userId);

@override
String toString() {
  return 'UserFeatureRequestEntity(id: $id, creationDate: $creationDate, title: $title, description: $description, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserFeatureRequestEntityDataCopyWith<$Res> implements $UserFeatureRequestEntityCopyWith<$Res> {
  factory $UserFeatureRequestEntityDataCopyWith(UserFeatureRequestEntityData value, $Res Function(UserFeatureRequestEntityData) _then) = _$UserFeatureRequestEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime creationDate, String title, String description, String userId
});




}
/// @nodoc
class _$UserFeatureRequestEntityDataCopyWithImpl<$Res>
    implements $UserFeatureRequestEntityDataCopyWith<$Res> {
  _$UserFeatureRequestEntityDataCopyWithImpl(this._self, this._then);

  final UserFeatureRequestEntityData _self;
  final $Res Function(UserFeatureRequestEntityData) _then;

/// Create a copy of UserFeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = null,Object? title = null,Object? description = null,Object? userId = null,}) {
  return _then(UserFeatureRequestEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
