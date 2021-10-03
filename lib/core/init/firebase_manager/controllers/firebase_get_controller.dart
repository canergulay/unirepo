import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/map_converter.dart';

class FirebaseGetController<T extends MapConverter> {
  final T responseType;
  final String collectionName;
  late final instance;

  FirebaseGetController(this.collectionName, this.responseType) {
    instance = FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter(fromFirestore: (snapshot, _) => responseType.fromJson(snapshot.data()), toFirestore: (type, _) => responseType.toJson());
  }
  Future<List<T>> getDocuments() async {
    final response = await FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter(fromFirestore: (snapshot, _) => responseType.fromJson(snapshot.data()), toFirestore: (type, _) => responseType.toJson())
        .get();
    return (response.docs.map((e) => e.data() as T).toList());
  }
}
