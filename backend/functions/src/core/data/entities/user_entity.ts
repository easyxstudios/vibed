import {DocumentSnapshot, QueryDocumentSnapshot, Timestamp} from "firebase-admin/firestore";

export interface UserEntityData {
    id?: string,
    name?: string;
    email?: string;
    creation_date: Timestamp;
    last_update_date: Timestamp;
}

export type NewUserEntityData = Omit<UserEntityData, "id">;

export interface UserEntity extends UserEntityData {}

export class UserEntity {
  constructor({
    id,
    name,
    email,
    creation_date,
    last_update_date,
  }: UserEntityData
  ) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.creation_date = creation_date;
    this.last_update_date = last_update_date;
  }

  static fromData(data: UserEntityData): UserEntity {
    return new UserEntity(data);
  }

  static fromDocument(data: QueryDocumentSnapshot | DocumentSnapshot): UserEntity {
    const result = data.data() as UserEntityData;
    result.id = data.id;
    return new UserEntity(result);
  }
}
