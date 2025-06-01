import {onCall, HttpsError} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {Logger} from "../core/logger/logger";

export const deleteUserAccount = onCall(
    async (request) => {
      if (request == null ) {
        throw new HttpsError("failed-precondition", "The function must be called while authenticated");
      }
      if (!request.auth) {
          throw new HttpsError("unauthenticated", "You must be authenticated to delete your account");
      }
      const logger = new Logger("deleteUserAccount");
      try {
          await admin.auth().deleteUser(request.auth!.uid);
      } catch (e) {
          logger.error(`Error deleteUserAccount users/${request.auth.uid} : ${e}`);
          throw new HttpsError("internal", "Error deleting user account");
      }
    });
