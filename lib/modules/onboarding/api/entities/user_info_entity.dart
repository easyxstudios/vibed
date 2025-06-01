// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';
part 'user_info_entity.g.dart';


@freezed
sealed class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    required String key,
    required String value,
  }) = UserInfoEntityData;

  factory UserInfoEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$UserInfoEntityFromJson(json..['id'] = id);
}



