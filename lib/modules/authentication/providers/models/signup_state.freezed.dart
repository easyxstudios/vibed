// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {

 Email get email; Password get password;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 Email email, Password password
});




}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
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


class SignupStateData extends SignupState {
  const SignupStateData({required this.email, required this.password}): super._();
  

@override final  Email email;
@override final  Password password;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateDataCopyWith<SignupStateData> get copyWith => _$SignupStateDataCopyWithImpl<SignupStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStateData&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupState(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupStateDataCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupStateDataCopyWith(SignupStateData value, $Res Function(SignupStateData) _then) = _$SignupStateDataCopyWithImpl;
@override @useResult
$Res call({
 Email email, Password password
});




}
/// @nodoc
class _$SignupStateDataCopyWithImpl<$Res>
    implements $SignupStateDataCopyWith<$Res> {
  _$SignupStateDataCopyWithImpl(this._self, this._then);

  final SignupStateData _self;
  final $Res Function(SignupStateData) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignupStateData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}


}

/// @nodoc


class SignupStateSending extends SignupState {
  const SignupStateSending({required this.email, required this.password}): super._();
  

@override final  Email email;
@override final  Password password;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateSendingCopyWith<SignupStateSending> get copyWith => _$SignupStateSendingCopyWithImpl<SignupStateSending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStateSending&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'SignupState.sending(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupStateSendingCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupStateSendingCopyWith(SignupStateSending value, $Res Function(SignupStateSending) _then) = _$SignupStateSendingCopyWithImpl;
@override @useResult
$Res call({
 Email email, Password password
});




}
/// @nodoc
class _$SignupStateSendingCopyWithImpl<$Res>
    implements $SignupStateSendingCopyWith<$Res> {
  _$SignupStateSendingCopyWithImpl(this._self, this._then);

  final SignupStateSending _self;
  final $Res Function(SignupStateSending) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignupStateSending(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}


}

// dart format on
