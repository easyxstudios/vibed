import { error } from "firebase-functions/logger";
import { https } from "firebase-functions";
import {onRequest} from "firebase-functions/v2/https";
import * as express from "express";
import { Subscription } from "./models/subscriptions";
import {
  subscriptionsRepository,
  usersRepository,
} from "../core/data/repositories/repositories";
import {RevenueCatEvent} from "./models/revenuecat_events";
import {defineSecret} from "firebase-functions/params";


// firebase functions:config:set revenuecat.token=""
const revenuecatToken = defineSecret("revenuecat_webhook_key");

export const onRcPremiumUpdate = onRequest({cors: true, secrets: [revenuecatToken]}, async (
  req: https.Request, 
  res: express.Response,
) => {
    console.log("[onPremiumUpdate]");
    const authorization = req.header("Authorization");
    if (!authorization) {
      console.log("Unauthorized - no token provided");
      res.status(401).send("Unauthorized - no token provided");
      return;
    }
    if (authorization !== revenuecatToken.value()) {
      console.log("Unauthorized - invalid token");
      res.status(401).send("Unauthorized - invalid token");
      return;
    }
    console.log("req.body", JSON.stringify(req.body));
    const event = RevenueCatEvent.fromData({ ...req.body.event });
    console.log("event type", event.type);
    console.log("product id", event.product_id);
    if (event.shouldIgnore) {
      console.log("ignored event");
      res.status(200).send("ignored event");
      return;
    }
    try {
      const subscription = await Subscription.fromRevenueCat({
        event,
        userRepository: usersRepository,
        subscriptionRepository: subscriptionsRepository,
      });
      await subscription.save();
      res.status(200).send("ok");
    } catch (e) {
      error(e);
      res.status(500).send(error);
    }
  });