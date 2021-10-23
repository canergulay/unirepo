import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';

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
}
