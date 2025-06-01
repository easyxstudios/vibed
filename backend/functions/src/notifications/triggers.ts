import {messaging} from "firebase-admin";
import {NotificationsApi} from "./notifications_api";
import {Logger} from "../core/logger/logger";
import {NotificationEntity} from "../core/data/entities/notification_entity";
import {userDevicesRepository} from "../core/data/repositories/repositories";
import {onDocumentCreated} from "firebase-functions/v2/firestore";

const kChannelId = "yourAppChannelId";

export const onNewNotificationRequest = onDocumentCreated(
  "users/{userId}/notifications/{notificationId}",
  async (event) => {
    if (!event.data) {
      return;
    }
    const logger = new Logger("onNewNotificationRequest");
    try {
      const notificationEntity = NotificationEntity.fromDocument(event.data);
      const userId = event.params.userId;
      if (!notificationEntity.notify_user) {
        return;
      }
      const notification = <messaging.Notification>{
        title: notificationEntity.title,
        body: notificationEntity.body,
      };
      const data = <{ [key: string]: string }> {
        type: notificationEntity.type,
        title: notificationEntity.title,
        body: notificationEntity.body,
        ...notificationEntity.data,
      };
      const android = <messaging.AndroidConfig>{
        notification: {
          channelId: kChannelId,
        },
      };
      const userDevices = await userDevicesRepository.getDevices([userId]);
      const tokens = userDevices.map((userDevice) => userDevice.token);
      if (tokens.length === 0) {
        logger.info(`No device found for user ${userId}`);
        return;
      }
      const notificationApi = NotificationsApi.create();
      const notificationsResult = await notificationApi.sendSystemNotification(
        tokens, 
        notification, 
        data, 
        android,
        null, 
        null
      );

      const errors = notificationsResult?.responses.filter((response) => !response.success);
      if (errors && errors.length > 0) {
        logger.error(`Error sending notification to user ${userId} : ${errors.length} failed`);
        for (let i = 0; i < errors.length; i++) {
          const error = errors[i];
          const device = userDevices[i];
          logger.error(`Error sending notification to user ${userId} : ${error.error}`);
          await userDevicesRepository.delete(userId, device.id!);
        }
      }
    } catch (e) {
      logger.error(`Error onNewNotificationRequest users/${event.params.userId}/notifications/${event.id} : ${e}`);
    }
  });
