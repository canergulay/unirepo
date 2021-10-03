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
}
