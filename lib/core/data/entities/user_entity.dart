// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    @JsonKey(name: 'creation_date')
    @TimestampConverter()
    DateTime? creationDate,
    @JsonKey(name: 'last_update_date')
    @TimestampConverter()
    DateTime? lastUpdateDate,
    String? name,
    String? email,
    String? avatarPath,
    bool? onboarded,
  }) = UserEntityData;

  const UserEntity._();

  factory UserEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$UserEntityFromJson(json..['id'] = id);
}

class Credentials {
  // this is the user id
  final String id;
  final String? token;

  Credentials({
    required this.id,
    required this.token,
  });

  factory Credentials.fromJson(Map<String, Object?> json) {
    if (!json.containsKey('id') || !json.containsKey('token')) {
      throw Exception('Invalid credentials');
    }
    return Credentials(
      id: json['id']! as String,
      token: json['token']! as String,
    );
  }
}
