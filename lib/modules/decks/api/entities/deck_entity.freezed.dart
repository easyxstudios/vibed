// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DeckEntity _$DeckEntityFromJson(
  Map<String, dynamic> json
) {
    return DeckEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$DeckEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id; String get title; String get subtitle; String get imageUrl; int get fireCount; bool get isLocked; String get unlockText; String get categoryId; List<String> get cardIds; DeckCategory get category; bool get isPremium; int get sortOrder; bool get active;@TimestampConverter() DateTime? get creationDate;@TimestampConverter() DateTime? get lastUpdateDate;
/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckEntityCopyWith<DeckEntity> get copyWith => _$DeckEntityCopyWithImpl<DeckEntity>(this as DeckEntity, _$identity);

  /// Serializes this DeckEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fireCount, fireCount) || other.fireCount == fireCount)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.unlockText, unlockText) || other.unlockText == unlockText)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.cardIds, cardIds)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,imageUrl,fireCount,isLocked,unlockText,categoryId,const DeepCollectionEquality().hash(cardIds),category,isPremium,sortOrder,active,creationDate,lastUpdateDate);

@override
String toString() {
  return 'DeckEntity(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, fireCount: $fireCount, isLocked: $isLocked, unlockText: $unlockText, categoryId: $categoryId, cardIds: $cardIds, category: $category, isPremium: $isPremium, sortOrder: $sortOrder, active: $active, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $DeckEntityCopyWith<$Res>  {
  factory $DeckEntityCopyWith(DeckEntity value, $Res Function(DeckEntity) _then) = _$DeckEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String subtitle, String imageUrl, int fireCount, bool isLocked, String unlockText, String categoryId, List<String> cardIds, DeckCategory category, bool isPremium, int sortOrder, bool active,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$DeckEntityCopyWithImpl<$Res>
    implements $DeckEntityCopyWith<$Res> {
  _$DeckEntityCopyWithImpl(this._self, this._then);

  final DeckEntity _self;
  final $Res Function(DeckEntity) _then;

/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? fireCount = null,Object? isLocked = null,Object? unlockText = null,Object? categoryId = null,Object? cardIds = null,Object? category = null,Object? isPremium = null,Object? sortOrder = null,Object? active = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,fireCount: null == fireCount ? _self.fireCount : fireCount // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,unlockText: null == unlockText ? _self.unlockText : unlockText // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,cardIds: null == cardIds ? _self.cardIds : cardIds // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DeckCategory,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class DeckEntityData extends DeckEntity {
  const DeckEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, required this.title, required this.subtitle, required this.imageUrl, required this.fireCount, required this.isLocked, required this.unlockText, required this.categoryId, required final  List<String> cardIds, required this.category, required this.isPremium, required this.sortOrder, required this.active, @TimestampConverter() this.creationDate, @TimestampConverter() this.lastUpdateDate}): _cardIds = cardIds,super._();
  factory DeckEntityData.fromJson(Map<String, dynamic> json) => _$DeckEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override final  String title;
@override final  String subtitle;
@override final  String imageUrl;
@override final  int fireCount;
@override final  bool isLocked;
@override final  String unlockText;
@override final  String categoryId;
 final  List<String> _cardIds;
@override List<String> get cardIds {
  if (_cardIds is EqualUnmodifiableListView) return _cardIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cardIds);
}

@override final  DeckCategory category;
@override final  bool isPremium;
@override final  int sortOrder;
@override final  bool active;
@override@TimestampConverter() final  DateTime? creationDate;
@override@TimestampConverter() final  DateTime? lastUpdateDate;

/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckEntityDataCopyWith<DeckEntityData> get copyWith => _$DeckEntityDataCopyWithImpl<DeckEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeckEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.fireCount, fireCount) || other.fireCount == fireCount)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.unlockText, unlockText) || other.unlockText == unlockText)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._cardIds, _cardIds)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,imageUrl,fireCount,isLocked,unlockText,categoryId,const DeepCollectionEquality().hash(_cardIds),category,isPremium,sortOrder,active,creationDate,lastUpdateDate);

@override
String toString() {
  return 'DeckEntity(id: $id, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, fireCount: $fireCount, isLocked: $isLocked, unlockText: $unlockText, categoryId: $categoryId, cardIds: $cardIds, category: $category, isPremium: $isPremium, sortOrder: $sortOrder, active: $active, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $DeckEntityDataCopyWith<$Res> implements $DeckEntityCopyWith<$Res> {
  factory $DeckEntityDataCopyWith(DeckEntityData value, $Res Function(DeckEntityData) _then) = _$DeckEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String subtitle, String imageUrl, int fireCount, bool isLocked, String unlockText, String categoryId, List<String> cardIds, DeckCategory category, bool isPremium, int sortOrder, bool active,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$DeckEntityDataCopyWithImpl<$Res>
    implements $DeckEntityDataCopyWith<$Res> {
  _$DeckEntityDataCopyWithImpl(this._self, this._then);

  final DeckEntityData _self;
  final $Res Function(DeckEntityData) _then;

/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? subtitle = null,Object? imageUrl = null,Object? fireCount = null,Object? isLocked = null,Object? unlockText = null,Object? categoryId = null,Object? cardIds = null,Object? category = null,Object? isPremium = null,Object? sortOrder = null,Object? active = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(DeckEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,fireCount: null == fireCount ? _self.fireCount : fireCount // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,unlockText: null == unlockText ? _self.unlockText : unlockText // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,cardIds: null == cardIds ? _self._cardIds : cardIds // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DeckCategory,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
