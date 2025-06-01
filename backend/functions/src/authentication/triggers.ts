import {Logger} from "../core/logger/logger";

import {UserEntity} from "../core/data/entities/user_entity";
import {notificationsApi} from "../notifications/notifications_api";
import {NotificationPayload, SystemNotificationParams} from "../notifications/models/notification";
import {NotificationTypes} from "../core/data/entities/notification_entity";
import {Timestamp} from "firebase-admin/firestore";
import {usersRepository} from "../core/data/repositories/repositories";
import * as functions from "firebase-functions/v1";

/**
 * Triggered when a new user registers
 * - Create a new user in the database with the user's data
 * - Send a welcome notification (without a system notification)
 *
 * As our rules are set to only allow for update on the user's own document,
 * We will create it here so no one can create a user document for someone else
 */
export const onUserRegistration = functions
  .auth
  .user()
  .onCreate(async (user, _) => {
    const logger = new Logger("onUserRegistration");
    try {
      const exists = await usersRepository.getFromId(user.uid);
      if (exists) {
        logger.info(`User ${user.uid} already exists update email`);
        await usersRepository.updateEmail(user.uid, user.email ?? '');
        return;
      }
      const userEntity = new UserEntity({
        id: user.uid,
        email: user.email,
        name: user.displayName,
        // this could be usefull if you want to send a verification email
        // email_verified: user.emailVerified,
        creation_date: Timestamp.now(),
        last_update_date: Timestamp.now(),
      });
      await usersRepository.create(userEntity);
      await notificationsApi.createNotificationOnly(
        [user.uid],
        <SystemNotificationParams>{
          title: "Welcome !",
          body: "We are happy to have you on board !",
          systemNotification: <NotificationPayload>{
            type: NotificationTypes.WELCOME,
          },
        },
      );
    } catch (e) {
      logger.error(`Error creating users/${user.uid} : ${e}`);
    }
  });
