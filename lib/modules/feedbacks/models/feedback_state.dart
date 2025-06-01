import 'package:vibed/modules/feedbacks/models/feature_requests.dart';

class FeebackPageState {
  List<FeatureRequestVote> userVotes;
  List<FeatureRequest> featureRequests;

  FeebackPageState({
    required this.featureRequests,
    required this.userVotes,
  });

  FeebackPageState copyWith({
    List<FeatureRequest>? featureRequests,
    List<FeatureRequestVote>? userVotes,
  }) {
    return FeebackPageState(
      featureRequests: featureRequests ?? this.featureRequests,
      userVotes: userVotes ?? this.userVotes,
    );
  }

  FeebackPageState addVote(FeatureRequest feature, int vote) {
    final index =
        featureRequests.indexWhere((element) => element.id == feature.id);
    if (index == -1) {
      return this;
    }
    final newFeature =
        featureRequests[index].copyWith(votes: feature.votes + vote);
    final newFeatureRequests = List<FeatureRequest>.from(featureRequests);
    newFeatureRequests[index] = newFeature;
    return copyWith(featureRequests: newFeatureRequests);
  }

  bool hasVoted(FeatureRequest feature) {
    return userVotes.any((element) => element.featureId == feature.id);
  }

  bool canVote() {
    return userVotes.isEmpty;
  }
}
