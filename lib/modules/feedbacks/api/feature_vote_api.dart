import 'package:vibed/modules/feedbacks/api/entities/feature_vote_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featureVoteApiProvider = Provider<FeatureVoteApi>(
  (ref) => FeatureVoteApi(
    client: FirebaseFirestore.instance,
  ),
);

class FeatureVoteApi {
  final FirebaseFirestore _client;

  FeatureVoteApi({
    required FirebaseFirestore client,
  }) : _client = client;

  CollectionReference<UserFeatureVoteEntity?> _featureVoteCollection(
          String featureId) =>
      _client
          .collection('feature_requests')
          .doc(featureId)
          .collection('votes')
          .withConverter(
            fromFirestore: (snapshot, _) {
              if (snapshot.exists) {
                return UserFeatureVoteEntity.fromJson(
                    snapshot.id, snapshot.data()!);
              }
              return null;
            },
            toFirestore: (data, _) => data!.toJson(),
          );

  Query<UserFeatureVoteEntity?> get collectionGroup =>
      _client.collectionGroup('votes').withConverter(
            fromFirestore: (snapshot, _) {
              if (snapshot.exists) {
                return UserFeatureVoteEntity.fromJson(
                    snapshot.id, snapshot.data()!);
              }
              return null;
            },
            toFirestore: (data, _) => data!.toJson(),
          );

  Future<List<UserFeatureVoteEntity>> getUserVotes(String userId) async {
    final snapshot =
        await collectionGroup.where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((e) => e.data()!).toList();
  }

  Future<UserFeatureVoteEntity> create(String userId, String featureId) async {
    final result = UserFeatureVoteEntity(
      userId: userId,
      creationDate: DateTime.now(),
      featureId: featureId,
    );
    final ref = await _featureVoteCollection(featureId).add(result);
    return result.copyWith(id: ref.id);
  }

  Future<void> delete(String featureId, String voteId) async {
    await _featureVoteCollection(featureId).doc(voteId).delete();
  }
}
