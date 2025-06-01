// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
CardEntity _$CardEntityFromJson(
  Map<String, dynamic> json
) {
    return CardEntityData.fromJson(
      json
    );
}

/// @nodoc
mixin _$CardEntity {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id; String get title; String get content; String get categoryId; int get difficultyLevel;// 1-3
 List<String> get tags; bool get isPremium;@TimestampConverter() DateTime? get creationDate;@TimestampConverter() DateTime? get lastUpdateDate;
/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardEntityCopyWith<CardEntity> get copyWith => _$CardEntityCopyWithImpl<CardEntity>(this as CardEntity, _$identity);

  /// Serializes this CardEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.difficultyLevel, difficultyLevel) || other.difficultyLevel == difficultyLevel)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,categoryId,difficultyLevel,const DeepCollectionEquality().hash(tags),isPremium,creationDate,lastUpdateDate);

@override
String toString() {
  return 'CardEntity(id: $id, title: $title, content: $content, categoryId: $categoryId, difficultyLevel: $difficultyLevel, tags: $tags, isPremium: $isPremium, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $CardEntityCopyWith<$Res>  {
  factory $CardEntityCopyWith(CardEntity value, $Res Function(CardEntity) _then) = _$CardEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String content, String categoryId, int difficultyLevel, List<String> tags, bool isPremium,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$CardEntityCopyWithImpl<$Res>
    implements $CardEntityCopyWith<$Res> {
  _$CardEntityCopyWithImpl(this._self, this._then);

  final CardEntity _self;
  final $Res Function(CardEntity) _then;

/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? content = null,Object? categoryId = null,Object? difficultyLevel = null,Object? tags = null,Object? isPremium = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,difficultyLevel: null == difficultyLevel ? _self.difficultyLevel : difficultyLevel // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class CardEntityData extends CardEntity {
  const CardEntityData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, required this.title, required this.content, required this.categoryId, required this.difficultyLevel, required final  List<String> tags, required this.isPremium, @TimestampConverter() this.creationDate, @TimestampConverter() this.lastUpdateDate}): _tags = tags,super._();
  factory CardEntityData.fromJson(Map<String, dynamic> json) => _$CardEntityDataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override final  String title;
@override final  String content;
@override final  String categoryId;
@override final  int difficultyLevel;
// 1-3
 final  List<String> _tags;
// 1-3
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  bool isPremium;
@override@TimestampConverter() final  DateTime? creationDate;
@override@TimestampConverter() final  DateTime? lastUpdateDate;

/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardEntityDataCopyWith<CardEntityData> get copyWith => _$CardEntityDataCopyWithImpl<CardEntityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardEntityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardEntityData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.difficultyLevel, difficultyLevel) || other.difficultyLevel == difficultyLevel)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,categoryId,difficultyLevel,const DeepCollectionEquality().hash(_tags),isPremium,creationDate,lastUpdateDate);

@override
String toString() {
  return 'CardEntity(id: $id, title: $title, content: $content, categoryId: $categoryId, difficultyLevel: $difficultyLevel, tags: $tags, isPremium: $isPremium, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $CardEntityDataCopyWith<$Res> implements $CardEntityCopyWith<$Res> {
  factory $CardEntityDataCopyWith(CardEntityData value, $Res Function(CardEntityData) _then) = _$CardEntityDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id, String title, String content, String categoryId, int difficultyLevel, List<String> tags, bool isPremium,@TimestampConverter() DateTime? creationDate,@TimestampConverter() DateTime? lastUpdateDate
});




}
/// @nodoc
class _$CardEntityDataCopyWithImpl<$Res>
    implements $CardEntityDataCopyWith<$Res> {
  _$CardEntityDataCopyWithImpl(this._self, this._then);

  final CardEntityData _self;
  final $Res Function(CardEntityData) _then;

/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? content = null,Object? categoryId = null,Object? difficultyLevel = null,Object? tags = null,Object? isPremium = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(CardEntityData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,difficultyLevel: null == difficultyLevel ? _self.difficultyLevel : difficultyLevel // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
