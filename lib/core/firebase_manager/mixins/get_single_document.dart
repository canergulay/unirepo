import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/core/firebase_manager/repo/collection_paths_by_type.dart';

import 'order_mixin.dart';

mixin GetSingleConvertedDocument<T extends SingleDocConverter> {
  Future<T> getSingleDocument({required T responseType, required String docID}) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionPaths.getCollectionName<T>())
        .doc(
          docID,
        )
        .get();
    return responseType.fromJson(response.data());
  }
}
