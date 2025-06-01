// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdState {

 DateTime? get lastAdShown;
/// Create a copy of AdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdStateCopyWith<AdState> get copyWith => _$AdStateCopyWithImpl<AdState>(this as AdState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdState&&(identical(other.lastAdShown, lastAdShown) || other.lastAdShown == lastAdShown));
}


@override
int get hashCode => Object.hash(runtimeType,lastAdShown);

@override
String toString() {
  return 'AdState(lastAdShown: $lastAdShown)';
}


}

/// @nodoc
abstract mixin class $AdStateCopyWith<$Res>  {
  factory $AdStateCopyWith(AdState value, $Res Function(AdState) _then) = _$AdStateCopyWithImpl;
@useResult
$Res call({
 DateTime? lastAdShown
});




}
/// @nodoc
class _$AdStateCopyWithImpl<$Res>
    implements $AdStateCopyWith<$Res> {
  _$AdStateCopyWithImpl(this._self, this._then);

  final AdState _self;
  final $Res Function(AdState) _then;

/// Create a copy of AdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastAdShown = freezed,}) {
  return _then(_self.copyWith(
lastAdShown: freezed == lastAdShown ? _self.lastAdShown : lastAdShown // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _AdState extends AdState {
  const _AdState({this.lastAdShown}): super._();
  

@override final  DateTime? lastAdShown;

/// Create a copy of AdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdStateCopyWith<_AdState> get copyWith => __$AdStateCopyWithImpl<_AdState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdState&&(identical(other.lastAdShown, lastAdShown) || other.lastAdShown == lastAdShown));
}


@override
int get hashCode => Object.hash(runtimeType,lastAdShown);

@override
String toString() {
  return 'AdState(lastAdShown: $lastAdShown)';
}


}

/// @nodoc
abstract mixin class _$AdStateCopyWith<$Res> implements $AdStateCopyWith<$Res> {
  factory _$AdStateCopyWith(_AdState value, $Res Function(_AdState) _then) = __$AdStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? lastAdShown
});




}
/// @nodoc
class __$AdStateCopyWithImpl<$Res>
    implements _$AdStateCopyWith<$Res> {
  __$AdStateCopyWithImpl(this._self, this._then);

  final _AdState _self;
  final $Res Function(_AdState) _then;

/// Create a copy of AdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastAdShown = freezed,}) {
  return _then(_AdState(
lastAdShown: freezed == lastAdShown ? _self.lastAdShown : lastAdShown // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
