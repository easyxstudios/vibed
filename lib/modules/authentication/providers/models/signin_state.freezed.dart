// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SigninState {

 Email get email; Password get password;
/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninStateCopyWith<SigninState> get copyWith => _$SigninStateCopyWithImpl<SigninState>(this as SigninState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SigninState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SigninStateCopyWith<$Res>  {
  factory $SigninStateCopyWith(SigninState value, $Res Function(SigninState) _then) = _$SigninStateCopyWithImpl;
@useResult
$Res call({
 Email email, Password password
});




}
/// @nodoc
class _$SigninStateCopyWithImpl<$Res>
    implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._self, this._then);

  final SigninState _self;
  final $Res Function(SigninState) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}

}


/// @nodoc


class SigninStateData extends SigninState {
  const SigninStateData({required this.email, required this.password}): super._();
  

@override final  Email email;
@override final  Password password;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninStateDataCopyWith<SigninStateData> get copyWith => _$SigninStateDataCopyWithImpl<SigninStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninStateData&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SigninState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SigninStateDataCopyWith<$Res> implements $SigninStateCopyWith<$Res> {
  factory $SigninStateDataCopyWith(SigninStateData value, $Res Function(SigninStateData) _then) = _$SigninStateDataCopyWithImpl;
@override @useResult
$Res call({
 Email email, Password password
});




}
/// @nodoc
class _$SigninStateDataCopyWithImpl<$Res>
    implements $SigninStateDataCopyWith<$Res> {
  _$SigninStateDataCopyWithImpl(this._self, this._then);

  final SigninStateData _self;
  final $Res Function(SigninStateData) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SigninStateData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}


}

/// @nodoc


class SigninStateSending extends SigninState {
  const SigninStateSending({required this.email, required this.password}): super._();
  

@override final  Email email;
@override final  Password password;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninStateSendingCopyWith<SigninStateSending> get copyWith => _$SigninStateSendingCopyWithImpl<SigninStateSending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninStateSending&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SigninState.sending(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SigninStateSendingCopyWith<$Res> implements $SigninStateCopyWith<$Res> {
  factory $SigninStateSendingCopyWith(SigninStateSending value, $Res Function(SigninStateSending) _then) = _$SigninStateSendingCopyWithImpl;
@override @useResult
$Res call({
 Email email, Password password
});




}
/// @nodoc
class _$SigninStateSendingCopyWithImpl<$Res>
    implements $SigninStateSendingCopyWith<$Res> {
  _$SigninStateSendingCopyWithImpl(this._self, this._then);

  final SigninStateSending _self;
  final $Res Function(SigninStateSending) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SigninStateSending(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}


}

// dart format on
