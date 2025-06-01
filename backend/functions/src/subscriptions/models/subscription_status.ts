export const SubscriptionStatus = {
  ACTIVE: "ACTIVE",
  PAUSED: "PAUSED",
  EXPIRED: "EXPIRED",
  LIFETIME: "LIFETIME",
} as const;

type ObjectValues<T> = T[keyof T];

export type SubscriptionStatus = ObjectValues<typeof SubscriptionStatus>;

export const Stores = {
  PLAY_STORE: "PLAY_STORE",
  APPLE_STORE: "APPLE_STORE",
  EARLY_BIRD: "EARLY_BIRD",
};

export type Stores = ObjectValues<typeof Stores>;
