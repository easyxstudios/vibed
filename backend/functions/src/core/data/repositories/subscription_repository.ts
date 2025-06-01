import {Subscription} from "../../../subscriptions/models/subscriptions";
import {cleanEntityId} from "../entities/entity_utils";
import {SubscriptionEntity, SubscriptionEntityData} from "../entities/subscription_entity";

export class SubscriptionsRepository {
  constructor(
        private db: FirebaseFirestore.Firestore,
  ) { }

  private collection() {
    return this.db.collection("subscriptions");
  }

  private document(userid: string) {
    return this.collection().doc(userid);
  }

  async save(subscription: Subscription): Promise<void> {
    await this.document(subscription.userId).set(
      SubscriptionAdapter.toMap(SubscriptionEntity.from(subscription))
    );
  }

  async getFromUserId(userId: string): Promise<Subscription | null> {
    const snapshot= await this.document(userId).get();
    if (!snapshot.exists) {
      return null;
    }
    const entity = SubscriptionEntity.fromDocument(snapshot);
    return entity.toSubscription(this);
  }
}


export class SubscriptionAdapter {
  static toMap(data: SubscriptionEntityData): { [key: string]: unknown } {
    const cleanData = cleanEntityId({...data});
    return {
      ...cleanData,
    };
  }
}
