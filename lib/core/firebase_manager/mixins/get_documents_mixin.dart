import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/core/firebase_manager/mixins/order_mixin.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';

mixin GetDocumentsMixin<T extends MapConverter> {
  Future<List<T>> getDocuments(
      {required T responseType, required String collectionName, required Object orderByField, bool descending = false}) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionPaths.getCollectionName<T>())
        .withConverter(fromFirestore: (snapshot, _) => responseType.fromJson(snapshot.data()), toFirestore: (type, _) => responseType.toJson())
        .orderBy(OrderByController.shared.getOrder())
        .get();
    return (response.docs.map((e) => e.data() as T).toList());
  }
}
