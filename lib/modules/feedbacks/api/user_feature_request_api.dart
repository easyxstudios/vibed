import 'package:vibed/modules/feedbacks/api/entities/user_feature_request_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userFeatureRequestApiProvider = Provider<UserFeatureRequestApi>(
  (ref) => UserFeatureRequestApi(
    client: FirebaseFirestore.instance,
  ),
);

class UserFeatureRequestApi {
  final FirebaseFirestore _client;

  UserFeatureRequestApi({
    required FirebaseFirestore client,
  }) : _client = client;

  CollectionReference<UserFeatureRequestEntity?> _collection() =>
      _client.collection('user_feature_requests').withConverter(
            fromFirestore: (snapshot, _) {
              if (snapshot.exists) {
                return UserFeatureRequestEntity.fromJson(
                    snapshot.id, snapshot.data()!);
              }
              return null;
            },
            toFirestore: (data, _) => data!.toJson(),
          );

  Future<void> create(UserFeatureRequestEntity userFeatureRequest) async {
    await _collection().add(userFeatureRequest);
  }
}
