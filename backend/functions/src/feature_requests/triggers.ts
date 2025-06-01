
import * as admin from "firebase-admin";
import {onDocumentCreated, onDocumentDeleted} from "firebase-functions/v2/firestore";


export const incrementVoteCounter = onDocumentCreated(
    "feature_requests/{id}/votes/{voteId}",
    async (event) => {
        if (!event.data) {
            return Promise.resolve();
        }
        const featureRequestId = event.params.id;
        const firestore = admin.firestore();
        const featureRequestRef = firestore.collection("feature_requests").doc(featureRequestId);

        await featureRequestRef.update({
            votes: admin.firestore.FieldValue.increment(1),
        });
    });


export const decrementVoteCounter = onDocumentDeleted(
    "feature_requests/{id}/votes/{voteId}",
    async (event) => {
        const featureRequestId = event.params.id;
        const firestore = admin.firestore();
        const featureRequestRef = firestore.collection("feature_requests").doc(featureRequestId);

        await featureRequestRef.update({
            votes: admin.firestore.FieldValue.increment(-1),
        });
    });