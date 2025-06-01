// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppRunState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppRunState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRunState()';
}


}

/// @nodoc
class $AppRunStateCopyWith<$Res>  {
$AppRunStateCopyWith(AppRunState _, $Res Function(AppRunState) __);
}


/// @nodoc


class AppLoadingState extends AppRunState {
  const AppLoadingState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRunState.loading()';
}


}




/// @nodoc


class AppReadyState extends AppRunState {
  const AppReadyState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppReadyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRunState.ready()';
}


}




/// @nodoc


class AppErrorState extends AppRunState {
  const AppErrorState(this.error): super._();
  

 final  String error;

/// Create a copy of AppRunState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorStateCopyWith<AppErrorState> get copyWith => _$AppErrorStateCopyWithImpl<AppErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppRunState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AppErrorStateCopyWith<$Res> implements $AppRunStateCopyWith<$Res> {
  factory $AppErrorStateCopyWith(AppErrorState value, $Res Function(AppErrorState) _then) = _$AppErrorStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AppErrorStateCopyWithImpl<$Res>
    implements $AppErrorStateCopyWith<$Res> {
  _$AppErrorStateCopyWithImpl(this._self, this._then);

  final AppErrorState _self;
  final $Res Function(AppErrorState) _then;

/// Create a copy of AppRunState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AppErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
