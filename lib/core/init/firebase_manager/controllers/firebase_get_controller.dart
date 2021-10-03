import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/base_from_json.dart';

abstract class FirebaseGetController<T extends BaseResponseContract> {
  final T responseType;
  final String collectionName;
  late final instance;

  FirebaseGetController(this.collectionName, this.responseType) {
    instance = FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter(fromFirestore: (snapshot, _) => responseType.fromJson(snapshot.data()), toFirestore: (type, _) => responseType.toJson());
  }
  Future<List<T>> getDocuments() async {
    List<T> items = await instance.get();
    return items;
  }
}
