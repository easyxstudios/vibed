// ignore_for_file: avoid_classes_with_only_static_members

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Converters {
  static String? id(String? id) => null;
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class TimestampListConverter
    implements JsonConverter<List<DateTime>, List<dynamic>> {
  const TimestampListConverter();

  @override
  List<DateTime> fromJson(List<dynamic> timestamps) {
    return timestamps
        .map((timestamp) => (timestamp as Timestamp).toDate())
        .toList();
  }

  @override
  List<dynamic> toJson(List<DateTime> dates) =>
      dates.map((date) => Timestamp.fromDate(date)).toList();
}
