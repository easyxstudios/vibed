// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneAuthState {

 bool get isLoading; String get phoneNumber; String? get error; bool get linkPhoneToUser;
/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneAuthStateCopyWith<PhoneAuthState> get copyWith => _$PhoneAuthStateCopyWithImpl<PhoneAuthState>(this as PhoneAuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.error, error) || other.error == error)&&(identical(other.linkPhoneToUser, linkPhoneToUser) || other.linkPhoneToUser == linkPhoneToUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,phoneNumber,error,linkPhoneToUser);

@override
String toString() {
  return 'PhoneAuthState(isLoading: $isLoading, phoneNumber: $phoneNumber, error: $error, linkPhoneToUser: $linkPhoneToUser)';
}


}

/// @nodoc
abstract mixin class $PhoneAuthStateCopyWith<$Res>  {
  factory $PhoneAuthStateCopyWith(PhoneAuthState value, $Res Function(PhoneAuthState) _then) = _$PhoneAuthStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String phoneNumber, String? error, bool linkPhoneToUser
});




}
/// @nodoc
class _$PhoneAuthStateCopyWithImpl<$Res>
    implements $PhoneAuthStateCopyWith<$Res> {
  _$PhoneAuthStateCopyWithImpl(this._self, this._then);

  final PhoneAuthState _self;
  final $Res Function(PhoneAuthState) _then;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? phoneNumber = null,Object? error = freezed,Object? linkPhoneToUser = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,linkPhoneToUser: null == linkPhoneToUser ? _self.linkPhoneToUser : linkPhoneToUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class PhoneAuthInputPhoneState implements PhoneAuthState {
  const PhoneAuthInputPhoneState({this.isLoading = false, this.phoneNumber = '', this.error, this.linkPhoneToUser = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String phoneNumber;
@override final  String? error;
@override@JsonKey() final  bool linkPhoneToUser;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneAuthInputPhoneStateCopyWith<PhoneAuthInputPhoneState> get copyWith => _$PhoneAuthInputPhoneStateCopyWithImpl<PhoneAuthInputPhoneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthInputPhoneState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.error, error) || other.error == error)&&(identical(other.linkPhoneToUser, linkPhoneToUser) || other.linkPhoneToUser == linkPhoneToUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,phoneNumber,error,linkPhoneToUser);

@override
String toString() {
  return 'PhoneAuthState.inputPhone(isLoading: $isLoading, phoneNumber: $phoneNumber, error: $error, linkPhoneToUser: $linkPhoneToUser)';
}


}

/// @nodoc
abstract mixin class $PhoneAuthInputPhoneStateCopyWith<$Res> implements $PhoneAuthStateCopyWith<$Res> {
  factory $PhoneAuthInputPhoneStateCopyWith(PhoneAuthInputPhoneState value, $Res Function(PhoneAuthInputPhoneState) _then) = _$PhoneAuthInputPhoneStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String phoneNumber, String? error, bool linkPhoneToUser
});




}
/// @nodoc
class _$PhoneAuthInputPhoneStateCopyWithImpl<$Res>
    implements $PhoneAuthInputPhoneStateCopyWith<$Res> {
  _$PhoneAuthInputPhoneStateCopyWithImpl(this._self, this._then);

  final PhoneAuthInputPhoneState _self;
  final $Res Function(PhoneAuthInputPhoneState) _then;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? phoneNumber = null,Object? error = freezed,Object? linkPhoneToUser = null,}) {
  return _then(PhoneAuthInputPhoneState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,linkPhoneToUser: null == linkPhoneToUser ? _self.linkPhoneToUser : linkPhoneToUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PhoneAuthVerifyOtpState implements PhoneAuthState {
  const PhoneAuthVerifyOtpState({this.isLoading = false, this.phoneNumber = '', this.verificationId = '', this.error, this.linkPhoneToUser = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  String phoneNumber;
@JsonKey() final  String verificationId;
@override final  String? error;
@override@JsonKey() final  bool linkPhoneToUser;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneAuthVerifyOtpStateCopyWith<PhoneAuthVerifyOtpState> get copyWith => _$PhoneAuthVerifyOtpStateCopyWithImpl<PhoneAuthVerifyOtpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneAuthVerifyOtpState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.error, error) || other.error == error)&&(identical(other.linkPhoneToUser, linkPhoneToUser) || other.linkPhoneToUser == linkPhoneToUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,phoneNumber,verificationId,error,linkPhoneToUser);

@override
String toString() {
  return 'PhoneAuthState.verifyOtp(isLoading: $isLoading, phoneNumber: $phoneNumber, verificationId: $verificationId, error: $error, linkPhoneToUser: $linkPhoneToUser)';
}


}

/// @nodoc
abstract mixin class $PhoneAuthVerifyOtpStateCopyWith<$Res> implements $PhoneAuthStateCopyWith<$Res> {
  factory $PhoneAuthVerifyOtpStateCopyWith(PhoneAuthVerifyOtpState value, $Res Function(PhoneAuthVerifyOtpState) _then) = _$PhoneAuthVerifyOtpStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String phoneNumber, String verificationId, String? error, bool linkPhoneToUser
});




}
/// @nodoc
class _$PhoneAuthVerifyOtpStateCopyWithImpl<$Res>
    implements $PhoneAuthVerifyOtpStateCopyWith<$Res> {
  _$PhoneAuthVerifyOtpStateCopyWithImpl(this._self, this._then);

  final PhoneAuthVerifyOtpState _self;
  final $Res Function(PhoneAuthVerifyOtpState) _then;

/// Create a copy of PhoneAuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? phoneNumber = null,Object? verificationId = null,Object? error = freezed,Object? linkPhoneToUser = null,}) {
  return _then(PhoneAuthVerifyOtpState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,linkPhoneToUser: null == linkPhoneToUser ? _self.linkPhoneToUser : linkPhoneToUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
