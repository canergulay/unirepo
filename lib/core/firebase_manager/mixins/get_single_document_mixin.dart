import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';

mixin GetSingleDocumentByDocId<T> {
  Future<Map<String, dynamic>> getSingleDocumentWithDocumentId({required String docId}) async {
    final ref = FirebaseFirestore.instance.collection(
      FirebaseCollectionPaths.getCollectionName<T>(),
    );
    final document = await ref.doc(docId).get();
    return Future.value(document.data());
  }
}
