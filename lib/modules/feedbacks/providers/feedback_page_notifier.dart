import 'package:vibed/core/states/translations.dart';
import 'package:vibed/core/states/user_state_notifier.dart';
import 'package:vibed/core/widgets/toast.dart';
import 'package:vibed/modules/feedbacks/models/feature_requests.dart';
import 'package:vibed/modules/feedbacks/models/feedback_state.dart';
import 'package:vibed/modules/feedbacks/repositories/feature_request_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_page_notifier.g.dart';

@Riverpod(keepAlive: false)
class FeedbackPageNotifier extends _$FeedbackPageNotifier {
  @override
  Future<FeebackPageState> build() async {
    final featureRequestRepository = ref.read(featureRequestRepositoryProvider);
    final userState = ref.read(userStateNotifierProvider);

    final userVotes = await featureRequestRepository.getUserVotes(userState.user.idOrThrow);
    final features = await featureRequestRepository.getActiveFeatureRequests();
    features.sort((a, b) => b.votes.compareTo(a.votes));

    return FeebackPageState(
      featureRequests: features,
      userVotes: userVotes,
    );
  }

  Future<void> vote(FeatureRequest featureRequest) async {
    final translations = ref.read(translationsProvider).feature_requests;
    if (state.value!.hasVoted(featureRequest)) {
      await unVote(featureRequest);
      return;
    }
    // Uncomment this code to disable vote if user already voted once
    // if (!state.value!.canVote()) {
    //   ref.read(toastProvider).error(
    //         title: translations.vote_error.title,
    //         text: translations.vote_error.description,
    //       );
    //   return;
    // }
    final oldState = state.value!;
    final featureRequestRepository = ref.read(featureRequestRepositoryProvider);
    final userState = ref.read(userStateNotifierProvider);

    try {
      final userId = userState.user.idOrThrow;

      var newState = state.value!.addVote(featureRequest, 1);
      state = AsyncData(newState);
      state = const AsyncLoading();

      await Future.delayed(const Duration(milliseconds: 500));
      final userVote = await featureRequestRepository.vote(
        userId,
        featureRequest,
      );
      newState = newState.copyWith(userVotes: [
        ...newState.userVotes,
        userVote,
      ]);
      state = AsyncData(newState);
      ref.read(toastProvider).success(
            title: translations.vote_success.title,
            text: translations.vote_success.description,
          );
    } catch (e) {
      state = AsyncData(oldState);
      ref.read(toastProvider).error(
            title: translations.vote_error.title,
            text: translations.vote_error.description,
          );
    }
  }

  Future<void> unVote(FeatureRequest featureRequest) async {
    final oldState = state.value!;
    state = const AsyncLoading();
    final featureRequestRepository = ref.read(featureRequestRepositoryProvider);
    final userState = ref.read(userStateNotifierProvider);

    try {
      final userId = userState.user.idOrThrow;
      final voteToDelete = state.value!.userVotes
          .where((e) => e.featureId == featureRequest.id)
          .first;
      var newState = state.value!.addVote(featureRequest, -1);
      newState = newState.copyWith(userVotes: [
        ...newState.userVotes.where((e) => e.featureId != featureRequest.id),
      ]);
      state = AsyncData(newState);

      await Future.delayed(const Duration(milliseconds: 500));
      await featureRequestRepository.removeVote(userId, voteToDelete);
    } catch (e) {
      debugPrint("Error while unvoting: $e");
      state = AsyncData(oldState);
    }
  }

  Future<void> createFeatureSuggestion({
    String? title,
    String? description,
  }) async {
    final userState = ref.read(userStateNotifierProvider);
    final userId = userState.user.idOrThrow;
    final featureRequestRepository = ref.read(featureRequestRepositoryProvider);
    if (title == null ||
        description == null ||
        title.isEmpty ||
        description.isEmpty) {
      ref.read(toastProvider).error(
            title: "Error",
            text: "Title and description are required",
          );
      return;
    }
    if (description.length < 5) {
      ref.read(toastProvider).error(
            title: "Error",
            text: "Description is too short. Please provide more details",
          );
      return;
    }
    await featureRequestRepository.createNewFeatureSuggestion(
      userId: userId,
      title: title,
      description: description,
    );
  }
}
