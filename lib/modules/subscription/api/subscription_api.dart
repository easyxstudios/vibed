import 'package:vibed/modules/subscription/api/entities/subscription_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final subscriptionApiProvider = Provider(
  (ref) => SubscriptionApi(
    client: FirebaseFirestore.instance,
    logger: Logger(),
  ),
);

/// Subscription API
/// Your backend should handle a webhook from the payment provider
/// to update the subscription status
/// Don't save the subscription status in the app,
/// always do this from a webhook call between you backend and the payment provider
class SubscriptionApi {
  final Logger _logger;
  final FirebaseFirestore _client;

  SubscriptionApi({
    required FirebaseFirestore client,
    required Logger logger,
  })  : _client = client,
        _logger = logger;

  CollectionReference<SubscriptionEntity?> _getCollection() => _client
      .collection('subscriptions')
      .withConverter(
        fromFirestore: (snapshot, _) {
          if (snapshot.exists) {
            return SubscriptionEntity.fromJson(snapshot.id, snapshot.data()!);
          }
          return null;
        },
        toFirestore: (data, _) => data!.toJson(),
      );

  Future<SubscriptionEntity?> get(String userId) async {
    return _getCollection().doc(userId).get().then((value) => value.data());
  }
}
