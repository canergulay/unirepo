import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/init/firebase_manager/contracts/firebase_entity_contract.dart';
import 'package:unirepo/features/home/data/models/university.dart';

class ReadUnivercities extends IFirebaseEntity {
  ReadUnivercities(String collectionName) : super(collectionName, University());
}
