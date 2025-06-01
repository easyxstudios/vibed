import {QueryDocumentSnapshot, Timestamp} from "firebase-admin/firestore";
import {cleanEntityId} from "./entity_utils";

export enum UserDeviceTypes {
    ANDROID = "ANDROID",
    IOS = "IOS",
}

export interface UserDeviceEntityData {
    id?: string,
    token: string;
    device_id: string;
    type: UserDeviceTypes;
    creation_date: Timestamp;
}

export type NewUserDeviceEntityData = Omit<UserDeviceEntityData, "id">;

export interface UserDeviceEntity extends UserDeviceEntityData {}

export class UserDeviceEntity {
  constructor({
    id,
    token,
    device_id,
    type,
    creation_date,
  }: UserDeviceEntityData
  ) {
    this.id = id;
    this.token = token;
    this.device_id = device_id;
    this.type = type;
    this.creation_date = creation_date;
  }

  static fromData(data: UserDeviceEntityData): UserDeviceEntity {
    return new UserDeviceEntity(data);
  }

  static fromDocument(data: QueryDocumentSnapshot): UserDeviceEntity {
    const resData = data.data() as UserDeviceEntityData;
    resData.id = data.id;
    return new UserDeviceEntity(resData);
  }
}

export class UserDeviceAdapter {
  static toMap(data: UserDeviceEntityData): { [key: string]: unknown } {
    const cleanData = cleanEntityId(data);
    return {
      ...cleanData,
    };
  }
}
