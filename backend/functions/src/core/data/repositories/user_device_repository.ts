import {UserDeviceAdapter, UserDeviceEntity} from "../entities/user_device_entity";

export class UserDevicesRepository {
  constructor(
        private db: FirebaseFirestore.Firestore,
  ) { }

  private collection(userId: string) {
    return this.db
      .collection("users")
      .doc(userId)
      .collection("devices")
      .withConverter({
        fromFirestore: UserDeviceEntity.fromDocument,
        toFirestore: (device: UserDeviceEntity) => UserDeviceAdapter.toMap(device),
      });
  }

  async getDevices(userIds: string[]): Promise<UserDeviceEntity[]> {
    const result: UserDeviceEntity[] = [];
    for (const userId of userIds) {
      const userResult = await this.collection(userId).get();
      result.push(...userResult.docs.map((doc) => doc.data()));
    }
    return result;
  }

  async delete(userId: string, deviceId: string): Promise<void> {
    await this.collection(userId).doc(deviceId).delete();
  }
}
