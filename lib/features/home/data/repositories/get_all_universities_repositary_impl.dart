import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/features/home/data/datasources/get_schools_datasource.dart';
import 'package:unirepo/features/home/data/models/course_prefix.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import 'package:unirepo/core/freezed/result.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:unirepo/features/home/domain/repositories/get_all_schools_repositary.dart';

class GetUniversitiesRepositary implements GetAllUniversitiesRepositaryContract {
  ReadUniversities readUniversities;
  GetUniversitiesRepositary({required this.readUniversities});
  @override
  Future<Result<List<University>, Exception>> getAllUniversities() async {
    try {
      final List<University> docResult = await readUniversities.getDocuments(
        responseType: University(),
        orderByField: 'id',
      );
      return Result.success(docResult);
    } catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }

  Future<Result<List<CoursePrefix>, Exception>> getSupportedPrefices(String docID) async {
    try {
      final response = await readUniversities.getSingleDocumentWithDocumentId(docId: docID);
      final List<dynamic> documentReferences = response['courses'];
      final List<CoursePrefix> coursePrefices = await coursePrefixGetter(documentReferences);
      return Result.success(coursePrefices);
    } catch (e) {
      return Result.error(Exception('houston we got a problem!'));
    }
  }

  Future<List<CoursePrefix>> coursePrefixGetter(List<dynamic> courseDocumentList) async {
    final List<CoursePrefix> _coursePreficesToBeReturned = [];
    for (var coursePrefix in courseDocumentList) {
      final supportedPrefix = await coursePrefix.get();
      _coursePreficesToBeReturned.add(CoursePrefix.fromJson(supportedPrefix.data()));
    }
    return _coursePreficesToBeReturned;
  }
}
