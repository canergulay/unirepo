import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';
/*
class FirebaseConvertersRef {
  static CollectionReference getConverter<T extends MapConverter>({required T responseType}) {
    return FirebaseFirestore.instance.collection(FirebaseCollectionPaths.getCollectionName<T>()).withConverter(
          fromFirestore: (snapshot, _) => responseType.fromJson(snapshot.data()),
          toFirestore: (type, _) => responseType.toJson(),
        );
  }
}*/
