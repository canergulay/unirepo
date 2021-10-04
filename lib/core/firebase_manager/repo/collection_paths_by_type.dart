import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/features/home/data/models/university.dart';

class FirebaseCollectionPaths {
  static String getCollectionName<T>() {
    return paths[T] ?? 'error';
  }

  static Map<dynamic, String> paths = {
    University: 'university',
  };
}
