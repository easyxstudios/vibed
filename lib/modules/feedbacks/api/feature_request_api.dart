import 'package:vibed/modules/feedbacks/api/entities/feature_request_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featureRequestApiProvider = Provider<FeatureRequestApi>(
  (ref) => FeatureRequestApi(
    client: FirebaseFirestore.instance,
  ),
);

class FeatureRequestApi {
  final FirebaseFirestore _client;

  FeatureRequestApi({
    required FirebaseFirestore client,
  }) : _client = client;

  CollectionReference<FeatureRequestEntity?> get _collection => _client
      .collection('feature_requests')
      .withConverter(
        fromFirestore: (snapshot, _) {
          if (snapshot.exists) {
            return FeatureRequestEntity.fromJson(snapshot.id, snapshot.data()!);
          }
          return null;
        },
        toFirestore: (data, _) => data!.toJson(),
      );

  Future<List<FeatureRequestEntity>> getAllActive() async {
    final snapshot = await _collection.where('active', isEqualTo: true).get();
    return snapshot.docs.map((e) => e.data()!).toList();
  }
}
