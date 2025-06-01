import 'package:vibed/modules/feedbacks/api/entities/feature_request_entity.dart';
import 'package:vibed/modules/feedbacks/api/entities/feature_vote_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_requests.freezed.dart';

@freezed
abstract class FeatureRequest with _$FeatureRequest {
  const factory FeatureRequest({
    required String id,
    required DateTime creationDate,
    required String title,
    required String description,
    required int votes,
  }) = FeatureRequestData;

  const FeatureRequest._();

  factory FeatureRequest.from(FeatureRequestEntity entity, String language) {
    return FeatureRequest(
      id: entity.id!,
      creationDate: entity.creationDate,
      title: entity.title.containsKey(language)
          ? entity.title[language]!
          : entity.title['en']!,
      description: entity.description.containsKey(language)
          ? entity.description[language]!
          : entity.description['en']!,
      votes: entity.votes,
    );
  }
}

@freezed
abstract class FeatureRequestVote with _$FeatureRequestVote {
  const factory FeatureRequestVote({
    required String id,
    required String featureId,
  }) = FeatureRequestVoteData;

  const FeatureRequestVote._();

  factory FeatureRequestVote.from(UserFeatureVoteEntity entity) =>
      FeatureRequestVote(
        id: entity.id!,
        featureId: entity.featureId,
      );
}
