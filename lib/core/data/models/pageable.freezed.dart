// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pageable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pageable<T> {

 int get page; int get pageSize; List<T> get data;
/// Create a copy of Pageable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageableCopyWith<T, Pageable<T>> get copyWith => _$PageableCopyWithImpl<T, Pageable<T>>(this as Pageable<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pageable<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Pageable<$T>(page: $page, pageSize: $pageSize, data: $data)';
}


}

/// @nodoc
abstract mixin class $PageableCopyWith<T,$Res>  {
  factory $PageableCopyWith(Pageable<T> value, $Res Function(Pageable<T>) _then) = _$PageableCopyWithImpl;
@useResult
$Res call({
 int page, int pageSize, List<T> data
});




}
/// @nodoc
class _$PageableCopyWithImpl<T,$Res>
    implements $PageableCopyWith<T, $Res> {
  _$PageableCopyWithImpl(this._self, this._then);

  final Pageable<T> _self;
  final $Res Function(Pageable<T>) _then;

/// Create a copy of Pageable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,Object? data = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// @nodoc


class _Pageable<T> implements Pageable<T> {
  const _Pageable({required this.page, required this.pageSize, required final  List<T> data}): _data = data;
  

@override final  int page;
@override final  int pageSize;
 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of Pageable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageableCopyWith<T, _Pageable<T>> get copyWith => __$PageableCopyWithImpl<T, _Pageable<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pageable<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,page,pageSize,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'Pageable<$T>(page: $page, pageSize: $pageSize, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PageableCopyWith<T,$Res> implements $PageableCopyWith<T, $Res> {
  factory _$PageableCopyWith(_Pageable<T> value, $Res Function(_Pageable<T>) _then) = __$PageableCopyWithImpl;
@override @useResult
$Res call({
 int page, int pageSize, List<T> data
});




}
/// @nodoc
class __$PageableCopyWithImpl<T,$Res>
    implements _$PageableCopyWith<T, $Res> {
  __$PageableCopyWithImpl(this._self, this._then);

  final _Pageable<T> _self;
  final $Res Function(_Pageable<T>) _then;

/// Create a copy of Pageable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,Object? data = null,}) {
  return _then(_Pageable<T>(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on
