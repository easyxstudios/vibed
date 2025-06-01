import { Timestamp } from "firebase-admin/firestore";
import { RevenueCatEvent } from "./revenuecat_events";
import * as admin from "firebase-admin";
import { Stores, SubscriptionStatus } from "./subscription_status";
import { UserRepository } from "../../core/data/repositories/user_repository";
import { SubscriptionsRepository } from "../../core/data/repositories/subscription_repository";
import { SubscriptionEntity } from "../../core/data/entities/subscription_entity";

export type Durations = "monthly" | "annual" | "lifetime";

export interface SubscriptionData {
  userId: string;
  status: SubscriptionStatus;
  creationDate: Timestamp;
  lastUpdate: Timestamp;
  expirationDate?: Timestamp;
  store: Stores;
  productId: string;
}

export interface Subscription extends SubscriptionData {}

export class Subscription {
  constructor(
    {
      userId,
      status,
      creationDate,
      lastUpdate,
      expirationDate,
      store,
      productId,
    }: SubscriptionData,
    private subscriptionRepository: SubscriptionsRepository,
  ) {
    this.userId = userId;
    this.status = status;
    this.creationDate = creationDate;
    this.lastUpdate = lastUpdate;
    this.expirationDate = expirationDate;
    this.store = store;
    this.productId = productId;
  }

  static async fromRevenueCat({
    event,
    userRepository,
    subscriptionRepository,
  }: {
    event: RevenueCatEvent;
    userRepository: UserRepository;
    subscriptionRepository: SubscriptionsRepository;
  }): Promise<Subscription> {
    const user = await userRepository.getFromId(event.app_user_id);
    if (!user || !user.id) {
      throw new Error(`User ${event.app_user_id} not found`);
    }
    const subscription = await subscriptionRepository.getFromUserId(user.id);
    const now = admin.firestore.Timestamp.now();
    if (!subscription) {
        return new Subscription({
            userId: user.id,
            status: event.subscriptionStatus,
            creationDate: now,
            lastUpdate: now,
            expirationDate: event.expirationTimestamp,
            store: event.store == "APP_STORE"
                ? Stores.APPLE_STORE
                : Stores.PLAY_STORE,
            productId: event.product_id,
        }, subscriptionRepository);
    }
    return new Subscription({
        userId: user.id,
        status: event.subscriptionStatus,
        creationDate: subscription.creationDate,
        lastUpdate: now,
        expirationDate: event.expirationTimestamp,
        store: event.store == "APP_STORE"
            ? Stores.APPLE_STORE
            : Stores.PLAY_STORE,
        productId: event.product_id,
      }, subscriptionRepository);
  }

  static fromEntity(
    entity: SubscriptionEntity,
    subscriptionRepository: SubscriptionsRepository,
  ): Subscription {
    if (!entity.id) {
        throw new Error("Subscription entity must have an id");
    }
    return new Subscription({
      userId: entity.id!,
      status: entity.status,
      creationDate: entity.creation_date,
      lastUpdate: entity.last_activity,
      expirationDate: entity.expiration_date,
      store: entity.store,
      productId: entity.product_id,
    }, subscriptionRepository);
  }

  static async fromUserId({
    userId,
    subscriptionRepository,
  }: {
    userId: string;
    subscriptionRepository: SubscriptionsRepository;
  }): Promise<Subscription | null> {
    const userAuth = await admin.auth().getUser(userId);
    const isEarlyBird = userAuth.customClaims &&
      userAuth.customClaims.EARLY_BIRD;
    if (isEarlyBird) {
      return new Subscription({
        userId,
        status: SubscriptionStatus.ACTIVE,
        creationDate: admin.firestore.Timestamp.now(),
        lastUpdate: admin.firestore.Timestamp.now(),
        store: Stores.EARLY_BIRD,
        productId: "early_bird",
      }, subscriptionRepository);
    }
    return subscriptionRepository.getFromUserId(userId);
  }

  async save(): Promise<void> {
    await this.subscriptionRepository.save(this);
  }

  get active(): boolean {
    const isActive = this.status == SubscriptionStatus.ACTIVE &&
      this.expirationDate &&
      this.expirationDate.toMillis() >
        admin.firestore.Timestamp.now().toMillis();
    return isActive ?? false;
  }
}
