import {messaging} from "firebase-admin";
import {NotificationType} from "../../core/data/entities/notification_entity";

export type NotificationPayload = messaging.DataMessagePayload & NotificationType;

export interface BasicNotificationParams {
    title: string;
    body: string;
    type: NotificationType;
}

export interface SystemNotificationParams {
    title: string;
    body: string;
    systemNotification: NotificationPayload;
}

export interface SystemOnlyNotificationParams {
    systemNotification: NotificationPayload;
}

export type NotificationParams = BasicNotificationParams | SystemNotificationParams | SystemOnlyNotificationParams;


function isNotificationParams(obj: unknown): obj is BasicNotificationParams {
  if (obj !== null && typeof obj === "object") {
    return "type" in obj;
  }
  return false;
}

function isSystemNotificationParams(obj: unknown): obj is SystemNotificationParams {
  if (obj !== null && typeof obj === "object") {
    return "systemNotification" in obj && "title" in obj;
  }
  return false;
}

function isSystemOnlyNotificationParams(obj: unknown): obj is SystemOnlyNotificationParams {
  if (obj !== null && typeof obj === "object") {
    return "systemNotification" in obj && !("title" in obj);
  }
  return false;
}

export function handleNotificationType(
  params: BasicNotificationParams | SystemNotificationParams | SystemOnlyNotificationParams,
  onBasicNotification?: (params: BasicNotificationParams) => void,
  onSystemNotification?: (params: SystemNotificationParams) => void,
  onSystemOnlyNotification?: (params: SystemOnlyNotificationParams) => void
) {
  if (isNotificationParams(params) && onBasicNotification) {
    onBasicNotification(params);
  } else if (isSystemNotificationParams(params) && onSystemNotification) {
    onSystemNotification(params);
  } else if (isSystemOnlyNotificationParams(params) && onSystemOnlyNotification) {
    onSystemOnlyNotification(params);
  }
}

