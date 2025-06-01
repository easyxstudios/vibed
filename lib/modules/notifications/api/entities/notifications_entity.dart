// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_entity.freezed.dart';
part 'notifications_entity.g.dart';

// ignore: constant_identifier_names
enum NotificationTypes { WELCOME, OTHER, LINK }

@freezed
sealed class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    required String title,
    required String body,
    @JsonKey(name: "creation_date")
    @TimestampConverter()
    required DateTime creationDate,
    @JsonKey(name: "seen_date") @TimestampConverter() DateTime? readDate,
    NotificationTypes? type,
    Map<String, dynamic>? data,
  }) = NotificationEntityData;

  const NotificationEntity._();

  factory NotificationEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json..['id'] = id);

  // Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}
