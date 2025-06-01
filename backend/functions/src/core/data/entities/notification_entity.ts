import {QueryDocumentSnapshot, Timestamp} from "firebase-admin/firestore";
import {cleanEntityId} from "./entity_utils";

export interface NotificationEntityData {
    id?: string,
    title: string;
    body?: string;
    type?: NotificationTypes,
    creation_date: Timestamp;
    seen_date?: Timestamp;
    notify_user: boolean;
    data?: { [key: string]: any },
}

export enum NotificationTypes {
    WELCOME = "WELCOME",
    OTHER = "OTHER",
}

export interface NotificationType {
    type: NotificationTypes;
}

export type NewNotificationEntityData = Omit<NotificationEntityData, "id">;

export interface NotificationEntity extends NotificationEntityData {}

export class NotificationEntity {
  constructor({
    id,
    title,
    body,
    type,
    creation_date,
    seen_date,
    notify_user,
    data,
  }: NotificationEntityData
  ) {
    this.id = id;
    this.title = title;
    this.body = body;
    this.type = type;
    this.creation_date = creation_date;
    this.seen_date = seen_date;
    this.notify_user = notify_user;
    this.data = data;
  }

  static fromData(data: NotificationEntityData): NotificationEntity {
    return new NotificationEntity(data);
  }

  static fromDocument(data: QueryDocumentSnapshot): NotificationEntity {
    const resData = data.data() as NotificationEntityData;
    resData.id = data.id;
    return new NotificationEntity(resData);
  }
}

export class NotificationAdapter {
  static toMap(data: NewNotificationEntityData): { [key: string]: unknown } {
    const cleanData = cleanEntityId(data);
    return {
      ...cleanData,
    };
  }
}
