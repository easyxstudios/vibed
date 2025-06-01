// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
FeatureRequestEntity _$FeatureRequestEntityFromJson(
  Map<String, dynamic> json
) {
    return FeatureRequestEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$FeatureRequestEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id;@TimestampConverter() DateTime get creationDate;@TimestampConverter() DateTime get lastUpdateDate; Map<String, String> get title; Map<String, String> get description; int get votes; bool get active;
/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestEntityCopyWith<FeatureRequestEntity> get copyWith => _$FeatureRequestEntityCopyWithImpl<FeatureRequestEntity>(this as FeatureRequestEntity, _$identity);

  /// Serializes this FeatureRequestEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(description),votes,active);

@override
String toString() {
  return 'FeatureRequestEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, title: $title, description: $description, votes: $votes, active: $active)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestEntityCopyWith<$Res>  {
  factory $FeatureRequestEntityCopyWith(FeatureRequestEntity value, $Res Function(FeatureRequestEntity) _then) = _$FeatureRequestEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@TimestampConverter() DateTime creationDate,@TimestampConverter() DateTime lastUpdateDate, Map<String, String> title, Map<String, String> description, int votes, bool active
});




}
/// @nodoc
class _$FeatureRequestEntityCopyWithImpl<$Res>
    implements $FeatureRequestEntityCopyWith<$Res> {
  _$FeatureRequestEntityCopyWithImpl(this._self, this._then);

  final FeatureRequestEntity _self;
  final $Res Function(FeatureRequestEntity) _then;

/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = null,Object? lastUpdateDate = null,Object? title = null,Object? description = null,Object? votes = null,Object? active = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdateDate: null == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class FeatureRequestEntityData extends FeatureRequestEntity {
  const FeatureRequestEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, @TimestampConverter() required this.creationDate, @TimestampConverter() required this.lastUpdateDate, required final  Map<String, String> title, required final  Map<String, String> description, required this.votes, required this.active}): _title = title,_description = description,super._();
  factory FeatureRequestEntityData.fromJson(Map<String, dynamic> json) => _$FeatureRequestEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override@TimestampConverter() final  DateTime creationDate;
@override@TimestampConverter() final  DateTime lastUpdateDate;
 final  Map<String, String> _title;
@override Map<String, String> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  Map<String, String> _description;
@override Map<String, String> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  int votes;
@override final  bool active;

/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureRequestEntityDataCopyWith<FeatureRequestEntityData> get copyWith => _$FeatureRequestEntityDataCopyWithImpl<FeatureRequestEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureRequestEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureRequestEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_description),votes,active);

@override
String toString() {
  return 'FeatureRequestEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, title: $title, description: $description, votes: $votes, active: $active)';
}


}

/// @nodoc
abstract mixin class $FeatureRequestEntityDataCopyWith<$Res> implements $FeatureRequestEntityCopyWith<$Res> {
  factory $FeatureRequestEntityDataCopyWith(FeatureRequestEntityData value, $Res Function(FeatureRequestEntityData) _then) = _$FeatureRequestEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@TimestampConverter() DateTime creationDate,@TimestampConverter() DateTime lastUpdateDate, Map<String, String> title, Map<String, String> description, int votes, bool active
});




}
/// @nodoc
class _$FeatureRequestEntityDataCopyWithImpl<$Res>
    implements $FeatureRequestEntityDataCopyWith<$Res> {
  _$FeatureRequestEntityDataCopyWithImpl(this._self, this._then);

  final FeatureRequestEntityData _self;
  final $Res Function(FeatureRequestEntityData) _then;

/// Create a copy of FeatureRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = null,Object? lastUpdateDate = null,Object? title = null,Object? description = null,Object? votes = null,Object? active = null,}) {
  return _then(FeatureRequestEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdateDate: null == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
