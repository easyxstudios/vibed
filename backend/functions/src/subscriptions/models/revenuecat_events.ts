import {Timestamp} from "firebase-admin/firestore";
import {SubscriptionStatus} from "./subscription_status";

import * as admin from "firebase-admin";

export interface RevenueCatEventData {
    event_timestamp_ms: number; 
    product_id: string;
    period_type: string;
    expiration_at_ms: number | null;
    store: string;
    app_user_id: string;
    type: string;
  }

export interface RevenueCatEvent extends RevenueCatEventData {}


export class RevenueCatEvent {
    constructor({
        event_timestamp_ms,
        product_id,
        period_type,
        expiration_at_ms,
        store,
        app_user_id,
        type,
        }: RevenueCatEventData) {
        this.event_timestamp_ms = event_timestamp_ms;
        this.product_id = product_id;
        this.period_type = period_type;
        this.expiration_at_ms = expiration_at_ms;
        this.store = store;
        this.app_user_id = app_user_id;
        this.type = type;
    }

    static fromJson(json: string): RevenueCatEvent {
        const data = JSON.parse(json);
        return new RevenueCatEvent({
            event_timestamp_ms: parseInt(data.event_timestamp_ms),
            product_id: data.product_id,
            period_type: data.period_type,
            expiration_at_ms: parseInt(data.expiration_at_ms),
            store: data.store,
            app_user_id: data.app_user_id,
            type: data.type,
        });
    }

    static fromData(data: any): RevenueCatEvent {
        return new RevenueCatEvent({...data});
    }

    get expirationTimestamp(): Timestamp | undefined {
        if (!this.expiration_at_ms) {
          return undefined;
        }
        return admin.firestore.Timestamp.fromMillis(this.expiration_at_ms);
    }

    get subscriptionStatus(): SubscriptionStatus {
        switch (this.type) {
            case "INITIAL_PURCHASE":
            case "RENEWAL":
            case "UNCANCELLATION":
            case "SUBSCRIPTION_EXTENDED":
                return SubscriptionStatus.ACTIVE;
            case "CANCELLATION":
            case "SUBSCRIPTION_PAUSED":
            case "EXPIRATION":
                return SubscriptionStatus.EXPIRED;
            case "NON_RENEWING_PURCHASE":
                return SubscriptionStatus.LIFETIME;
            default:
                return SubscriptionStatus.EXPIRED;
        }
    }

    get shouldIgnore(): boolean {
        switch (this.type) {
            case "BILLING_ISSUE":
            case "PRODUCT_CHANGE":
            case "TRANSFER":
            case "TEMPORARY_ENTITLEMENT_GRANT":
                return true;
            default:
                return false;
       }
    }

}