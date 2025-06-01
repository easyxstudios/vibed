import * as admin from "firebase-admin";
import {setGlobalOptions} from "firebase-functions/v2";

// Initialize functions prefered locations
setGlobalOptions({region: "europe-west1"});

admin.initializeApp();

// authentications
exports.authTriggers = require("./authentication/triggers");
exports.authFunctions = require("./authentication/functions");

// notifications
exports.notificationsTriggers = require("./notifications/triggers");

// subscriptions 
// Uncomment this line when you have a subscriptions wit revenuecat
// exports.subscriptions = require("./subscriptions/subscriptions_functions");
