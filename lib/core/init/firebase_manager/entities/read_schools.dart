import 'package:unirepo/core/init/firebase_manager/contracts/firebase_entity_contract.dart';
import 'package:unirepo/features/home/data/models/univercity.dart';

class ReadUnivercities extends IFirebaseEntity<Univercity> {
  ReadUnivercities(String collectionName) : super(collectionName);

  @override
  Future<List<Univercity>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
