import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:unirepo/core/freezed/result/result.dart';

class FireBaseManager {
  static FireBaseManager _instace = FireBaseManager._init();
  static FireBaseManager get instance => _instace;

  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  FireBaseManager._init();

  Future<void> createDocumentInCollection<T>({
    required String docIdToBeCreated,
    required Map<String, dynamic> data,
  }) async {
    await firestoreInstance.collection(FirebaseCollectionPaths.getCollectionName<T>()).doc(docIdToBeCreated).set(data);
  }

  Future<Result<String, Exception>> uploadImage(String filePath, {required String dirName, required String fileName}) async {
    final File _file = File(filePath);
    try {
      TaskSnapshot task = await storage.FirebaseStorage.instance.ref('$dirName/$fileName.jpg').putFile(_file);
      return Result.success(task.ref.fullPath);
    } on storage.FirebaseException catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }

  Future<Result<String, Exception>> getImageFromStorage({
    required String dirName,
    required String fileName,
  }) async {
    try {
      final String url = await FirebaseStorage.instance.ref('$dirName/$fileName.jpg').getDownloadURL();
      return Result.success(url);
    } on storage.FirebaseException catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }
}
