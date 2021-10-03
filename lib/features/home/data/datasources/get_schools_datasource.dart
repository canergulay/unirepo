import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/init/firebase_manager/controllers/firebase_get_controller.dart';
import 'package:unirepo/features/home/data/models/university.dart';

class ReadUnivercities extends FirebaseGetController<University> {
  ReadUnivercities() : super('univercities', University());
}
