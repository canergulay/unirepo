import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/components/models/map_converter.dart';

class FirebaseModelContract<T extends MapConverter> {
  final T responseType;
  final String collectionName;

  FirebaseModelContract({required this.collectionName, required this.responseType});
}
