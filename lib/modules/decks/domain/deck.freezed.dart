// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Deck {

 String get id; String get title; String get subtitle; String get imageUrl; int get fireCount; bool get isLocked; String get unlockText; DeckCategory get category; DateTime? get creationDate; DateTime? get lastUpdateDate;
/// Create a copy of Deck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckCopyWith<Deck> get copyWith => _$DeckCopyWithImpl<Deck>(this as Deck, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Deck&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fireCount, fireCount) || other.fireCount == fireCount)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.unlockText, unlockText) || other.unlockText == unlockText)&&(identical(other.category, category) || other.category == category)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,imageUrl,fireCount,isLocked,unlockText,category,creationDate,lastUpdateDate);

@override
String toString() {
  return 'Deck(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, fireCount: $fireCount, isLocked: $isLocked, unlockText: $unlockText, category: $category, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $DeckCopyWith<$Res>  {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) _then) = _$DeckCopyWithImpl;
@useResult
$Res call({
 String id, String title, String subtitle, String imageUrl, int fireCount, bool isLocked, String unlockText, DeckCategory category, DateTime? creationDate, DateTime? lastUpdateDate
});




}
/// @nodoc
class _$DeckCopyWithImpl<$Res>
    implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._self, this._then);

  final Deck _self;
  final $Res Function(Deck) _then;

/// Create a copy of Deck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? fireCount = null,Object? isLocked = null,Object? unlockText = null,Object? category = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,fireCount: null == fireCount ? _self.fireCount : fireCount // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,unlockText: null == unlockText ? _self.unlockText : unlockText // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DeckCategory,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class DeckData extends Deck {
  const DeckData({required this.id, required this.title, required this.subtitle, required this.imageUrl, required this.fireCount, required this.isLocked, required this.unlockText, required this.category, this.creationDate, this.lastUpdateDate}): super._();
  

@override final  String id;
@override final  String title;
@override final  String subtitle;
@override final  String imageUrl;
@override final  int fireCount;
@override final  bool isLocked;
@override final  String unlockText;
@override final  DeckCategory category;
@override final  DateTime? creationDate;
@override final  DateTime? lastUpdateDate;

/// Create a copy of Deck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckDataCopyWith<DeckData> get copyWith => _$DeckDataCopyWithImpl<DeckData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fireCount, fireCount) || other.fireCount == fireCount)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.unlockText, unlockText) || other.unlockText == unlockText)&&(identical(other.category, category) || other.category == category)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,imageUrl,fireCount,isLocked,unlockText,category,creationDate,lastUpdateDate);

@override
String toString() {
  return 'Deck(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, fireCount: $fireCount, isLocked: $isLocked, unlockText: $unlockText, category: $category, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $DeckDataCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory $DeckDataCopyWith(DeckData value, $Res Function(DeckData) _then) = _$DeckDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String subtitle, String imageUrl, int fireCount, bool isLocked, String unlockText, DeckCategory category, DateTime? creationDate, DateTime? lastUpdateDate
});




}
/// @nodoc
class _$DeckDataCopyWithImpl<$Res>
    implements $DeckDataCopyWith<$Res> {
  _$DeckDataCopyWithImpl(this._self, this._then);

  final DeckData _self;
  final $Res Function(DeckData) _then;

/// Create a copy of Deck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? fireCount = null,Object? isLocked = null,Object? unlockText = null,Object? category = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(DeckData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,fireCount: null == fireCount ? _self.fireCount : fireCount // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,unlockText: null == unlockText ? _self.unlockText : unlockText // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DeckCategory,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
