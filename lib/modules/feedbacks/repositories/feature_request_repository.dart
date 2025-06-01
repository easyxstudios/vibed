import 'package:vibed/i18n/translations.g.dart';
import 'package:vibed/modules/feedbacks/api/entities/user_feature_request_entity.dart';
import 'package:vibed/modules/feedbacks/api/feature_request_api.dart';
import 'package:vibed/modules/feedbacks/api/feature_vote_api.dart';
import 'package:vibed/modules/feedbacks/api/user_feature_request_api.dart';
import 'package:vibed/modules/feedbacks/models/feature_requests.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final featureRequestRepositoryProvider = Provider<FeatureRequestRepository>(
  (ref) => FeatureRequestRepository(
    featureVoteApi: ref.read(featureVoteApiProvider),
    featureRequestApi: ref.read(featureRequestApiProvider),
    userFeatureRequestApi: ref.read(userFeatureRequestApiProvider),
    logger: Logger(),
  ),
);

class FeatureRequestRepository {
  final FeatureVoteApi _featureVoteApi;
  final FeatureRequestApi _featureRequestApi;
  final UserFeatureRequestApi _userFeatureRequestApi;
  final Logger _logger;

  FeatureRequestRepository({
    required FeatureVoteApi featureVoteApi,
    required FeatureRequestApi featureRequestApi,
    required UserFeatureRequestApi userFeatureRequestApi,
    required Logger logger,
  })  : _featureVoteApi = featureVoteApi,
        _logger = logger,
        _featureRequestApi = featureRequestApi,
        _userFeatureRequestApi = userFeatureRequestApi;

  /// Returns the list of feature that are currently being voted on.
  Future<List<FeatureRequest>> getActiveFeatureRequests() async {
    try {
      final featureRequestsEntities = await _featureRequestApi.getAllActive();
      final currentLocale = LocaleSettings.currentLocale;
      return featureRequestsEntities
          .map(
            (entity) => FeatureRequest.from(entity, currentLocale.languageCode),
          )
          .toList();
    } catch (e, s) {
      _logger.e('Error while fetching active feature requests: $e : $s');
      rethrow;
    }
  }

  Future<List<FeatureRequestVote>> getUserVotes(String userId) async {
    try {
      final uservotes = await _featureVoteApi.getUserVotes(userId);
      return uservotes.map((e) => FeatureRequestVote.from(e)).toList();
    } catch (e, s) {
      _logger.e('Error while fetching user votes: $e : $s');
      rethrow;
    }
  }

  Future<FeatureRequestVote> vote(
    String userId,
    FeatureRequest featureRequest,
  ) async {
    try {
      // final uservotes = await _featureVoteApi.getUserVotes(userId);
      // if (uservotes.isNotEmpty) {
      //   throw UserAlreadyVotedException();
      // }
      final result = await _featureVoteApi.create(
        userId,
        featureRequest.id,
      );
      return FeatureRequestVote.from(result);
    } catch (e, s) {
      _logger.e('Error while voting for feature request: $e : $s');
      rethrow;
    }
  }

  Future<void> removeVote(String userId, FeatureRequestVote vote) async {
    try {
      await _featureVoteApi.delete(vote.featureId, vote.id);
    } catch (e, s) {
      _logger.e('Error while deleting vote for feature request: $e : $s');
      rethrow;
    }
  }

  Future<void> createNewFeatureSuggestion({
    required String userId,
    required String title,
    required String description,
  }) async {
    await _userFeatureRequestApi.create(
      UserFeatureRequestEntity(
        userId: userId,
        title: title,
        description: description,
        creationDate: DateTime.now(),
      ),
    );
  }
}

class UserAlreadyVotedException implements Exception {
  final String? message;

  UserAlreadyVotedException({this.message});
}
