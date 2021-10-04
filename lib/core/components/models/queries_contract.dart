import 'package:cloud_firestore/cloud_firestore.dart';

abstract class QueryContract {
  List<Query> queriesToBeTriggered;
  QueryContract({required this.queriesToBeTriggered});
}
