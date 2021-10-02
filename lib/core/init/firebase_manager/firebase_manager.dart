import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseManager {
  static FireBaseManager _instace = FireBaseManager._init();
  static FireBaseManager get instance => _instace;

  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  FireBaseManager._init();
}
