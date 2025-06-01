// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
NotificationEntity _$NotificationEntityFromJson(
  Map<String, dynamic> json
) {
    return NotificationEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$NotificationEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id; String get title; String get body;@JsonKey(name: "creation_date")@TimestampConverter() DateTime get creationDate;@JsonKey(name: "seen_date")@TimestampConverter() DateTime? get readDate; NotificationTypes? get type; Map<String, dynamic>? get data;
/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationEntityCopyWith<NotificationEntity> get copyWith => _$NotificationEntityCopyWithImpl<NotificationEntity>(this as NotificationEntity, _$identity);

  /// Serializes this NotificationEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.readDate, readDate) || other.readDate == readDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,creationDate,readDate,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'NotificationEntity(id: $id, title: $title, body: $body, creationDate: $creationDate, readDate: $readDate, type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotificationEntityCopyWith<$Res>  {
  factory $NotificationEntityCopyWith(NotificationEntity value, $Res Function(NotificationEntity) _then) = _$NotificationEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String body,@JsonKey(name: "creation_date")@TimestampConverter() DateTime creationDate,@JsonKey(name: "seen_date")@TimestampConverter() DateTime? readDate, NotificationTypes? type, Map<String, dynamic>? data
});




}
/// @nodoc
class _$NotificationEntityCopyWithImpl<$Res>
    implements $NotificationEntityCopyWith<$Res> {
  _$NotificationEntityCopyWithImpl(this._self, this._then);

  final NotificationEntity _self;
  final $Res Function(NotificationEntity) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? body = null,Object? creationDate = null,Object? readDate = freezed,Object? type = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,readDate: freezed == readDate ? _self.readDate : readDate // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationTypes?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class NotificationEntityData extends NotificationEntity {
  const NotificationEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, required this.title, required this.body, @JsonKey(name: "creation_date")@TimestampConverter() required this.creationDate, @JsonKey(name: "seen_date")@TimestampConverter() this.readDate, this.type, final  Map<String, dynamic>? data}): _data = data,super._();
  factory NotificationEntityData.fromJson(Map<String, dynamic> json) => _$NotificationEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override final  String title;
@override final  String body;
@override@JsonKey(name: "creation_date")@TimestampConverter() final  DateTime creationDate;
@override@JsonKey(name: "seen_date")@TimestampConverter() final  DateTime? readDate;
@override final  NotificationTypes? type;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationEntityDataCopyWith<NotificationEntityData> get copyWith => _$NotificationEntityDataCopyWithImpl<NotificationEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.readDate, readDate) || other.readDate == readDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,creationDate,readDate,type,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'NotificationEntity(id: $id, title: $title, body: $body, creationDate: $creationDate, readDate: $readDate, type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotificationEntityDataCopyWith<$Res> implements $NotificationEntityCopyWith<$Res> {
  factory $NotificationEntityDataCopyWith(NotificationEntityData value, $Res Function(NotificationEntityData) _then) = _$NotificationEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String body,@JsonKey(name: "creation_date")@TimestampConverter() DateTime creationDate,@JsonKey(name: "seen_date")@TimestampConverter() DateTime? readDate, NotificationTypes? type, Map<String, dynamic>? data
});




}
/// @nodoc
class _$NotificationEntityDataCopyWithImpl<$Res>
    implements $NotificationEntityDataCopyWith<$Res> {
  _$NotificationEntityDataCopyWithImpl(this._self, this._then);

  final NotificationEntityData _self;
  final $Res Function(NotificationEntityData) _then;

/// Create a copy of NotificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? body = null,Object? creationDate = null,Object? readDate = freezed,Object? type = freezed,Object? data = freezed,}) {
  return _then(NotificationEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,readDate: freezed == readDate ? _self.readDate : readDate // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationTypes?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
