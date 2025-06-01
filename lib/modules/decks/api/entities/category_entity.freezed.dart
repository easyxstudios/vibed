// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CategoryEntity _$CategoryEntityFromJson(
  Map<String, dynamic> json
) {
    return CategoryEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$CategoryEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id; String get key;// 'dating', 'party', 'adult'
 Map<String, String> get name;// {'tr': 'Tanışma', 'en': 'Dating'}
 Map<String, String> get description; String get color;// Hex color
 String get icon;// Icon name or URL
 int get sortOrder; bool get active;@TimestampConverter() DateTime? get creationDate;@TimestampConverter() DateTime? get lastUpdateDate;
/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEntityCopyWith<CategoryEntity> get copyWith => _$CategoryEntityCopyWithImpl<CategoryEntity>(this as CategoryEntity, _$identity);

  /// Serializes this CategoryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.name, name)&&const DeepCollectionEquality().equals(other.description, description)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,const DeepCollectionEquality().hash(name),const DeepCollectionEquality().hash(description),color,icon,sortOrder,active,creationDate,lastUpdateDate);

@override
String toString() {
  return 'CategoryEntity(id: $id, key: $key, name: $name, description: $description, color: $color, icon: $icon, sortOrder: $sortOrder, active: $active, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $CategoryEntityCopyWith<$Res>  {
  factory $CategoryEntityCopyWith(CategoryEntity value, $Res Function(CategoryEntity) _then) = _$CategoryEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String key, Map<String, String> name, Map<String, String> description, String color, String icon, int sortOrder, bool active,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._self, this._then);

  final CategoryEntity _self;
  final $Res Function(CategoryEntity) _then;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? key = null,Object? name = null,Object? description = null,Object? color = null,Object? icon = null,Object? sortOrder = null,Object? active = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class CategoryEntityData extends CategoryEntity {
  const CategoryEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, required this.key, required final  Map<String, String> name, required final  Map<String, String> description, required this.color, required this.icon, required this.sortOrder, required this.active, @TimestampConverter() this.creationDate, @TimestampConverter() this.lastUpdateDate}): _name = name,_description = description,super._();
  factory CategoryEntityData.fromJson(Map<String, dynamic> json) => _$CategoryEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override final  String key;
// 'dating', 'party', 'adult'
 final  Map<String, String> _name;
// 'dating', 'party', 'adult'
@override Map<String, String> get name {
  if (_name is EqualUnmodifiableMapView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_name);
}

// {'tr': 'Tanışma', 'en': 'Dating'}
 final  Map<String, String> _description;
// {'tr': 'Tanışma', 'en': 'Dating'}
@override Map<String, String> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

@override final  String color;
// Hex color
@override final  String icon;
// Icon name or URL
@override final  int sortOrder;
@override final  bool active;
@override@TimestampConverter() final  DateTime? creationDate;
@override@TimestampConverter() final  DateTime? lastUpdateDate;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEntityDataCopyWith<CategoryEntityData> get copyWith => _$CategoryEntityDataCopyWithImpl<CategoryEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other._name, _name)&&const DeepCollectionEquality().equals(other._description, _description)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,const DeepCollectionEquality().hash(_name),const DeepCollectionEquality().hash(_description),color,icon,sortOrder,active,creationDate,lastUpdateDate);

@override
String toString() {
  return 'CategoryEntity(id: $id, key: $key, name: $name, description: $description, color: $color, icon: $icon, sortOrder: $sortOrder, active: $active, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $CategoryEntityDataCopyWith<$Res> implements $CategoryEntityCopyWith<$Res> {
  factory $CategoryEntityDataCopyWith(CategoryEntityData value, $Res Function(CategoryEntityData) _then) = _$CategoryEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String key, Map<String, String> name, Map<String, String> description, String color, String icon, int sortOrder, bool active,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$CategoryEntityDataCopyWithImpl<$Res>
    implements $CategoryEntityDataCopyWith<$Res> {
  _$CategoryEntityDataCopyWithImpl(this._self, this._then);

  final CategoryEntityData _self;
  final $Res Function(CategoryEntityData) _then;

/// Create a copy of CategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? key = null,Object? name = null,Object? description = null,Object? color = null,Object? icon = null,Object? sortOrder = null,Object? active = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(CategoryEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as Map<String, String>,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, String>,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
