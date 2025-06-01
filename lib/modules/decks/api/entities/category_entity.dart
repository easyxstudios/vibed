// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';
part 'category_entity.g.dart';

@freezed
sealed class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    required String key, // 'dating', 'party', 'adult'
    required Map<String, String> name, // {'tr': 'Tanışma', 'en': 'Dating'}
    required Map<String, String> description,
    required String color, // Hex color
    required String icon, // Icon name or URL
    required int sortOrder,
    required bool active,
    @TimestampConverter() DateTime? creationDate,
    @TimestampConverter() DateTime? lastUpdateDate,
  }) = CategoryEntityData;

  const CategoryEntity._();

  factory CategoryEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json..['id'] = id);
}
