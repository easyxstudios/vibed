import {SubscriptionsRepository} from "./subscription_repository";
import {UserDevicesRepository} from "./user_device_repository";
import {UserNotificationsRepository} from "./user_notifications_repository";
import {UserRepository} from "./user_repository";
import * as admin from "firebase-admin";

// One of the best practices for cloud function is
// Use global variables to reuse objects in future invocations
// https://firebase.google.com/docs/functions/tips#use_global_variables_to_reuse_objects_in_future_invocations

const firestore = admin.firestore();

export const usersRepository = new UserRepository(firestore);
export const notificationsRepository = new UserNotificationsRepository(firestore);
export const userDevicesRepository = new UserDevicesRepository(firestore);
export const subscriptionsRepository = new SubscriptionsRepository(firestore);
