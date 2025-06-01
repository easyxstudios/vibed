import 'dart:async';
import 'dart:typed_data';

import 'package:vibed/core/data/entities/upload_result.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

final storageApiProvider = Provider<StorageApi>(
  (ref) => FirebaseStorageApi(),
);

abstract class StorageApi {
  /// upload a file to firebase storage
  /// and return a stream of the upload progress
  Stream<UploadResult> uploadData(
    Uint8List data,
    String folder,
    String filename, {
    String? mimeType, // ex 'image/jpg'
    bool isPublic = true,
  });

  /// request to delete a file from path
  Future<void> deleteFile(String? path);
}

class FirebaseStorageApi implements StorageApi {
  FirebaseStorageApi();

  @override
  Stream<UploadResult> uploadData(
    Uint8List data,
    String folder,
    String filename, {
    String? mimeType, // ex 'image/jpg'
    bool isPublic = true,
  }) async* {
    final ref = FirebaseStorage.instance
        .ref() //
        .child(folder) //
        .child('/$filename');
    final metadata = SettableMetadata(
      contentType: mimeType,
    );
    final uploadTask = ref.putData(data, metadata);
    yield* uploadTask.snapshotEvents.transform(StreamTransformer.fromHandlers(
      handleData: (event, sink) {
        final progress = event.bytesTransferred / event.totalBytes;
        sink.add(UploadResultProgress(progress));
        if (event.bytesTransferred == event.totalBytes) {
          sink.close();
        }
      },
      handleError: (error, stackTrace, sink) {
        sink.addError(error);
      },
      handleDone: (sink) {
        sink.close();
      },
    ));
    final imagePath = uploadTask.snapshot.ref.fullPath;
    if (!isPublic) {
      yield UploadResultCompleted(
        imagePath: imagePath,
        imagePublicUrl: '',
      );
      return;
    }
    // wait a bit to be sure the file is uploaded (could fire error if too fast)
    await Future.delayed(const Duration(seconds: 1));
    final publicUrl = await FirebaseStorage.instance //
        .ref(imagePath)
        .getDownloadURL();
    yield UploadResultCompleted(
      imagePath: imagePath,
      imagePublicUrl: publicUrl,
    );
  }

  /// generate a public url for a file
  /// without this function, the url is only accessible by the app
  Future<UploadResultCompleted> generatePublicUrl(String path) {
    return FirebaseStorage.instance
        .ref(path)
        .getDownloadURL()
        .then((value) => UploadResultCompleted(
              imagePath: path,
              imagePublicUrl: value,
            ));
  }

  Stream<TaskSnapshot> downloadFile(String path) async* {
    // if (await Permission.storage.request().isDenied) {
    //   throw "Vous devez accepter la permission d'écrire";
    // }
    final fileRef = FirebaseStorage.instance.ref().child(path);
    final fileName = fileRef.name;
    Directory directory;
    if (Platform.isAndroid) {
      directory = Directory("/storage/emulated/0/Download");
    } else {
      directory = (await getExternalStorageDirectory())!;
    }
    final File destinationFile = File('${directory.path}/$fileName');
    if (destinationFile.existsSync()) {
      destinationFile.deleteSync();
    }
    destinationFile.createSync();
    final task = fileRef.writeToFile(destinationFile);
    yield* task.asStream();
  }

  @override
  Future<void> deleteFile(String? path) async {
    final ref = FirebaseStorage.instance.ref(path);
    await ref.delete();
  }
}
