/* eslint @typescript-eslint/no-var-requires: 0 */

import * as Storage from "@google-cloud/storage";
import * as fs from "fs";
const spawn = require("child-process-promise").spawn;


export class StorageUploader {
  constructor(
        private bucket: Storage.Bucket,
  ) { }

  async uploadImg(
    imgPath: string,
    destinationPath: string,
    thumbnailPath: string
  ): Promise<[Storage.File, Storage.File]> {
    if (!imgPath) {
      throw new Error("imgFile is null");
    }
    const highRes = await this.uploadFileFromPath(imgPath, destinationPath);
    await spawn("convert", [imgPath, "-thumbnail", "200x200>", imgPath]);
    const thumbnail = await this.uploadFileFromPath(imgPath, thumbnailPath);
    fs.unlinkSync(imgPath);
    return [highRes, thumbnail];
  }

  async uploadFile(file: File, destinationPath: string): Promise<Storage.File> {
    const tmpImgPath = "tmp-img.jpg";
    fs.writeFileSync(tmpImgPath, Buffer.from(await file.arrayBuffer()));
    const res = await this.uploadFileFromPath(tmpImgPath, destinationPath);
    fs.unlinkSync(tmpImgPath);
    return res;
  }

  async uploadFileFromPath(
    filePath: string,
    destinationPath: string,
    contentType = "image/jpeg",
  ): Promise<Storage.File> {
    await this.bucket.upload(filePath, {
      destination: destinationPath,
      metadata: {
        contentType: contentType,
      },
    });
    const uploadedFile = this.bucket.file(destinationPath);
    return uploadedFile;
  }
}
