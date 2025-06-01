import { Logger } from "../core/logger/logger";
import {usersRepository} from "../core/data/repositories/repositories";
import {notificationsApi} from "../notifications/notifications_api";
import {SystemNotificationParams} from "../notifications/models/notification";
import {onDocumentCreated} from "firebase-functions/v2/firestore";

export const onNewSubscription = onDocumentCreated(
  "subscriptions/{userId}",
  async (event) => {
    if (!event.data) {
      return Promise.resolve();
    }
    const userId = event.params.userId;
    const logger = new Logger("onNewSubscription");
    
    try {
      logger.info(`New subscription for user ${userId}`);
      const user = await usersRepository.getFromId(userId);
      if (!user) {
        logger.error(`User ${userId} not found`);
        return;
      }
      await notificationsApi.notify(
        [userId],
        <SystemNotificationParams> {
          title: "Subscription saved",
          body: "Thank you",
        },
      );
    } catch (error) {
      logger.error(
        `Error processing subscription for user ${userId} : ${error}`,
      );
    }
  });
