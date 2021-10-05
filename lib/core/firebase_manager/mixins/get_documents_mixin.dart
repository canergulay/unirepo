import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/core/firebase_manager/mixins/order_mixin.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';
import 'package:unirepo/core/firebase_manager/repo/collectiong_getters.dart';

mixin GetDocumentsMixin<T extends MapConverter> {
  Future<List<T>> getDocuments(
      {required T responseType, required String collectionName, required Object orderByField, bool descending = false}) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionPaths.getCollectionName<T>())
        .orderBy(OrderByController.shared.getOrder<T>().field)
        .get();
    return (response.docs.map((e) => responseType.fromJson(e.id, e.data()) as T).toList());
  }
}
