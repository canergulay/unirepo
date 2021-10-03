import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/map_converter.dart';

mixin GetDocumentsMixin<T extends MapConverter> {
  Future<List<T>> getDocuments(
      {required T responseType, required String collectionName, required Object orderByField, bool descending = false}) async {
    final response = await FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter(fromFirestore: (snapshot, _) => responseType.fromJson(snapshot.data()), toFirestore: (type, _) => responseType.toJson())
        .orderBy(orderByField, descending: descending)
        .get();
    return (response.docs.map((e) => e.data() as T).toList());
  }
}
