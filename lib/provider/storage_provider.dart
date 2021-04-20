import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kweliscore/provider/providers.dart';

class StorageProvider {
  UploadTask storageUploadTask;
  TaskSnapshot taskSnapshot;
  FirebaseStorage storage;
  DatabaseProvider _databaseProvider;

  StorageProvider() {
    storage = FirebaseStorage.instance;
    _databaseProvider = DatabaseProvider();
  }

  Future<void> startUpload(File file, String uid) async {
    try {
      // Get the current date
      DateTime now = DateTime.now();

      // Convert date to a string
      String dateTimeString = now.toIso8601String();

      // Unique file name for the file
      String filePath = 'statements/$uid/$dateTimeString.pdf';

      //Create a storage reference
      Reference reference = storage.ref().child(filePath);

      //Create a task that will handle the upload
      storageUploadTask = reference.putFile(file);

      // Get a snapshot of the upload
      taskSnapshot = await storageUploadTask;

      // Get the download url
      String urlResult = await taskSnapshot.ref.getDownloadURL();
      await _databaseProvider.saveStatement(uid, urlResult);
    } on FirebaseException {
      rethrow;
    }
  }
}
