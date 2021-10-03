import 'package:unirepo/features/home/data/datasources/get_schools_datasource.dart';
import 'package:unirepo/features/home/data/models/university.dart';
import 'package:unirepo/core/freezed/result.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:unirepo/features/home/domain/repositories/get_all_schools_repositary.dart';

class GetAllUniversitiesRepositary implements GetAllUniversitiesRepositaryContract {
  ReadUnivercities readUnivercities;
  GetAllUniversitiesRepositary({required this.readUnivercities});
  @override
  Future<Result<List<University>, Exception>> getAllUniversities() async {
    try {
      final List<University> docResult = await readUnivercities.getDocuments();
      return Result.success(docResult);
    } catch (e) {
      print(e);
      return Result.error(Exception());
    }
  }
}
