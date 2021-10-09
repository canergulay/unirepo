import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';

abstract class GetAllUniversitiesRepositaryContract {
  Future<Result<List<University>, Exception>> getAllUniversities();
}
