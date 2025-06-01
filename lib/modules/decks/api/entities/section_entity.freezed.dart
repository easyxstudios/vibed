// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SectionEntity _$SectionEntityFromJson(
  Map<String, dynamic> json
) {
    return SectionEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$SectionEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id; String get title; String get subtitle; String get categoryId; List<String> get deckIds; int get sortOrder; bool get isFeatured; bool get active;@TimestampConverter() DateTime? get creationDate;@TimestampConverter() DateTime? get lastUpdateDate;
/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionEntityCopyWith<SectionEntity> get copyWith => _$SectionEntityCopyWithImpl<SectionEntity>(this as SectionEntity, _$identity);

  /// Serializes this SectionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.deckIds, deckIds)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,categoryId,const DeepCollectionEquality().hash(deckIds),sortOrder,isFeatured,active,creationDate,lastUpdateDate);

@override
String toString() {
  return 'SectionEntity(id: $id, title: $title, subtitle: $subtitle, categoryId: $categoryId, deckIds: $deckIds, sortOrder: $sortOrder, isFeatured: $isFeatured, active: $active, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $SectionEntityCopyWith<$Res>  {
  factory $SectionEntityCopyWith(SectionEntity value, $Res Function(SectionEntity) _then) = _$SectionEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String subtitle, String categoryId, List<String> deckIds, int sortOrder, bool isFeatured, bool active,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$SectionEntityCopyWithImpl<$Res>
    implements $SectionEntityCopyWith<$Res> {
  _$SectionEntityCopyWithImpl(this._self, this._then);

  final SectionEntity _self;
  final $Res Function(SectionEntity) _then;

/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? categoryId = null,Object? deckIds = null,Object? sortOrder = null,Object? isFeatured = null,Object? active = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,deckIds: null == deckIds ? _self.deckIds : deckIds // ignore: cast_nullable_to_non_nullable
as List<String>,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class SectionEntityData extends SectionEntity {
  const SectionEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, required this.title, required this.subtitle, required this.categoryId, required final  List<String> deckIds, required this.sortOrder, required this.isFeatured, required this.active, @TimestampConverter() this.creationDate, @TimestampConverter() this.lastUpdateDate}): _deckIds = deckIds,super._();
  factory SectionEntityData.fromJson(Map<String, dynamic> json) => _$SectionEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override final  String title;
@override final  String subtitle;
@override final  String categoryId;
 final  List<String> _deckIds;
@override List<String> get deckIds {
  if (_deckIds is EqualUnmodifiableListView) return _deckIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deckIds);
}

@override final  int sortOrder;
@override final  bool isFeatured;
@override final  bool active;
@override@TimestampConverter() final  DateTime? creationDate;
@override@TimestampConverter() final  DateTime? lastUpdateDate;

/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionEntityDataCopyWith<SectionEntityData> get copyWith => _$SectionEntityDataCopyWithImpl<SectionEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._deckIds, _deckIds)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,categoryId,const DeepCollectionEquality().hash(_deckIds),sortOrder,isFeatured,active,creationDate,lastUpdateDate);

@override
String toString() {
  return 'SectionEntity(id: $id, title: $title, subtitle: $subtitle, categoryId: $categoryId, deckIds: $deckIds, sortOrder: $sortOrder, isFeatured: $isFeatured, active: $active, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $SectionEntityDataCopyWith<$Res> implements $SectionEntityCopyWith<$Res> {
  factory $SectionEntityDataCopyWith(SectionEntityData value, $Res Function(SectionEntityData) _then) = _$SectionEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String subtitle, String categoryId, List<String> deckIds, int sortOrder, bool isFeatured, bool active,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$SectionEntityDataCopyWithImpl<$Res>
    implements $SectionEntityDataCopyWith<$Res> {
  _$SectionEntityDataCopyWithImpl(this._self, this._then);

  final SectionEntityData _self;
  final $Res Function(SectionEntityData) _then;

/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? categoryId = null,Object? deckIds = null,Object? sortOrder = null,Object? isFeatured = null,Object? active = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(SectionEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,deckIds: null == deckIds ? _self._deckIds : deckIds // ignore: cast_nullable_to_non_nullable
as List<String>,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
