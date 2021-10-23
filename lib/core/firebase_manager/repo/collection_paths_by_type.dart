import 'package:firebase_auth/firebase_auth.dart';
import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';

class FirebaseCollectionPaths {
  static String getCollectionName<T>() {
    return paths[T] ?? 'error';
  }

  static Map<dynamic, String> paths = {
    University: 'univercities',
    Note: "notes",
    User: "users",
  };
}
