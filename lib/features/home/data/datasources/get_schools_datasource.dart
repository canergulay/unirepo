import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unirepo/core/components/models/queries_contract.dart';
import 'package:unirepo/core/firebase_manager/mixins/get_documents_mixin.dart';
import 'package:unirepo/core/firebase_manager/mixins/order_mixin.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import '../../../../core/firebase_manager/contracts/firebase_model_contract.dart';

class ReadUniversities extends FirebaseModelContract<University> with GetDocumentsMixin<University> {
  ReadUniversities()
      : super(
          collectionName: 'univercities',
          responseType: University(),
        );
}
