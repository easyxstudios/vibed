// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Device {

 String? get id; String get installationId; String get token; OperatingSystem get platform; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCopyWith<Device> get copyWith => _$DeviceCopyWithImpl<Device>(this as Device, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Device&&(identical(other.id, id) || other.id == id)&&(identical(other.installationId, installationId) || other.installationId == installationId)&&(identical(other.token, token) || other.token == token)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,installationId,token,platform,createdAt,updatedAt);

@override
String toString() {
  return 'Device(id: $id, installationId: $installationId, token: $token, platform: $platform, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DeviceCopyWith<$Res>  {
  factory $DeviceCopyWith(Device value, $Res Function(Device) _then) = _$DeviceCopyWithImpl;
@useResult
$Res call({
 String? id, String installationId, String token, OperatingSystem platform, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$DeviceCopyWithImpl<$Res>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._self, this._then);

  final Device _self;
  final $Res Function(Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? installationId = null,Object? token = null,Object? platform = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,installationId: null == installationId ? _self.installationId : installationId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as OperatingSystem,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _DeviceData implements Device {
  const _DeviceData({this.id, required this.installationId, required this.token, required this.platform, required this.createdAt, required this.updatedAt});
  

@override final  String? id;
@override final  String installationId;
@override final  String token;
@override final  OperatingSystem platform;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceDataCopyWith<_DeviceData> get copyWith => __$DeviceDataCopyWithImpl<_DeviceData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceData&&(identical(other.id, id) || other.id == id)&&(identical(other.installationId, installationId) || other.installationId == installationId)&&(identical(other.token, token) || other.token == token)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,installationId,token,platform,createdAt,updatedAt);

@override
String toString() {
  return 'Device(id: $id, installationId: $installationId, token: $token, platform: $platform, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceDataCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$DeviceDataCopyWith(_DeviceData value, $Res Function(_DeviceData) _then) = __$DeviceDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, String installationId, String token, OperatingSystem platform, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$DeviceDataCopyWithImpl<$Res>
    implements _$DeviceDataCopyWith<$Res> {
  __$DeviceDataCopyWithImpl(this._self, this._then);

  final _DeviceData _self;
  final $Res Function(_DeviceData) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? installationId = null,Object? token = null,Object? platform = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DeviceData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,installationId: null == installationId ? _self.installationId : installationId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as OperatingSystem,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
