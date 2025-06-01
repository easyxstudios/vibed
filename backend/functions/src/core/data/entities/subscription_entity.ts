import {DocumentData, QueryDocumentSnapshot, Timestamp} from "firebase-admin/firestore";
import {SubscriptionsRepository} from "../repositories/subscription_repository";
import {Stores, SubscriptionStatus} from "../../../subscriptions/models/subscription_status";
import {Subscription} from "../../../subscriptions/models/subscriptions";

export interface SubscriptionEntityData {
    id?: string,
    creation_date: Timestamp;
    last_activity: Timestamp;
    expiration_date?: Timestamp;
    status: SubscriptionStatus;
    store: Stores,
    product_id: string;
}

export type NewSubscriptionEntityData = Omit<SubscriptionEntityData, "id">;

export interface SubscriptionEntity extends SubscriptionEntityData {}

export class SubscriptionEntity {
  constructor({
    id,
    creation_date,
    last_activity,
    expiration_date,
    status,
    store,
    product_id,
  }: SubscriptionEntityData
  ) {
    this.id = id;
    this.creation_date = creation_date;
    this.last_activity = last_activity;
    this.expiration_date = expiration_date;
    this.status = status;
    this.store = store;
    this.product_id = product_id;
  }

  static fromData(data: SubscriptionEntityData): SubscriptionEntity {
    return new SubscriptionEntity(data);
  }

  static fromDocument(data: QueryDocumentSnapshot | DocumentData): SubscriptionEntity {
    const serieData = <SubscriptionEntityData>{
      id: data.id,
      ...data.data(),
    };
    return new SubscriptionEntity(serieData);
  }

  static from(subscription: Subscription): SubscriptionEntity {
    return new SubscriptionEntity({
      id: subscription.userId,
      creation_date: subscription.creationDate,
      last_activity: subscription.lastUpdate,
      expiration_date: subscription.expirationDate,
      status: subscription.status,
      store: subscription.store,
      product_id: subscription.productId,
    });
  }

  toSubscription(subscriptionRepository: SubscriptionsRepository) {
    return new Subscription({
      userId: this.id!,
      creationDate: this.creation_date,
      lastUpdate: this.last_activity,
      expirationDate: this.expiration_date,
      status: this.status,
      store: this.store,
      productId: this.product_id,
    }, subscriptionRepository);
  }
}

