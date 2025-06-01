import {NotificationEntity, NotificationAdapter} from "../entities/notification_entity";


export class UserNotificationsRepository {
  constructor(
        private db: FirebaseFirestore.Firestore,
  ) { }

  private collection(userId: string) {
    return this.db
      .collection("users")
      .doc(userId)
      .collection("notifications")
      .withConverter({
        fromFirestore: (snapshot: FirebaseFirestore.QueryDocumentSnapshot) => {
          return NotificationEntity.fromDocument(snapshot);
        },
        toFirestore: (notification: NotificationEntity) => NotificationAdapter.toMap(notification),
      });
  }

  async save(userId: string, notification: NotificationEntity): Promise<NotificationEntity> {
    const res = await this.collection(userId).add(notification);
    notification.id = res.id;
    return notification;
  }

  async getLast(userId: string): Promise<NotificationEntity | undefined> {
    const res = await this.collection(userId)
      .orderBy("creation_date", "desc")
      .limit(1)
      .get();
    if (res.empty) {
      return undefined;
    }
    return res.docs[0].data();
  }

  async saveAll(userIds: string[], notifications: NotificationEntity): Promise<void> {
    const chunkSize = 500;
    const processedUserIds: string[] = [];
    while (processedUserIds.length < userIds.length) {
      const chunk = userIds.slice(processedUserIds.length, processedUserIds.length + chunkSize);
      const batch = this.db.batch();
      try {
        for (const userId of userIds) {
          const userRef = this.collection(userId);
          batch.create(userRef.doc(), notifications);
        }
        await batch.commit();
      } catch (e) {
        console.error(e);
        throw Error("Error saving notifications");
      }
      processedUserIds.push(...chunk);
    }
  }
}
